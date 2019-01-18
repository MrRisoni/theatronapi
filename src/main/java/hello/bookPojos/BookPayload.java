package hello.bookPojos;

import java.util.ArrayList;

// data posted for Vue.js
public class BookPayload {


    private Seat[] people;

    private Card cardData;

    private Contact contactData;

    private Performance performanceData;

    public BookPayload() {

    }

    public Performance getPerformanceData() {
        return performanceData;
    }

    public void setPerformanceData(Performance performanceData) {
        this.performanceData = performanceData;
    }

    public Contact getContactData() {
        return contactData;
    }

    public void setContactData(Contact contactData) {
        this.contactData = contactData;
    }

    public Card getCardData() {
        return cardData;
    }

    public void setCardData(Card cardData) {
        this.cardData = cardData;
    }



    public Seat[] getPeople() {
        return people;
    }

    public void setPeople(Seat[] people) {
        this.people = people;
    }
}
