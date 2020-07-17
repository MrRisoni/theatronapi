package models;

import java.util.Date;
import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "performance")
public class PerformanceModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "per_id")
    private int id;

    @Column(name = "per_from_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date starts_at;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn (name="per_play_id")
    private PlayModel play;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn (name="per_director_id")
    private PeopleModel director;

    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "act_performance_id")
    private List<ActorsModel> actorsList;

    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "pri_performance_id")
    private List<PricingModel> pricesList;

    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "prd_performance_id")
    private List<PerformanceDateModel> datesList;

    public PerformanceModel()
    {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getStarts_at() {
        return starts_at;
    }

    public PlayModel getPlay() {
        return play;
    }

    public PeopleModel getDirector() {
        return director;
    }

    public List<PricingModel> getPricesList() {
        return pricesList;
    }

    public List<ActorsModel> getActorsList() {
        return actorsList;
    }

    public List<PerformanceDateModel> getDatesList() {
        return datesList;
    }
}
