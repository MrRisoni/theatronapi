package models;


import javax.persistence.*;

@Entity
@Table(name = "pricing")
public class SeatFloorModel {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "pri_id")
    private int id;

    @Column(name = "scr_top")
    private int top;

    @Column(name = "scr_left")
    private int left;

    @Column(name = "scr_rowid")
    private int rowId;

    @Column(name = "scr_colid")
    private int colId;

    @Column(name = "scr_theater_id")
    private int theaterId;

    @Column(name = "scr_seatname")
    private String seatName;


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

    public int getTheaterId() {
        return theaterId;
    }

    public void setTheaterId(int theaterId) {
        this.theaterId = theaterId;
    }

    public String getSeatName() {
        return seatName;
    }

    public void setSeatName(String seatName) {
        this.seatName = seatName;
    }
}
