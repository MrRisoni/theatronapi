package hello;

import java.util.ArrayList;

import general.HttpRequests;
import pay.Payment;
import book.pojos.BookPayload;
import book.pojos.Order;
import book.pojos.Seat;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.ui.Model;
import pay.PaymentResponse;

@CrossOrigin
@RestController
public class BookController {

    @RequestMapping(value = "/foo" ,method = RequestMethod.GET)
    public String bookSeats(Model model) {

        HttpRequests req = new HttpRequests("http://localhost:3000/api/banks/ok");
        Payment pay = new Payment(req);

        Order ord =new Order();
        ord.setEmail("foo@foo");

        Seat st = new Seat();
        st.setPaxType("ADT");
        st.setSeatNo("AB1");

        BookPayload pl = new BookPayload();
        pl.setDetails(ord);
        ArrayList<Seat> seatList = new ArrayList<Seat>();
        seatList.add(st);


        pay.setPayload(pl);

        PaymentResponse payRsp = pay.settle();
        System.out.println(payRsp.getBankRsp().getTransactionId());

        return "foo";
    }
}
