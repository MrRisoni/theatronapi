package core.seatPojos;

public class SeatAttributes {

    private String seatName;
    private String zoneCss;
    private int zoneId;

    public SeatAttributes()
    {

    }


    public String getSeatName() {
        return seatName;
    }

    public void setSeatName(String seatName) {
        this.seatName = seatName;
    }

    public String getZoneCss() {
        return zoneCss;
    }

    public void setZoneCss(String zoneCss) {
        this.zoneCss = zoneCss;
    }


    public int getZoneId() {
        return zoneId;
    }

    public void setZoneId(int zoneId) {
        this.zoneId = zoneId;
    }
}
