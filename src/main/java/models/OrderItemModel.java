package models;

import javax.persistence.*;

@Entity
@Table(name = "order_item")
public class OrderItemModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "itm_id")
    private int id;

    @Column(name = "itm_order_id")
    private int orderId;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn (name="itm_type_id")
    private TypeModel typ;

   @Column(name = "itm_seatno")
    private String seatNo;

    @Column(name = "itm_ticket")
    private String tktNo;

    @Column(name = "itm_void")
    private Boolean isVoid;

    @Column(name = "itm_price")
    private float price;

    public OrderItemModel()
    {
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getId() {
        return id;
    }

    public TypeModel getTyp() {
        return typ;
    }

    public String getSeatNo() {
        return seatNo;
    }

    public String getTktNo() {
        return tktNo;
    }

    public Boolean getVoid() {
        return isVoid;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTyp(TypeModel typ) {
        this.typ = typ;
    }

    public void setSeatNo(String seatNo) {
        this.seatNo = seatNo;
    }

    public void setTktNo(String tktNo) {
        this.tktNo = tktNo;
    }

    public void setVoid(Boolean aVoid) {
        isVoid = aVoid;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }


}