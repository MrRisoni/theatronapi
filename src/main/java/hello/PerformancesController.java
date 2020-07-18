package hello;


import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import hello.otherPojos.PerformancesResult;
import models.HibernateUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin
@RestController
public class PerformancesController {

    @Value("${app.today}")
    private String currentDate;

    @RequestMapping(value=  "/api/performances" , method = RequestMethod.GET)
    public List<PerformancesResult> getPerformancesList()
    {
        try {

           String q = " SELECT theaterSeats.totalSeats, " +
                   "      AVG(IF ( orderItems.tickets IS NULL,0,orderItems.tickets))  AS totalTickets, " +
                   "    t.tht_id AS theaterId, p.per_id AS performanceId, " +
                   "    p.per_duration AS duration, t.tht_name AS theaterName, " +
                   "    p.per_from_date AS fromDate, p.per_to_date AS toDate, " +
                   "    ply.ply_title AS playName , G.gen_title AS genreTitle, " +
                   "    prices.minPrice, prices.maxPrice, p.per_season_id AS seasonId,a.aut_name  " +
                   "    FROM  performance_dates " +
                   "    JOIN performance p ON (p.per_id = prd_performance_id AND p.per_season_id = prd_season_id) " +
                   "    JOIN people pl   ON  pl.ppl_id = per_director_id " +
                   "    JOIN theaters t ON t.tht_id = p.per_theater_id " +
                   "    JOIN plays ply ON ply.ply_id =  per_play_id " +
                   "    JOIN authors a ON a.aut_id = ply.ply_author_id " +
                   "    JOIN genres G ON G.gen_id = ply.ply_genre_id " +
                   "    JOIN ( " +
                   "        SELECT pri_performance_id, MIN(pri_price) AS minPrice, MAX(pri_price )  AS maxPrice FROM pricing " +
                   "        JOIN performance p ON ( p.per_id = pri_performance_id " +
                   "        AND pri_seasonid =  pri_seasonid ) " +
                   "        WHERE  pri_type_id =1 " +
                   "        GROUP BY pri_performance_id " +
                   "    ) AS prices ON prices.pri_performance_id = p.per_id " +
                   "    JOIN ( " +
                   "            SELECT scr_theater_id, COUNT(scr_id) AS totalSeats " +
                   "            FROM  seatfloor  " +
                   "            GROUP BY scr_theater_id ) AS theaterSeats ON  theaterSeats.scr_theater_id = p.per_theater_id " +
                   "    LEFT JOIN ( " +
                   "            SELECT  ord_perf_date_id, COUNT(itm_id) AS tickets  FROM order_item " +
                   "            JOIN orders ON itm_order_id = ord_id " +
                   "            JOIN performance p ON (p.per_id = ord_performance_id AND p.per_season_id = ord_season_id) " +
                   "            WHERE itm_void =0  AND ord_void =0 " +
                   "            GROUP BY  ord_perf_date_id ) AS orderItems ON orderItems.ord_perf_date_id = prd_id " +
                   "    WHERE   '" + this.currentDate + "' >= p.per_from_date  AND  p.per_to_date >= '" + this.currentDate + "' " +
                   " GROUP BY prd_performance_id ";

            List<Object[]> data = HibernateUtil.getEM().createNativeQuery(q).getResultList();

            ArrayList<PerformancesResult> resultList = new ArrayList<PerformancesResult>();
            DecimalFormat df = new DecimalFormat("###.###");

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
            return  resultList;
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            return null;
        }
    }

}