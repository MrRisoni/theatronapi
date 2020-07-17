package models;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "performance_dates")
public class PerformanceDateModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "prd_id")
    private int id;

    @Column(name = "prd_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date plays_one;

    public PerformanceDateModel()
    {
    }

    public Date getPlays_one() {
        return plays_one;
    }
}