package model;

public class Gift {
    private int giftID;
    private String giftName;
    private int requiredPoints;
    private int stock;

    // 无参构造函数
    public Gift() {
    }

    // 有参构造函数
    public Gift(int giftID, String giftName, int requiredPoints, int stock) {
        this.giftID = giftID;
        this.giftName = giftName;
        this.requiredPoints = requiredPoints;
        this.stock = stock;
    }

    // Getter 和 Setter 方法
    public int getGiftID() {
        return giftID;
    }

    public void setGiftID(int giftID) {
        this.giftID = giftID;
    }

    public String getGiftName() {
        return giftName;
    }

    public void setGiftName(String giftName) {
        this.giftName = giftName;
    }

    public int getRequiredPoints() {
        return requiredPoints;
    }

    public void setRequiredPoints(int requiredPoints) {
        this.requiredPoints = requiredPoints;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    @Override
    public String toString() {
        return "Gift{" +
                "giftID=" + giftID +
                ", giftName='" + giftName + '\'' +
                ", requiredPoints=" + requiredPoints +
                ", stock=" + stock +
                '}';
    }
}
