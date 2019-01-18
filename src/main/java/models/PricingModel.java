package models;

import javax.persistence.*;

@Entity
@Table(name = "pricing")
public class PricingModel {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "pri_id")
    private int id;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn (name="pri_zone_id")
    private ZoneModel zone;



    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn (name="pri_type_id")
    private TypeModel typ;


    @Column(name = "pri_price")
    private float price;


    public PricingModel()
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


    public float getPrice() {
        return price;
    }
}