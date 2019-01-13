package book.pojos;

import java.util.ArrayList;

public class BookPayload {

    private Order details;

    private ArrayList<Seat> seatList;


    public BookPayload()
    {

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
