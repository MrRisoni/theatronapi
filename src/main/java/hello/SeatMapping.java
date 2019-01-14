package hello;

import models.SeatMapModel;

import java.util.List;

public class SeatMapping {

    private List<Short> rows;
    private List<Short> cols;
    private List<SeatMapModel> mappings;


    public SeatMapping(){}


    public List<Short> getRows() {
        return rows;
    }

    public void setRows(List<Short> rows) {
        this.rows = rows;
    }

    public List<Short> getCols() {
        return cols;
    }

    public void setCols(List<Short> cols) {
        this.cols = cols;
    }

    public List<SeatMapModel> getMappings() {
        return mappings;
    }

    public void setMappings(List<SeatMapModel> mappings) {
        this.mappings = mappings;
    }
}
