package models;


import javax.persistence.*;

@Entity
@Table(name = "seatmap")
public class SeatMapModel {

    @Id
    @GeneratedValue
    @Column(name = "smp_id")
    private int id;


   @Column(name = "smp_rowid")
    private int rowId;



    @Column(name = "smp_colid")
    private int colId;



    @Column(name = "smp_seatname")
    private String seatName;




    public SeatMapModel(){}


    public int getRowId() {
        return rowId;
    }

    public int getColId() {
        return colId;
    }


    public void setId(int id) {
        this.id = id;
    }

    public void setSeatName(String seatName) {
        this.seatName = seatName;
    }

    public int getId() {
        return id;
    }

    public String getSeatName() {
        return seatName;
    }
}
