package models;

import javax.persistence.*;

@Entity
@Table(name = "plays")
public class PlayModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ply_id")
    private int id;

    @Column(name = "ply_title")
    private String title;

    public PlayModel()
    {}

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

    @Override
    public String toString() {
      return this.getTitle();
    }

}
