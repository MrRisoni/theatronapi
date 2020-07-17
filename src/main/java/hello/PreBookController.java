package hello;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import hello.bookPojos.Seat;
import hello.seatPojos.SeatAttributes;
import models.*;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import repos.SprTheaterRepository;

import javax.persistence.EntityManager;
import java.util.*;
import java.util.stream.Collectors;

@CrossOrigin
@RestController
public class PreBookController {

    @Autowired
    SprTheaterRepository theaterRepo;

    @RequestMapping(value=  "/api/prebook/{performanceId}" , method = RequestMethod.GET)
    public  Map<String, Object> getPreBookData(@PathVariable String performanceId) {
        try {

            Session session =  HibernateUtil.getSessionFactory().openSession();
            EntityManager em = HibernateUtil.getEM();

            String qTheaterId = "SELECT per_theater_id FROM performance WHERE per_id = '" + performanceId + "'";
            List<Object> resultTheater = session.createNativeQuery(qTheaterId).getResultList();
            String theaterId = resultTheater.get(0).toString();
            Integer theaterLid = Integer.parseInt(theaterId);

            Optional<TheaterModel> fetch = theaterRepo.findById(theaterLid);
            TheaterModel theatronObj = fetch.orElse(null);

            System.out.println("theaterId " + theaterId);


            String q= " SELECT itm_seatno FROM order_item " +
                    "JOIN orders ON ord_id = itm_order_id " +
                    " JOIN performance p ON ( p.per_id = ord_performance_id " +
                    " AND p.per_season_id = ord_season_id " +
                    " ) " +
            "WHERE itm_void =0 " +
                    "AND ord_void =0 AND ord_success =1 " +
                    "AND ord_performance_id = '"+ performanceId +"' " +
                    "AND ord_date = '2019-01-07'";

            List<Object[]> takenseats = session.createNativeQuery(q)
                    .getResultList();

//
            List<PerformanceModel> prfList = session.createCriteria(PerformanceModel.class)
                    .add( Restrictions.eq("id", Integer.parseInt(performanceId)) )
                    .list();

            List<SeatFloorModel> seatsListResult = em.createQuery("SELECT stfm FROM SeatFloorModel stfm " +
                    " JOIN stfm.theatronObj " +
                    "WHERE stfm.theatronObj.id = :theater_id", SeatFloorModel.class).setParameter("theater_id",theaterLid).getResultList();
            List<SeatFloorModel> seatsList = seatsListResult.stream().map(seatItm -> {
                seatItm.setTheatronObj(null);// stops infinite recursion in querying
                return  seatItm;
            }).collect(Collectors.toList());


            List<ZoneModel> zoneList =session.createCriteria(ZoneModel.class)
                    .add( Restrictions.eq("theaterId", Integer.parseInt(theaterId)) )
                    .list();



            Map<String, Object> resultObj = new HashMap<>();
            resultObj.put("performance", prfList.get(0));
            if (takenseats.size() >0) {
                resultObj.put("taken", takenseats.get(0));
            }
            else {
                resultObj.put("taken", null);
            }
                System.out.println("Received at route " + performanceId);

            resultObj.put("seats", seatsList);
            resultObj.put("zones", zoneList);


            return resultObj;
        }
        catch (Exception ex)
        {
            System.out.println("ERROR ");
            System.out.println(ex.getMessage());
            ex.printStackTrace();
            return null;
        }
    }
}
