package book;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.thymeleaf.context.Context;


@Service
public class ConfirmationMailBuilder {


    private TemplateEngine templateEngine;

    @Autowired
    public ConfirmationMailBuilder(TemplateEngine templateEngine) {
        this.templateEngine = templateEngine;
    }

    public String build(String message) {
        Context context = new Context();
        context.setVariable("message", message);
        return templateEngine.process("mailTemplate", context);
    }

}
