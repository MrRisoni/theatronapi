package models;

import javax.persistence.*;

@Entity
@Table(name = "performance")
public class PerformanceModel {

    @Id
    @GeneratedValue
    @Column(name = "per_id")
    private int id;

  
    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn (name="per_play_id")
    private PlayModel play;


    public PerformanceModel()
    {}


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public PlayModel getPlay() {
        return play;
    }


  
}
