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

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name ="zon_theater_id")
    private TheaterModel theatronObj;

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

    public void setId(int id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setCssColor(String cssColor) {
        this.cssColor = cssColor;
    }


}