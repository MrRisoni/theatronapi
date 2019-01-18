package hello;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import hello.bookPojos.BookPayload;

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



           /* HttpRequests req = new HttpRequests("http://localhost:3000/api/banks/ok");
            Payment pay = new Payment(req);


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
