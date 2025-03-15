package model;

import java.util.Date;

public class Log {

    private int logID;
    private int userID;
    private Date loginDate;

    public int getLogID() {
        return logID;
    }

    public void setLogID(int logID) {
        this.logID = logID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public Date getLoginDate() {
        return loginDate;
    }

    public void setLoginDate(Date loginDate) {
        this.loginDate = loginDate;
    }

    @Override
    public String toString() {
        return "Log [logID=" + logID + ", userID=" + userID + ", loginDate="
                + loginDate + "]";
    }


}
