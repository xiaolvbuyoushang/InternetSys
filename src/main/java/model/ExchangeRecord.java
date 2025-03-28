package model;

import java.sql.Timestamp;

public class ExchangeRecord {
    private int recordID;
    private int userID;
    private int giftID;
    private Timestamp exchangeTime;

    // 无参构造函数
    public ExchangeRecord() {
    }

    // 有参构造函数
    public ExchangeRecord(int recordID, int userID, int giftID, Timestamp exchangeTime) {
        this.recordID = recordID;
        this.userID = userID;
        this.giftID = giftID;
        this.exchangeTime = exchangeTime;
    }

    // Getter 和 Setter 方法
    public int getRecordID() {
        return recordID;
    }

    public void setRecordID(int recordID) {
        this.recordID = recordID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getGiftID() {
        return giftID;
    }

    public void setGiftID(int giftID) {
        this.giftID = giftID;
    }

    public Timestamp getExchangeTime() {
        return exchangeTime;
    }

    public void setExchangeTime(Timestamp exchangeTime) {
        this.exchangeTime = exchangeTime;
    }

    @Override
    public String toString() {
        return "ExchangeRecord{" +
                "recordID=" + recordID +
                ", userID=" + userID +
                ", giftID=" + giftID +
                ", exchangeTime=" + exchangeTime +
                '}';
    }
}
