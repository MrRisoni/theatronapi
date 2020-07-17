package models;

import javax.persistence.*;

@Entity
@Table(name = "card_details")
public class CardDetailsModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "crd_id")
    private int id;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn (name=" crd_order_id")
    private OrderModel orderItem;

    @Column(name = "crd_card_type")
    private String cardType;

    @Column(name = " crd_card_holder")
    private String cardHolder;

    @Column(name = "crd_bin")
    private String cardBin;

    @Column(name = "crd_last ")
    private String cardLast;

    public CardDetailsModel(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCardType() {
        return cardType;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType;
    }

    public String getCardHolder() {
        return cardHolder;
    }

    public void setCardHolder(String cardHolder) {
        this.cardHolder = cardHolder;
    }

    public String getCardBin() {
        return cardBin;
    }

    public void setCardBin(String cardBin) {
        this.cardBin = cardBin;
    }

    public String getCardLast() {
        return cardLast;
    }

    public void setCardLast(String cardLast) {
        this.cardLast = cardLast;
    }

    public OrderModel getOrderItem() {
        return orderItem;
    }

    public void setOrderItem(OrderModel orderItem) {
        this.orderItem = orderItem;
    }
}
