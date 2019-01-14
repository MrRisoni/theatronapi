package hello;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import models.HibernateUtil;
import models.SeatMapModel;
import org.hibernate.Session;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


@CrossOrigin
@RestController
public class SeatMapController {



    @RequestMapping(value=  "/api/seatmap" , method = RequestMethod.GET)
    public String getSeatMap()
    {
        try {

            Session session =  HibernateUtil.getSessionFactory().openSession();

            ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
            System.out.println("ob writer  ");


            return  ow.writeValueAsString(session.createCriteria(SeatMapModel.class).list());


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
