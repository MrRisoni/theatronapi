package hello;

import models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import repos.SprPerformanceRepository;

import javax.persistence.EntityManager;
import java.util.*;
import java.util.stream.Collectors;

@CrossOrigin
@RestController
public class PreBookController {

    @Autowired
    SprPerformanceRepository perfRepo;

    @RequestMapping(value=  "/api/prebook/{performanceId}" , method = RequestMethod.GET)
    public  Map<String, Object> getPreBookData(@PathVariable int performanceId) {
        try {

            EntityManager em = HibernateUtil.getEM();

            String qTheaterId = "SELECT per_theater_id FROM performance WHERE per_id = '" + performanceId + "'";
            List<Object> resultTheater = em.createNativeQuery(qTheaterId).getResultList();
            String theaterId = resultTheater.get(0).toString();
            Integer theaterLid = Integer.parseInt(theaterId);


            Optional<PerformanceModel> fetch = perfRepo.findById(performanceId);
            PerformanceModel perfObj = fetch.orElse(null);

            String q= " SELECT itm_seatno FROM order_item " +
                    "JOIN orders ON ord_id = itm_order_id " +
                    " JOIN performance p ON ( p.per_id = ord_performance_id " +
                    " AND p.per_season_id = ord_season_id " +
                    " ) " +
            "WHERE itm_void =0 " +
                    "AND ord_void =0 AND ord_success =1 " +
                    "AND ord_performance_id = '"+ performanceId +"' " +
                    "AND ord_date = '2019-01-07'";

            List<Object[]> takenseats = em.createNativeQuery(q)
                    .getResultList();

            List<SeatFloorModel> seatsListResult = em.createQuery("SELECT stfm FROM SeatFloorModel stfm " +
                    " JOIN stfm.theatronObj " +
                    "WHERE stfm.theatronObj.id = :theater_id", SeatFloorModel.class).setParameter("theater_id",theaterLid).getResultList();
            List<SeatFloorModel> seatsList = seatsListResult.stream().map(seatItm -> {
                seatItm.setTheatronObj(null);// stops infinite recursion in querying
                return  seatItm;
            }).collect(Collectors.toList());

            List<ZoneModel> zoneListResults = em.createQuery("SELECT zon FROM ZoneModel zon " +
                    " JOIN zon.theatronObj " +
                    "WHERE zon.theatronObj.id = :theater_id", ZoneModel.class).setParameter("theater_id",theaterLid).getResultList();

            List<ZoneModel> zoneList = zoneListResults.stream().map(zonItm -> {
               // zonItm.setTheatronObj(null);// stops infinite recursion in querying
                return  zonItm;
            }).collect(Collectors.toList());

            Map<String, Object> resultObj = new HashMap<>();
            resultObj.put("performance", perfObj);
            if (takenseats.size() >0) {
                resultObj.put("taken", takenseats.get(0));
            }
            else {
                resultObj.put("taken", null);
            }

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
