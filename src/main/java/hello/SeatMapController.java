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

            ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
            System.out.println("ob writer  ");

            List<SeatMapModel> results =session.createCriteria(SeatMapModel.class).list();
            session.close();


            Map<Integer, Map<Integer, SeatAttributes>> rowMappings = new HashMap<>();
            for (int rowId = 1; rowId < 25; rowId++) {
                Map<Integer, SeatAttributes> colMappings = new HashMap<>();

                for (SeatMapModel sMdl : results) {
                    if (sMdl.getRowId() == rowId) {
                        SeatAttributes str = new SeatAttributes();
                        str.setSeatName(sMdl.getSeatName());
                        str.setZoneCss(sMdl.getZoneInfo().getCss());

                        colMappings.put(sMdl.getColId(), str);
                    }
                }

                rowMappings.put(rowId, colMappings);
            }


           /* Map<Integer, SeatAttributes> colMapping = new HashMap<>();
            ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();

            SeatAttributes atr1  = new SeatAttributes();
            atr1.setSeatName("GOO");
            atr1.setZoneCss("4554ff");

            colMapping.put(2,atr1);

            SeatAttributes atr2  = new SeatAttributes();
            atr1.setSeatName("FOO");
            atr1.setZoneCss("ff09gh");

            colMapping.put(3,atr2);


            Map<Integer, Map<Integer, SeatAttributes>> rowMapping = new HashMap<>();
            rowMapping.put(1, colMapping);


            //
            SeatAttributes atr3  = new SeatAttributes();
            atr1.setSeatName("boo");
            atr1.setZoneCss("45f");

            colMapping.put(5,atr3);

            SeatAttributes atr4  = new SeatAttributes();
            atr1.setSeatName("loo");
            atr1.setZoneCss("f5g");

            colMapping.put(9,atr4);

            rowMapping.put(3, colMapping);*/



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
