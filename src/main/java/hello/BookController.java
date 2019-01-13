package hello;

import java.util.ArrayList;

import com.google.gson.Gson;
import general.HttpRequests;
import org.springframework.web.bind.annotation.*;
import pay.Payment;
import hello.bookPojos.BookPayload;
import hello.bookPojos.Order;
import hello.bookPojos.Seat;
import pay.PaymentResponse;

@CrossOrigin
@RestController
public class BookController {

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
