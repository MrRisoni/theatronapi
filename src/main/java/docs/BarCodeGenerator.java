package docs;

import uk.org.okapibarcode.backend.Code128;
import uk.org.okapibarcode.backend.HumanReadableLocation;
import uk.org.okapibarcode.output.Java2DRenderer;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;

public class BarCodeGenerator {


    public BarCodeGenerator()
    {

    }


    public void makeBarCode()
    {
        try {
            Code128 barcode = new Code128();
            barcode.setFontName("Monospaced");
            barcode.setFontSize(16);
            barcode.setModuleWidth(2);
            barcode.setBarHeight(120);
            barcode.setHumanReadableLocation(HumanReadableLocation.BOTTOM);
            barcode.setContent("123456789");

            int width = barcode.getWidth();
            int height = barcode.getHeight();

            BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_BYTE_GRAY);
            Graphics2D g2d = image.createGraphics();
            Java2DRenderer renderer = new Java2DRenderer(g2d, 1, Color.WHITE, Color.BLACK);
            renderer.render(barcode);

            ImageIO.write(image, "png", new File("code128.png"));
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
        }
    }
}
