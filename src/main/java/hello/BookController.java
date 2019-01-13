package hello;

import java.util.List;

import book.ConfirmationMailBuilder;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import models.PerformanceModel;
import models.HibernateUtil;
import org.hibernate.Session;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;




@CrossOrigin
@RestController
public class BookController {

    @RequestMapping(value = "/api/book" ,method = RequestMethod.POST)
    public String bookSeats()
    {
        ConfirmationMailBuilder confBuild = new ConfirmationMailBuilder();
        return "";

    }
}
