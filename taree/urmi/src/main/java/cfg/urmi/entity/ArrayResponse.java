package cfg.urmi.entity;

public class ArrayResponse {
    private int[][] data;

    public ArrayResponse() {
        // Default constructor
    }

    public ArrayResponse(int[][] data) {
        this.data = data;
    }

    // Getter and setter for the data array

    public int[][] getData() {
        return data;
    }

    public void setData(int[][] data) {
        this.data = data;
    }
}
