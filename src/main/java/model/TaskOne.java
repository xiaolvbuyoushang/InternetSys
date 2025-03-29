package model;

import java.util.Date;

public class TaskOne {

    private int taskID;
    private String taskType;
    private Date assignDate;
    private int status;
    private String content;
    private int companyID;
    private int level;
    private String auditComment; // 添加审核意见属性

    public int getTaskID() {
        return taskID;
    }

    public void setTaskID(int taskID) {
        this.taskID = taskID;
    }

    public String getTaskType() {
        return taskType;
    }

    public void setTaskType(String taskType) {
        this.taskType = taskType;
    }

    public Date getAssignDate() {
        return assignDate;
    }

    public void setAssignDate(Date assignDate) {
        this.assignDate = assignDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public int getCompanyID() {
        return companyID;
    }

    public void setCompanyID(int companyID) {
        this.companyID = companyID;
    }


    public String getAuditComment() { // 添加 getter 方法
        return auditComment;
    }

    public void setAuditComment(String auditComment) { // 添加 setter 方法
        this.auditComment = auditComment;
    }
    @Override
    public String toString() {
        return "TaskOne [taskID=" + taskID + ", taskType=" + taskType + ", assignDate=" + assignDate + ", status="
                + status + ", content=" + content + ", companyID=" + companyID + ", level=" + level + "]";
    }


}
