package hello.otherPojos;

import java.math.BigInteger;
import java.util.Date;

public class PerformancesResult {

    private  int theaterId;
    private BigInteger performanceId;
    private Short duration;
    private String theaterName;
    private String playName;
    private int seasonId;
    private Date fromDate;
    private Date toDate;
    private float avgEmptySeats; // average empty seats per day
    private String genre;
    private float minPrice; // adults;
    private float maxPrice;

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

    public Date getFromDate() {
        return fromDate;
    }

    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }

    public Date getToDate() {
        return toDate;
    }

    public void setToDate(Date toDate) {
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


    public float getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(float minPrice) {
        this.minPrice = minPrice;
    }

    public float getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(float maxPrice) {
        this.maxPrice = maxPrice;
    }
}
