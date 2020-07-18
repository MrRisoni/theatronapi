package models;

import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "orders")
public class OrderModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ord_id")
    private int id;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn (name="ord_performance_id")
    private PerformanceModel perform;

    @Column(name = "ord_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date performanceDate;

    @Column(name = "ord_name")
    private String name;

    @Column(name = "ord_surname")
    private String surname;

    @Column(name = "ord_mobile")
    private String mobile;

    @Column(name = "ord_email")
    private String email ;

    @Column(name="ord_ccfees")
    private float ccfees;

    @Column(name="ord_tickets")
    private float ticketsPrice;

    @Column(name="ord_total")
    private float total;

    @Column(name = "ord_void")
    private Boolean isVoid;

    @Column(name = "ord_success")
    private Boolean success;

    @Column(name="ord_created_at")
    @Temporal(TemporalType.TIMESTAMP)
    @CreationTimestamp
    private Date created_at;

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

    public Date getPerformanceDate() {
        return performanceDate;
    }

    public Boolean getVoid() {
        return isVoid;
    }

    public List<OrderItemModel> getItemsList() {
        return itemsList;
    }

    public void setPerform(PerformanceModel perform) {
        this.perform = perform;
    }

    public void setPerformanceDate(Date performanceDate) {
        this.performanceDate = performanceDate;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setVoid(Boolean aVoid) {
        isVoid = aVoid;
    }

    public void setItemsList(List<OrderItemModel> itemsList) {
        this.itemsList = itemsList;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public float getCcfees() {
        return ccfees;
    }

    public void setCcfees(float ccfees) {
        this.ccfees = ccfees;
    }

    public float getTicketsPrice() {
        return ticketsPrice;
    }

    public void setTicketsPrice(float ticketsPrice) {
        this.ticketsPrice = ticketsPrice;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }
}