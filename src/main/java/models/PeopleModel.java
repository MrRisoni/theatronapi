package models;

import javax.persistence.*;

@Entity
@Table(name = "people")
public class PeopleModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ppl_id")
    private int id;

    @Column(name = "ppl_fullname")
    private String fullName;

    public PeopleModel()
    {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullname) {
        this.fullName = fullname;
    }
}
