package models;

import javax.persistence.*;

@Entity
@Table(name = "actors")
public class ActorsModel {

    @Id
    @GeneratedValue
    @Column(name = "act_id")
    private int id;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn (name="act_people_id")
    private PeopleModel human;

  
    public ActorsModel()
    {}


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public PeopleModel getHuman() {
        return human;
    }
  

   
}
