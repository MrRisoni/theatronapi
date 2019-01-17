package hello;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.google.gson.Gson;
import general.HttpRequests;
import hello.seatPojos.SeatAttributes;
import models.HibernateUtil;
import models.PerformanceModel;
import models.SeatMapModel;
import org.hibernate.Session;
import org.springframework.web.bind.annotation.*;
import pay.Payment;
import hello.bookPojos.BookPayload;
import hello.bookPojos.Order;
import hello.bookPojos.Seat;
import pay.PaymentResponse;

@CrossOrigin
@RestController
public class BookController {

    @RequestMapping(value=  "/api/prebook" , method = RequestMethod.GET)
    public String getPreBookData() {
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

            q= " SELECT itm_seatno FROM order_item " +
                    "JOIN orders ON ord_id = itm_order_id " +
                    "WHERE itm_void =0 " +
                    "AND ord_void =0 " +
                    "AND ord_performance_id =1 " +
                    "AND ord_date = '2019-01-07'";

            List<Object[]> takenseats = session.createNativeQuery(q)
                    .getResultList();

//
            List<PerformanceModel> prfList = session.createCriteria(PerformanceModel.class).list();

            ArrayList<String> resultObject = new ArrayList<String>();
            resultObject.add(ow.writeValueAsString(prfList.get(0)));
            resultObject.add(ow.writeValueAsString(takenseats.get(0)));
            resultObject.add(ow.writeValueAsString(rowMappings));

            Map<String, Object> resultObj = new HashMap<>();
            resultObj.put("performance", prfList.get(0));
            resultObj.put("taken", takenseats.get(0));
            resultObj.put("seatmap", rowMappings);


            session.close();
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



    @PostMapping(value = "/api/book")
    public String bookSeats(@RequestParam  BookPayload postData) {

        try {
            System.out.println("print post params");
            System.out.println(postData);


            HttpRequests req = new HttpRequests("http://localhost:3000/api/banks/ok");
            Payment pay = new Payment(req);

            Order ord = new Order();
            ord.setEmail("foo@foo");

            Seat st = new Seat();
            st.setPaxType("ADT");
            st.setSeatNo("AB1");

            BookPayload pl = new BookPayload();
            pl.setDetails(ord);
            ArrayList<Seat> seatList = new ArrayList<Seat>();
            seatList.add(st);


       /* pay.setPayload(pl);

        PaymentResponse payRsp = pay.settle();
        System.out.println(payRsp.getBankRsp().getTransactionId());


        BookCtrlResponse bookCtrlResponse = new BookCtrlResponse();
        bookCtrlResponse.transactionId = payRsp.getBankRsp().getTransactionId();

        Gson g = new Gson();
        return g.toJson(bookCtrlResponse); */
            return "lol";
        }
        catch (Exception ex)
        {
            return "err on params + " + ex.getMessage();
        }
    }
}
