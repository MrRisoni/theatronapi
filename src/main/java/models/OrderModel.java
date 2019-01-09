package models;

import javax.persistence.*;

@Entity
@Table(name = "orders")
public class OrderModel {


    @Id
    @GeneratedValue
    @Column(name = "ord_id")
    private int id;


    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn (name="ord_performance_id")
    private PerformanceModel perform;



    @Column(name = "ord_surname")
    private String name;


    public OrderModel()
    {

    }


    public int getId() {
        return id;
    }

    public PerformanceModel getPerform() {
        return perform;
    }

    public String getName() {
        return name;
    }
}