package hello.bookPojos;

import java.util.ArrayList;

// data posted for Vue.js
public class BookPayload {

    private Order details;

    private ArrayList<Seat> seatList;

    private Card cardData;


    public BookPayload()
    {

    }


    public Card getCardData() {
        return cardData;
    }

    public void setCardData(Card cardData) {
        this.cardData = cardData;
    }

    public Order getDetails() {
        return details;
    }

    public void setDetails(Order details) {
        this.details = details;
    }

    public ArrayList<Seat> getSeatList() {
        return seatList;
    }

    public void setSeatList(ArrayList<Seat> seatList) {
        this.seatList = seatList;
    }
}
