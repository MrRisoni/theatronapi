package hello;


import com.google.gson.Gson;
import models.*;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import hello.bookPojos.BookPayload;
import docs.PDFGenerator;


@CrossOrigin
@RestController
public class BookController {


    @PostMapping(value = "/api/book",
            consumes = {MediaType.APPLICATION_JSON_VALUE},
            produces = {MediaType.APPLICATION_JSON_VALUE}

    )
    public String bookSeats(@RequestBody Object postData) {

        try {
            Gson g = new Gson();

            System.out.println("print json params");

            System.out.println();

            System.out.println("print post params");
            System.out.println(postData);

            System.out.println("map to class");

            BookPayload testObj = new Gson().fromJson(g.toJson(postData), BookPayload.class);
            System.out.println(testObj.getPeople().length);
            System.out.println(testObj.getPeople()[0].getSeat());

            System.out.println(testObj.getCardData().getCardHolder());
            System.out.println(testObj.getCardData());

            System.out.println(testObj.getContactData());

            System.out.println(testObj.getPerformanceData());

            Session session =  HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session.beginTransaction();

            OrderModel ord = new OrderModel();
            ord.setEmail(testObj.getContactData().getMail());
            ord.setSurname(testObj.getContactData().getSurname());

            PerformanceModel perfMdl = new PerformanceModel();
            perfMdl.setId(Integer.parseInt(testObj.getPerformanceData().getId()));

            ord.setPerform(perfMdl);

            session.persist(ord);
            System.out.println(ord.getId());


            OrderItemModel ordItm = new OrderItemModel();
            ordItm.setSeatNo(testObj.getPeople()[0].getSeat());
            ordItm.setOrderId(ord.getId());
            session.persist(ordItm);


            CardDetailsModel card = new CardDetailsModel();
            card.setCardType(testObj.getCardData().getType());
            card.setOrderItem(ord);
            session.persist(card);


            tx.commit();
            session.close();


           /* HttpRequests req = new HttpRequests("http://localhost:3000/api/banks/ok");
            Payment pay = new Payment(req);


       /* pay.setPayload(pl);

        PaymentResponse payRsp = pay.settle();
        System.out.println(payRsp.getBankRsp().getTransactionId());


        BookCtrlResponse bookCtrlResponse = new BookCtrlResponse();
        bookCtrlResponse.transactionId = payRsp.getBankRsp().getTransactionId();

        Gson g = new Gson();
        return g.toJson(bookCtrlResponse); */


           // generate docs
          /*  System.out.println("start docs ");

            PDFGenerator pdfgen = new PDFGenerator(testObj);
            pdfgen.makeAllTicketsPdf();

            System.out.println("invoice ");

            System.out.println("barcode ");
            BarCodeGenerator barGenny = new BarCodeGenerator();
            barGenny.makeBarCode();*/






System.out.println("Finished");

            return "lol";
        }
        catch (Exception ex)
        {
            return "err on params + " + ex.getMessage();
        }
    }




}
