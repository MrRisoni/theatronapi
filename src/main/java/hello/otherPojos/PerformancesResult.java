package hello.otherPojos;

import java.math.BigInteger;

public class PerformancesResult {

    private  int theaterId;
    private BigInteger performanceId;
    private Short duration;
    private String theaterName;
    private String playName;
    private int seasonId;
    private String fromDate;
    private String toDate;
    private float avgEmptySeats; // average empty seats per day
    private String genre;

    public PerformancesResult() {


    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getSeasonId() {
        return seasonId;
    }

    public void setSeasonId(int seasonId) {
        this.seasonId = seasonId;
    }

    public String getFromDate() {
        return fromDate;
    }

    public void setFromDate(String fromDate) {
        this.fromDate = fromDate;
    }

    public String getToDate() {
        return toDate;
    }

    public void setToDate(String toDate) {
        this.toDate = toDate;
    }

    public int getTheaterId() {
        return theaterId;
    }

    public void setTheaterId(int theaterId) {
        this.theaterId = theaterId;
    }

    public BigInteger getPerformanceId() {
        return performanceId;
    }

    public void setPerformanceId(BigInteger performanceId) {
        this.performanceId = performanceId;
    }

    public Short getDuration() {
        return duration;
    }

    public void setDuration(Short duration) {
        this.duration = duration;
    }

    public String getTheaterName() {
        return theaterName;
    }

    public void setTheaterName(String theaterName) {
        this.theaterName = theaterName;
    }

    public String getPlayName() {
        return playName;
    }

    public void setPlayName(String playName) {
        this.playName = playName;
    }


    public float getAvgEmptySeats() {
        return avgEmptySeats;
    }

    public void setAvgEmptySeats(float avgEmptySeats) {
        this.avgEmptySeats = avgEmptySeats;
    }
}
