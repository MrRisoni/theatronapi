package models;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "zones")
public class ZoneModel {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "zon_id")
    private int id;


    @Column(name = "zon_title")
    private String title;


    @Column(name = "zon_csscolor")
    private String cssColor;


    @Column(name = "zon_theater_id")
    private int theaterId;


    @OneToMany(fetch = FetchType.EAGER)
    @JoinColumn(name = "scr_zone_id")
    private List<SeatFloorModel> seats;

    public ZoneModel()
    {

    }


    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getCssColor() {
        return cssColor;
    }


    public int getTheatherId() {
        return theaterId;
    }


    public List<SeatFloorModel> getSeats() {
        return seats;
    }
}