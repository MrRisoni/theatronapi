package pay;

public class BankResponse {

    public String Error;
    public String ReferenceId;


    public BankResponse(){}


    public String getErr() {
        return Error;
    }

    public void setErr(String err) {
        this.Error = err;
    }

    public String getTransactionId() {
        return ReferenceId;
    }

    public void setTransactionId(String transactionId) {
        this.ReferenceId = transactionId;
    }
}
