package models;

import javax.persistence.*;

@Entity
@Table(name = "zones")
public class ZoneModel {


    @Id
    @GeneratedValue
    @Column(name = "zon_id")
    private int id;


    @Column(name = "zon_title")
    private String title;


    

    public ZoneModel()
    {

    }


    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }
}