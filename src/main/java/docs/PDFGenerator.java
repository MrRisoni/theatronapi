package docs;

import hello.bookPojos.BookPayload;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;
import org.w3c.tidy.Tidy;
import org.xhtmlrenderer.pdf.ITextRenderer;

import java.io.*;
import java.nio.file.FileSystems;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import static org.thymeleaf.templatemode.TemplateMode.HTML;


public class PDFGenerator {

    private BookPayload bookData;

    public PDFGenerator(BookPayload bd)
    {
        this.bookData = bd;
    }

    private TemplateEngine setUpTemplate()
    {
        ClassLoaderTemplateResolver templateResolver = new ClassLoaderTemplateResolver();
        templateResolver.setPrefix("/");
        templateResolver.setSuffix(".html");
        templateResolver.setTemplateMode(HTML);
        templateResolver.setCharacterEncoding("UTF-8");

        TemplateEngine templateEngine = new TemplateEngine();
        templateEngine.setTemplateResolver(templateResolver);
        return templateEngine;
    }



    public void makeAllTicketsPdf()
    {
        try {
            TemplateEngine eng = this.setUpTemplate();

            Context context = new Context();
            context.setVariable("to", "myself");
            context.setVariable("fullName", this.bookData.getContactData().getName() + " " + this.bookData.getContactData().getSurname());
            context.setVariable("mobile", this.bookData.getContactData().getMobile());
            context.setVariable("email", this.bookData.getContactData().getMail());

            Calendar cal = Calendar.getInstance();
            Date date = cal.getTime();
            DateFormat dateFormat = new SimpleDateFormat("d M Y HH:mm:ss");
            context.setVariable("issueDateTime", dateFormat.toString());

            System.out.println("renderedHtmlContent ");


            String renderedHtmlContent = eng.process("templates/allTickets", context);
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

            this.savePDF(renderer, "allTickets");
        }
        catch(Exception ex){
            System.out.println(ex.getMessage());
        }
    }


    private void savePDF(ITextRenderer render, String pdfName)
    {
        try {
            OutputStream outputStream = new FileOutputStream(pdfName + ".docs");
            render.createPDF(outputStream);
            outputStream.close();
        }
        catch(Exception ex){
            ex.getMessage();
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
