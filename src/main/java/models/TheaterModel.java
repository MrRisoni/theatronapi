package models;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "theaters")
public class TheaterModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "tht_id")
    private int id;

    @Column(name = "tht_name")
    private String title;

    @OneToMany( mappedBy = "theatronObj",cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
    private Set<SeatFloorModel> seatMapping = new HashSet<SeatFloorModel>();

    public TheaterModel() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Set<SeatFloorModel> getSeatMapping() {
        return seatMapping;
    }

    public void setSeatMapping(Set<SeatFloorModel> seatMapping) {
        this.seatMapping = seatMapping;
    }
}
