package models;

import javax.persistence.*;

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


}