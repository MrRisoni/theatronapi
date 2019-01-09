package models;

import javax.persistence.*;

@Entity
@Table(name = "order_item")
public class OrderItemModel {


    @Id
    @GeneratedValue
    @Column(name = "itm_id")
    private int id;


    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn (name="itm_zone_id")
    private ZoneModel zone;


    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn (name="itm_type_id")
    private TypeModel typ;

   @Column(name = "itm_seatno")
    private String seatNo;

    @Column(name = "itm_ticket")
    private String tktNo;


    @Column(name = "itm_void")
    private Boolean isVoid;

    public OrderItemModel()
    {

    }


    public int getId() {
        return id;
    }

    public ZoneModel getZone() {
        return zone;
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
}