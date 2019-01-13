package pay;

import book.pojos.BookPayload;
import com.google.gson.Gson;
import general.HttpRequests;
import org.apache.http.HttpResponse;
import org.apache.http.impl.client.BasicResponseHandler;

public class Payment {

    private HttpRequests httpReq;
    private BookPayload pl;

    public Payment(HttpRequests http)
    {
        this.httpReq = http;
    }

    public void setHttpReq(HttpRequests httpReq) {
        this.httpReq = httpReq;
    }

    public void setPayload(BookPayload pl) {
        this.pl = pl;
    }

    public PaymentResponse settle()
    {
        PaymentResponse payRsp = new PaymentResponse();
        try {
            HttpResponse rsp = this.httpReq.makeRequest(this.pl);
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



