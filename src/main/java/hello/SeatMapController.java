package hello;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import hello.seatPojos.SeatAttributes;
import models.HibernateUtil;
import models.SeatMapModel;
import org.hibernate.Session;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@CrossOrigin
@RestController
public class SeatMapController {



    @RequestMapping(value=  "/api/seatkeys" , method = RequestMethod.GET)
    public String getSeatKeys()
    {
        try {

            Session session =  HibernateUtil.getSessionFactory().openSession();

            String q= " SELECT MAX(smp_rowid) AS maxId, MIN(smp_rowid) AS minId " +
                    "FROM  seatmap " +
                    "WHERE smp_theater_id = 1 ";

            List<Object[]> resultsMaxMin = session.createNativeQuery(q).getResultList();
            System.out.println(resultsMaxMin);
            short maxId = (Short) resultsMaxMin.get(0)[0];
            short minId = (Short) resultsMaxMin.get(0)[1];

            System.out.println(minId + " " + maxId);


            ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
            System.out.println("ob writer  ");

            List<SeatMapModel> results =session.createCriteria(SeatMapModel.class).list();
            session.close();


            Map<Short, Map<Integer, SeatAttributes>> rowMappings = new HashMap<>();
            for (short rowId = minId; rowId < maxId; rowId++) {
                Map<Integer, SeatAttributes> colMappings = new HashMap<>();

                for (SeatMapModel sMdl : results) {
                    if (sMdl.getRowId() == rowId) {
                        SeatAttributes stAtr = new SeatAttributes();
                        stAtr.setSeatName(sMdl.getSeatName());
                        stAtr.setZoneCss(sMdl.getZoneInfo().getCss());
                        stAtr.setZoneId(sMdl.getZoneInfo().getId());

                        colMappings.put(sMdl.getColId(), stAtr);
                    }
                }

                rowMappings.put(rowId, colMappings);
            }



            session.close();
            return  ow.writeValueAsString(rowMappings);


        }
        catch (Exception ex)
        {
            System.out.println("ERROR ");

            System.out.println(ex.getMessage());
            ex.printStackTrace();

            return ex.getMessage();
        }

    }


    @RequestMapping(value=  "/api/seatmap" , method = RequestMethod.GET)
    public String getSeatMap()
    {
        try {

            Session session =  HibernateUtil.getSessionFactory().openSession();

            ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
            System.out.println("ob writer  ");

            List<SeatMapModel> results =session.createCriteria(SeatMapModel.class).list();
            session.close();
            return  ow.writeValueAsString(results);


        }
        catch (Exception ex)
        {
            System.out.println("ERROR ");

            System.out.println(ex.getMessage());
            ex.printStackTrace();

            return ex.getMessage();
        }

    }

    @RequestMapping(value=  "/api/seats" , method = RequestMethod.GET) ///perf_id/date
    public String getFreeSeats()
    {
        Session session = null;
        ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            String q= " SELECT itm_seatno FROM order_item " +
                    "JOIN orders ON ord_id = itm_order_id " +
                    "WHERE itm_void =0 " +
                    "AND ord_void =0 " +
                    "AND ord_performance_id =1 " +
                    "AND ord_date = '2019-01-07'";

            return  ow.writeValueAsString(session.createNativeQuery(q)
                    .getResultList());

        }
        catch(Exception ex)
        {
            ex.printStackTrace();

            return ex.getMessage();
        }
    }
}
