package core.otherPojos;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PerformancesResult {

    private  int theaterId;
    private int performanceId;
    private Short duration;
    private String theaterName;
    private String playName;
    private int seasonId;
    private Date fromDate;
    private Date toDate;
    private double avgCapacity;
    private String genre;
    private Double minPrice; // adults;
    private Double maxPrice;
    private int totalSeats;
    private String authorName;
    private List<RolePlaying> actors = new ArrayList<>();

    public PerformancesResult() {
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
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

    public int getPerformanceId() {
        return performanceId;
    }

    public void setPerformanceId(int performanceId) {
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

    public double getAvgCapacity() {
        return avgCapacity;
    }

    public void setAvgCapacity(double avgCapacity) {
        this.avgCapacity = avgCapacity;
    }

    public Double getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(Double minPrice) {
        this.minPrice = minPrice;
    }

    public Double getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(Double maxPrice) {
        this.maxPrice = maxPrice;
    }

    public int getTotalSeats() {
        return totalSeats;
    }

    public void setTotalSeats(int totalSeats) {
        this.totalSeats = totalSeats;
    }

    public List<RolePlaying> getActors() {
        return actors;
    }

    public void setActors(List<RolePlaying> actors) {
        this.actors = actors;
    }
}
