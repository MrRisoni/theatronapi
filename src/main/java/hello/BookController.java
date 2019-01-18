package hello;


import com.google.gson.Gson;
import models.*;
import org.hibernate.Session;
import org.thymeleaf.TemplateEngine;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import hello.bookPojos.BookPayload;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;
import static org.thymeleaf.templatemode.TemplateMode.HTML;
import org.thymeleaf.context.Context;
import org.w3c.tidy.Tidy;
import org.xhtmlrenderer.pdf.ITextRenderer;

import java.io.*;
import java.nio.file.FileSystems;

import static com.itextpdf.text.pdf.BaseFont.EMBEDDED;
import static com.itextpdf.text.pdf.BaseFont.IDENTITY_H;

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


           // generate pdf
            System.out.println("start pdf ");

            ClassLoaderTemplateResolver templateResolver = new ClassLoaderTemplateResolver();
            templateResolver.setPrefix("/");
            templateResolver.setSuffix(".html");
            templateResolver.setTemplateMode(HTML);
            templateResolver.setCharacterEncoding("UTF-8");

            TemplateEngine templateEngine = new TemplateEngine();
            templateEngine.setTemplateResolver(templateResolver);

            Context context = new Context();
            context.setVariable("to", "myself");
            context.setVariable("fullName", testObj.getContactData().getName() + " " + testObj.getContactData().getSurname());
            context.setVariable("mobile", testObj.getContactData().getMobile());
            context.setVariable("email", testObj.getContactData().getMail());


            System.out.println("renderedHtmlContent ");


            String renderedHtmlContent = templateEngine.process("templates/invoice", context);
            String xHtml = this.convertToXhtml(renderedHtmlContent);

            ITextRenderer renderer = new ITextRenderer();

            System.out.println("set baseurl ");


            String baseUrl = FileSystems
                    .getDefault()
                    .getPath("src", "main", "resources")
                    .toUri()
                    .toURL()
                    .toString();
            renderer.setDocumentFromString(xHtml, baseUrl);
            renderer.layout();

            System.out.println("invoice ");


            OutputStream outputStream = new FileOutputStream("receipt.pdf");
            renderer.createPDF(outputStream);
            outputStream.close();

System.out.println("Finished");

            return "lol";
        }
        catch (Exception ex)
        {
            return "err on params + " + ex.getMessage();
        }
    }



    private String convertToXhtml(String html) throws UnsupportedEncodingException {
        Tidy tidy = new Tidy();
        tidy.setInputEncoding("UTF-8");
        tidy.setOutputEncoding("UTF-8");
        tidy.setXHTML(true);
        ByteArrayInputStream inputStream = new ByteArrayInputStream(html.getBytes("UTF-8"));
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        tidy.parseDOM(inputStream, outputStream);
        return outputStream.toString("UTF-8");
    }
}
