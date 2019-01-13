package pay;

public class PaymentResponse {

    private Boolean success;
    private String error;
    private BankResponse bankRsp;

    public PaymentResponse(){
        this.error = "";
    }

    public BankResponse getBankRsp() {
        return bankRsp;
    }

    public void setBankRsp(BankResponse bankRsp) {
        this.bankRsp = bankRsp;
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
}
