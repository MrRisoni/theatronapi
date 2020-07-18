package core;

import models.OrderItemModel;

import java.util.ArrayList;
import java.util.List;

public class BookCtrlResponse {

    private int orderId;
    private String transactionId;
    private boolean err;
    private List<OrderItemModel> ticketItems;

    public BookCtrlResponse(){
        this.err = false;
        this.ticketItems = new ArrayList<>();
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

    public List<OrderItemModel> getTicketItems() {
        return ticketItems;
    }

    public void setTicketItems(List<OrderItemModel> ticketItems) {
        this.ticketItems = ticketItems;
    }
}
