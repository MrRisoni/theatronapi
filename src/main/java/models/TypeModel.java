package models;

import javax.persistence.*;

@Entity
@Table(name = "types")
public class TypeModel {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "typ_id")
    private int id;


    @Column(name = "typ_title")
    private String title;



    public TypeModel()
    {

    }


    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }
}