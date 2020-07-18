package hello;

import com.google.gson.Gson;
import models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import hello.bookPojos.BookPayload;
import docs.PDFGenerator;
import repos.SprCardDetailsRepository;
import repos.SprOrderItemRepository;
import repos.SprOrderRepository;
import java.text.SimpleDateFormat;


@CrossOrigin
@RestController
public class BookController {

    @Autowired
    SprOrderRepository orderRepo;

    @Autowired
    SprOrderItemRepository orderItemRepo;

    @Autowired
    SprCardDetailsRepository cardRepo;

    @PostMapping(value = "/api/book",
            consumes = {MediaType.APPLICATION_JSON_VALUE},
            produces = {MediaType.APPLICATION_JSON_VALUE}
    )
    public String bookSeats(@RequestBody Object postData) {

        try {
            Gson g = new Gson();

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


            OrderModel ord = new OrderModel();
            ord.setVoid(false);
            ord.setMobile(testObj.getContactData().getMobile());
            ord.setEmail(testObj.getContactData().getMail());
            ord.setSurname(testObj.getContactData().getSurname());
            ord.setName(testObj.getContactData().getName());
            ord.setCcfees(2.25f);
            ord.setTicketsPrice(104f);
            ord.setTotal(56f);
            ord.setSuccess(true);
            ord.setPerformanceDate(new SimpleDateFormat("yyyy-MM-dd").parse(testObj.getPerformanceData().getDate()));

            PerformanceModel perfMdl = new PerformanceModel();
            perfMdl.setId(Integer.parseInt(testObj.getPerformanceData().getId()));

            ord.setPerform(perfMdl);

            orderRepo.save(ord);
            System.out.println(ord.getId());


            OrderItemModel ordItm = new OrderItemModel();
            ordItm.setSeatNo(testObj.getPeople()[0].getSeat());
            ordItm.setOrderId(ord.getId());
            orderItemRepo.save(ordItm);


            CardDetailsModel card = new CardDetailsModel();
            card.setCardType(testObj.getCardData().getType());
            card.setOrderItem(ord);
            cardRepo.save(card);


            return "foo";
        } catch (Exception ex) {
            return "err on params + " + ex.getMessage();
        }
    }
}
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

      }






System.out.println("Finished");

            return "lol";
        }
        catch (Exception ex)
        {
            return "err on params + " + ex.getMessage();
        }
    }




}*/
