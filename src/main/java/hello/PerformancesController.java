package hello;


import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.beust.jcommander.converters.BigDecimalConverter;
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

           String q = " SELECT theaterSeats.totalSeats,\n" +
                   "      AVG(IF ( orderItems.tickets IS NULL,0,orderItems.tickets))  AS totalTickets,\n" +
                   "    t.tht_id AS theaterId, p.per_id AS performanceId,\n" +
                   "    p.per_duration AS duration, t.tht_name AS theaterName,\n" +
                   "    p.per_from_date AS fromDate, p.per_to_date AS toDate,\n" +
                   "    ply.ply_title AS playName , G.gen_title AS genreTitle,\n" +
                   "    prices.minPrice, prices.maxPrice, p.per_season_id AS seasonId,a.aut_name \n" +
                   "    FROM  performance_dates\n" +
                   "    JOIN performance p ON (p.per_id = prd_performance_id AND p.per_season_id = prd_season_id)\n" +
                   "    JOIN people pl   ON  pl.ppl_id = per_director_id\n" +
                   "    JOIN theaters t ON T.tht_id = p.per_theater_id\n" +
                   "    JOIN plays ply ON ply.ply_id =  per_play_id\n" +
                   "    JOIN authors a ON a.aut_id = ply.ply_author_id\n" +
                   "    JOIN genres G ON G.gen_id = ply.ply_genre_id\n" +
                   "    JOIN (\n" +
                   "        SELECT pri_performance_id, MIN(pri_price) AS minPrice, MAX(pri_price )  AS maxPrice FROM pricing\n" +
                   "        JOIN performance p ON ( P.per_id = pri_performance_id\n" +
                   "        AND pri_seasonid =  pri_seasonid )\n" +
                   "        WHERE  pri_type_id =1\n" +
                   "        GROUP BY pri_performance_id\n" +
                   "    ) AS prices ON prices.pri_performance_id = p.per_id\n" +
                   "    JOIN (\n" +
                   "            SELECT scr_theater_id, COUNT(scr_id) AS totalSeats\n" +
                   "            FROM  seatfloor \n" +
                   "            GROUP BY scr_theater_id ) AS theaterSeats ON  theaterSeats.scr_theater_id = p.per_theater_id\n" +
                   "    LEFT JOIN (\n" +
                   "            SELECT  ord_perf_date_id, COUNT(itm_id) AS tickets  FROM order_item\n" +
                   "            JOIN orders ON itm_order_id = ord_id\n" +
                   "            JOIN performance p ON (p.per_id = ord_performance_id AND p.per_season_id = ord_season_id)\n" +
                   "            WHERE itm_void =0  AND ord_void =0\n" +
                   "            GROUP BY  ord_perf_date_id ) AS orderItems ON orderItems.ord_perf_date_id = prd_id\n" +
                   "    WHERE  CURRENT_DATE >= p.per_from_date  AND  p.per_to_date >= CURRENT_DATE\n" +
                   " GROUP BY prd_performance_id ";

            List<Object[]> data = session.createNativeQuery(q)
                    .getResultList();


            ArrayList<PerformancesResult> resultList = new ArrayList<PerformancesResult>();

            for (Object[] obj : data) {
                PerformancesResult prf = new PerformancesResult();

                BigDecimal ticketsDecimal = (BigDecimal) obj[1];
                Double ticketsDouble = ticketsDecimal.doubleValue();
                System.out.println("tikets");

                BigInteger seatsDecimal = (BigInteger) obj[0];
                Double seatsDouble = seatsDecimal.doubleValue();

                System.out.println("seats");

                BigDecimal maxPrice  = (BigDecimal)   obj[11];
                BigDecimal minPrice  = (BigDecimal)   obj[10];

                Byte  seasonId = (Byte)  obj[12];

                prf.setAvgCapacity( 100 * ticketsDouble / seatsDouble );
                prf.setTheaterId((Integer) obj[2] );
                prf.setPerformanceId( (BigInteger) obj[3]);
                prf.setDuration( (Short) obj[4]);
                prf.setTheaterName((String) obj[5]);
                prf.setFromDate( (Date) obj[6]);
                prf.setToDate( (Date) obj[7]);
                prf.setPlayName( (String) obj[8]);
                prf.setGenre((String) obj[9]);
                prf.setMinPrice( minPrice.doubleValue());
                prf.setMaxPrice(maxPrice.doubleValue());
                prf.setSeasonId( seasonId.intValue() );
                prf.setAuthorName( (String) obj[13]);

                resultList.add(prf);
            }

            return  ow.writeValueAsString(resultList);

        }
        catch(Exception ex)
        {
            //ex.printStackTrace();
            return "ERROR  " + ex.getMessage();
        }
    }







}