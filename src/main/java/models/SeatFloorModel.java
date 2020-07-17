package models;

import javax.persistence.*;

@Entity
@Table(name = "seatfloor")
public class SeatFloorModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "scr_id")
    private int id;

    @Column(name = "scr_top")
    private int top;

    @Column(name = "scr_left")
    private int left;

    @Column(name = "scr_rowid")
    private int rowId;

    @Column(name = "scr_colid")
    private int colId;

    @Column(name = "scr_zone_id")
    private int zoneId;

    @Column(name = "scr_seatname")
    private String seatName;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name ="scr_theater_id")
    private TheaterModel theatronObj;

    public SeatFloorModel(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTop() {
        return top;
    }

    public void setTop(int top) {
        this.top = top;
    }

    public int getLeft() {
        return left;
    }

    public void setLeft(int left) {
        this.left = left;
    }

    public int getRowId() {
        return rowId;
    }

    public void setRowId(int rowId) {
        this.rowId = rowId;
    }

    public int getColId() {
        return colId;
    }

    public void setColId(int colId) {
        this.colId = colId;
    }

    public String getSeatName() {
        return seatName;
    }

    public void setSeatName(String seatName) {
        this.seatName = seatName;
    }

    public int getZoneId() {
        return zoneId;
    }

    public TheaterModel getTheatronObj() {
        return theatronObj;
    }

    public void setTheatronObj(TheaterModel theatronObj) {
        this.theatronObj = theatronObj;
    }
}
