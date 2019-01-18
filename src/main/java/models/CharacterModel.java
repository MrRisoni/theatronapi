package models;

import javax.persistence.*;

@Entity
@Table(name = "characters")
public class CharacterModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "char_id")
    private int id;


    @Column(name = "char_name")
    private String name;

  
    public CharacterModel()
    {}


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

  

   
}
