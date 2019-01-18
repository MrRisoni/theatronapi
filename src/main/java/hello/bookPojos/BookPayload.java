package hello.bookPojos;

import java.util.ArrayList;

// data posted for Vue.js
public class BookPayload {

    //  private Order details;

    private Seat[] people;

    // private Card cardData;


    public BookPayload() {

    }

/*
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
*/

    public Seat[] getPeople() {
        return people;
    }

    public void setPeople(Seat[] people) {
        this.people = people;
    }
}
