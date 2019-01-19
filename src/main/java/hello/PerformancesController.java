package hello;


import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import hello.otherPojos.PerformancesResult;
import models.HibernateUtil;
import org.hibernate.Session;
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

            // fetch total empty seats
            String q =  " SELECT t.tht_id AS theaterId, p.per_id AS performanceId, p.per_duration AS duration, " +
                    "t.tht_name AS theaterName,  ply.ply_title AS playName, p.per_season_id AS seasonId, " +
                    " p.per_from_date AS fromDate, p.per_to_date AS toDate " +
                    " FROM  performance p " +
                    " JOIN people pl   ON  pl.ppl_id = per_director_id " +
                    " JOIN theaters t ON T.tht_id = p.per_theater_id " +
                    " JOIN plays ply ON ply.ply_id =  per_play_id " +
                    " JOIN genres G ON G.gen_id = ply.ply_genre_id " +
            " JOIN authors a ON a.aut_id = ply.ply_author_id " +
                    " WHERE  CURRENT_DATE >= p.per_from_date  " +
                    " AND  p.per_to_date >= CURRENT_DATE ";

            List<Object[]> data = session.createNativeQuery(q)
                    .getResultList();

            ArrayList<PerformancesResult> resultList = new ArrayList<PerformancesResult>();

            for (Object[] obj : data) {
                PerformancesResult prf = new PerformancesResult();
                prf.setTheaterId((Integer) obj[0] );
                prf.setPerformanceId( (BigInteger) obj[1]);
                prf.setDuration( (Short) obj[2]);
                prf.setTheaterName((String) obj[3]);
                prf.setPlayName((String) obj[4]);
                prf.setFromDate( (Date) obj[6]);
                prf.setToDate( (Date) obj[7]);
                prf.setSeasonId( (Byte) obj[5]);

                resultList.add(prf);
            }

            return  ow.writeValueAsString(resultList);

        }
        catch(Exception ex)
        {
            return ex.getMessage();
        }
    }







}