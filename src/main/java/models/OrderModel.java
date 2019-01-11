package models;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

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


    @Column(name = "ord_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date plays_one;


    @Column(name = "ord_surname")
    private String name;


    @Column(name = "ord_void")
    private Boolean isVoid;


    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "itm_order_id")
    private List<OrderItemModel> itemsList;


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


    public Date getPlays_one() {
        return plays_one;
    }

    public Boolean getVoid() {
        return isVoid;
    }


    public List<OrderItemModel> getItemsList() {
        return itemsList;
    }
}