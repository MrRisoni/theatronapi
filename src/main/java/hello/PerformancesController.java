package hello;

import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import models.PerformanceModel;
import models.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.persistence.criteria.CriteriaBuilder;

@RestController
public class PerformancesController {


    @RequestMapping("/api/performances")
    public String getPerformances()
    {
        Session session = null;
        ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();

        try {
            session = HibernateUtil.getSessionFactory().openSession();

            List<PerformanceModel> prfList = session.createCriteria(PerformanceModel.class).list();
            for (PerformanceModel prf : prfList) {
                System.out.println(prf);
            }

            return  ow.writeValueAsString(prfList);

        }
        catch(Exception ex)
        {
            ex.printStackTrace();

            return ex.getMessage();
        }
    }


}
