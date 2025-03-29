package model;

import java.util.Date;

public class Dispose {

    private int id;
    private String taskid;
    private Date disposeTime;
    private String disposeStatus;
    private String auditorID;
    private String basis;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTaskid() {
        return taskid;
    }

    public void setTaskid(String taskid) {
        this.taskid = taskid;
    }

    public Date getDisposeTime() {
        return disposeTime;
    }

    public void setDisposeTime(Date disposeTime) {
        this.disposeTime = disposeTime;
    }

    public String getDisposeStatus() {
        return disposeStatus;
    }

    public void setDisposeStatus(String disposeStatus) {
        this.disposeStatus = disposeStatus;
    }

    public String getAuditorID() {
        return auditorID;
    }

    public void setAuditorID(String auditorID) {
        this.auditorID = auditorID;
    }

    public String getBasis() {
        return basis;
    }

    public void setBasis(String basis) {
        this.basis = basis;
    }

    @Override
    public String toString() {
        return "Dispose [id=" + id + ", taskid=" + taskid + ", disposeTime=" + disposeTime
                + ", disposeStatus=" + disposeStatus + ", auditorID=" + auditorID + ", basis=" + basis + "]";
    }
}
