package models;


import javax.persistence.*;

@Entity
@Table(name = "seatmap")
public class SeatMapModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "smp_id")
    private int id;


   @Column(name = "smp_rowid")
    private int rowId;



    @Column(name = "smp_colid")
    private int colId;



    @Column(name = "smp_seatname")
    private String seatName;



    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn (name="smp_zoneid")
    private ZoneModel zoneInfo;


    @Column(name = "smp_real_rowid")
    private int realRowId;


    @Column(name = "smp_real_colid")
    private int realColId;


    @Column(name = "smp_theater_id")
    private int theaterId;


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


    public ZoneModel getZoneInfo() {
        return zoneInfo;
    }


    public void setRowId(int rowId) {
        this.rowId = rowId;
    }

    public void setColId(int colId) {
        this.colId = colId;
    }

    public void setZoneInfo(ZoneModel zoneInfo) {
        this.zoneInfo = zoneInfo;
    }

    public int getRealRowId() {
        return realRowId;
    }

    public void setRealRowId(int realRowId) {
        this.realRowId = realRowId;
    }

    public int getRealColId() {
        return realColId;
    }

    public void setRealColId(int realColId) {
        this.realColId = realColId;
    }


}
