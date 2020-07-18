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
import java.util.concurrent.ThreadLocalRandom;


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
    public BookCtrlResponse bookSeats(@RequestBody Object postData) {

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
            ordItm.setVoid(true);
            ordItm.setPrice(10.2f);
            ordItm.setTktNo("123340002");
            TypeModel typ = new TypeModel();
            typ.setId(1);
            ordItm.setTyp(typ);
            orderItemRepo.save(ordItm);

            CardDetailsModel card = new CardDetailsModel();
            card.setCardType(testObj.getCardData().getType());
            card.setOrderItem(ord);
            card.setCardBin(testObj.getCardData().getNumber().substring(0,6));
            card.setCardLast(testObj.getCardData().getNumber().substring(testObj.getCardData().getNumber().length() - 4));
            card.setCardHolder(testObj.getCardData().getCardHolder());
            cardRepo.save(card);
            System.out.println("Card Saved");

            PDFGenerator pdfgen = new PDFGenerator(testObj);
            pdfgen.makeAllTicketsPdf();

            BookCtrlResponse bookRsp = new BookCtrlResponse();
            bookRsp.setErr(false);
            bookRsp.setOrderId(ord.getId());
            bookRsp.setTransactionId(this.randomString(15,false));
            bookRsp.getTicketItems().add(ordItm);

            return bookRsp;

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }

    private String randomString(int len,boolean numbersOnly)
    {
        String alphabet= "0123456789";
        if (numbersOnly == false) {
            alphabet +="abcdefghijklmnopqrstuvwxyz";
        }
        String ran = "";
        int min = 0;
        int max = alphabet.length();
        for (int i=0;i<len;i++) {
            int randomNum = ThreadLocalRandom.current().nextInt(min, max + 1);
            System.out.println("random " + randomNum);
            ran += alphabet.substring(randomNum,randomNum+1);
        }
        return  ran.toUpperCase();
    }
}
