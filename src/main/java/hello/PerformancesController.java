package hello;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import models.PerformanceModel;
import models.HibernateUtil;
import models.SeatMapModel;
import org.hibernate.Session;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


@CrossOrigin
@RestController
public class PerformancesController {

    @RequestMapping(value=  "/api/performances" , method = RequestMethod.GET)
    public String getPerformancesList()
    {
        Session session = null;
        ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();

        try {
            session = HibernateUtil.getSessionFactory().openSession();

            String q =  " SELECT p.per_duration, pl.ppl_fullname, t.tht_name, " +
                    "  ply.ply_title, a.aut_name " +
                    " FROM  performance p " +
                    " JOIN people pl   ON  pl.ppl_id = per_director_id " +
                    " JOIN theaters t ON T.tht_id = p.per_theater_id " +
                    " JOIN plays ply ON ply.ply_id =  per_play_id " +
                    " JOIN authors a ON a.aut_id = ply.ply_author_id " +
                    " WHERE  CURRENT_DATE >= p.per_from_date  " +
                    " AND  p.per_to_date >= CURRENT_DATE ";
            List<Object[]> persons = session.createNativeQuery(q)
                    .getResultList();

            return  ow.writeValueAsString(persons);

        }
        catch(Exception ex)
        {
            ex.printStackTrace();

            return ex.getMessage();
        }
    }




    @RequestMapping(value= "/api/performance" ,method = RequestMethod.GET)
    public String getPerformance()
    {
        Session session = null;
        ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();

        try {
            session = HibernateUtil.getSessionFactory().openSession();

            List<PerformanceModel> prfList = session.createCriteria(PerformanceModel.class).list();
            for (PerformanceModel prf : prfList) {
                System.out.println(prf);
            }


            return  ow.writeValueAsString(prfList.get(0));

        }
        catch(Exception ex)
        {
            ex.printStackTrace();

            return ex.getMessage();
        }
    }


}