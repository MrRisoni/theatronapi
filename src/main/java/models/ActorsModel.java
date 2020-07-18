package models;



import javax.persistence.*;

@Entity
@Table(name = "actors")
public class ActorsModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "act_id")
    private int id;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn (name="act_people_id")
    private PeopleModel human;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn (name="act_character_id")
    private CharacterModel role;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn (name="act_performance_id ")
    private PerformanceModel performObj;

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
  
    public CharacterModel getRole() {
        return role;
    }

    public void setHuman(PeopleModel human) {
        this.human = human;
    }

    public void setRole(CharacterModel role) {
        this.role = role;
    }

    public PerformanceModel getPerformObj() {
        return performObj;
    }

    public void setPerformObj(PerformanceModel performObj) {
        this.performObj = performObj;
    }
}
