package hello.bookPojos;

public class Card {

    private String number;

    private String cvv;

    private String cardHolder;

    private int expMonth;

    private int expYear;

    private String type;


    public Card(){};


    public String getNumber() {
        return number;
    }



    public void setNumber(String number) {
        this.number = number;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    public String getCardHolder() {
        return cardHolder;
    }

    public void setCardHolder(String cardHolder) {
        this.cardHolder = cardHolder;
    }

    public int getExpMonth() {
        return expMonth;
    }

    public void setExpMonth(int expMonth) {
        this.expMonth = expMonth;
    }

    public int getExpYear() {
        return expYear;
    }

    public void setExpYear(int expYear) {
        this.expYear = expYear;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }


    @Override
    public String toString() {
        return "Card{" +
                "number='" + number + '\'' +
                ", cvv='" + cvv + '\'' +
                ", cardHolder='" + cardHolder + '\'' +
                ", expMonth=" + expMonth +
                ", expYear=" + expYear +
                ", type='" + type + '\'' +
                '}';
    }
}
