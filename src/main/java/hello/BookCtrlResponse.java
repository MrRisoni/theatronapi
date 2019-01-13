package hello;

public class BookCtrlResponse {


    public int orderId;
    public String transactionId;
    public boolean err;

    public BookCtrlResponse(){
        this.err = false;
    }


    public boolean isErr() {
        return err;
    }

    public void setErr(boolean err) {
        this.err = err;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(String transactionId) {
        this.transactionId = transactionId;
    }
}
