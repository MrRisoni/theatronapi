package hello;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import hello.seatPojos.SeatAttributes;
import models.HibernateUtil;
import models.PerformanceModel;
import models.SeatFloorModel;
import models.ZoneModel;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@CrossOrigin
@RestController
public class PreBookController {

    @RequestMapping(value=  "/api/seatfloor/{theatherId}" , method = RequestMethod.GET)
    public String getSeatFloor(@PathVariable String theatherId) {
        Session session =  HibernateUtil.getSessionFactory().openSession();
        try {
            List<ZoneModel> results =session.createCriteria(ZoneModel.class)
                    .add( Restrictions.eq("theaterId", Integer.parseInt(theatherId)) )
                    .list();

            ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();

            return ow.writeValueAsString(results);

        }
        catch(Exception ex){
            return ex.getMessage();
        }
    }
/*
    @RequestMapping(value=  "/api/prebook/{performanceId}" , method = RequestMethod.GET)
    public String getPreBookData(@PathVariable String performanceId) {
        try {

            Session session =  HibernateUtil.getSessionFactory().openSession();

            System.out.println("Received at route " + performanceId);

            // get theaterId
            String qTheaterId = "SELECT per_theater_id FROM performance WHERE per_id = '" + performanceId + "'";
            List<Object> resultTheater = session.createNativeQuery(qTheaterId).getResultList();
            String theaterId = resultTheater.get(0).toString();

            System.out.println("theaterId " + theaterId);


            String q= " SELECT MAX(smp_rowid) AS maxId, MIN(smp_rowid) AS minId, MAX(smp_colid) AS maxColId " +
                    "FROM  seatmap " +
                    "WHERE smp_theater_id = '" + theaterId + "' ";

            List<Object[]> resultsMaxMin = session.createNativeQuery(q).getResultList();
            System.out.println(resultsMaxMin);
            short maxId = (Short) resultsMaxMin.get(0)[0];
            short minId = (Short) resultsMaxMin.get(0)[1];
            short maxColId = (Short) resultsMaxMin.get(0)[2];

            System.out.println(minId + " " + maxId);


            ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
            System.out.println("ob writer  ");


            List<SeatMapModel> results =session.createCriteria(SeatMapModel.class)
                    .add( Restrictions.eq("theaterId", Integer.parseInt(theaterId)) )
                    .list();

            Map<Short, Map<Integer, SeatAttributes>> rowMappings = new HashMap<>();
            for (short rowId = minId; rowId <= maxId; rowId++) {
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

            q= " SELECT itm_seatno FROM order_item " +
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


            Map<String, Object> resultObj = new HashMap<>();
            resultObj.put("performance", prfList.get(0));
            if (takenseats.size() >0) {
                resultObj.put("taken", takenseats.get(0));
            }
            else {
                resultObj.put("taken", null);
            }
            resultObj.put("seatmap", rowMappings);
            resultObj.put("maxCols", maxColId);
            resultObj.put("maxRows", maxId);

            System.out.println("Received at route " + performanceId);

           // session.close();
            return  ow.writeValueAsString(resultObj);


        }
        catch (Exception ex)
        {
            System.out.println("ERROR ");

            System.out.println(ex.getMessage());
            ex.printStackTrace();

            return ex.getMessage();
        }
    }
*/
}
