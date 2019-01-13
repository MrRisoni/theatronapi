package pay;

import hello.bookPojos.BookPayload;
import com.google.gson.Gson;
import general.HttpRequests;
import hello.bookPojos.Card;
import org.apache.http.HttpResponse;
import org.apache.http.impl.client.BasicResponseHandler;

public class Payment {

    private HttpRequests httpReq;
    private Card cardDetails;

    public Payment(HttpRequests http)
    {
        this.httpReq = http;
    }

    public void setHttpReq(HttpRequests httpReq) {
        this.httpReq = httpReq;
    }


    public Card getCardDetails() {
        return cardDetails;
    }

    public void setCardDetails(Card cardDetails) {
        this.cardDetails = cardDetails;
    }


    public PaymentResponse voidTransaction()
    {
        return null;
    }


    public PaymentResponse refundTransaction()
    {
        return null;
    }

    public PaymentResponse settle()
    {
        PaymentResponse payRsp = new PaymentResponse();
        try {
            HttpResponse rsp = this.httpReq.makeRequest(this.cardDetails);
            String responseString = new BasicResponseHandler().handleResponse(rsp);

            Gson g = new Gson();
            BankResponse bankRsp = g.fromJson(responseString, BankResponse.class);
            payRsp.setBankRsp(bankRsp);
            return payRsp;
        }
        catch (Exception ex)
        {
            System.out.println(ex.getMessage());
            payRsp.setSuccess(false);
            payRsp.setError(ex.getMessage());

            return payRsp;
        }
    }


}



