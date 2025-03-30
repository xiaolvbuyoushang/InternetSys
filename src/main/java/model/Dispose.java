package model;

import java.util.Date;

public class Dispose {
    private int id;
    private String taskid;
    private Date disposeTime;
    private String disposeStatus;
    private String auditorID;
    private String basis;

    private String vulnerabilityType; // 漏洞类型
    private Date publishTime; // 发布时间
    private String reviewStatus; // 漏洞审核状态
    private String vulnerabilityContent; // 漏洞内容
    private String vulnerabilityLevel; // 漏洞等级
    private String taskType; // 任务类型
    private Date assignDate; // 分配日期
    private int status; // 状态
    private int companyID; // 公司ID
    private int level; // 级别
    private String auditComment; // 审核意见

    // Getters and Setters

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




    public String getVulnerabilityType() {
        return vulnerabilityType;
    }

    public void setVulnerabilityType(String vulnerabilityType) {
        this.vulnerabilityType = vulnerabilityType;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public String getReviewStatus() {
        return reviewStatus;
    }

    public void setReviewStatus(String reviewStatus) {
        this.reviewStatus = reviewStatus;
    }

    public String getVulnerabilityContent() {
        return vulnerabilityContent;
    }

    public void setVulnerabilityContent(String vulnerabilityContent) {
        this.vulnerabilityContent = vulnerabilityContent;
    }

    public String getVulnerabilityLevel() {
        return vulnerabilityLevel;
    }

    public void setVulnerabilityLevel(String vulnerabilityLevel) {
        this.vulnerabilityLevel = vulnerabilityLevel;
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

    public int getCompanyID() {
        return companyID;
    }

    public void setCompanyID(int companyID) {
        this.companyID = companyID;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getAuditComment() {
        return auditComment;
    }

    public void setAuditComment(String auditComment) {
        this.auditComment = auditComment;
    }

    @Override
    public String toString() {
        return "Dispose [id=" + id + ", taskid=" + taskid + ", disposeTime=" + disposeTime + ", disposeStatus=" + disposeStatus
                + ", auditorID=" + auditorID + ", basis=" + basis + ", vulnerabilityType=" + vulnerabilityType
                + ", publishTime=" + publishTime + ", reviewStatus=" + reviewStatus + ", vulnerabilityContent=" + vulnerabilityContent
                + ", vulnerabilityLevel=" + vulnerabilityLevel + ", taskType=" + taskType + ", assignDate=" + assignDate
                + ", status=" + status + ", companyID=" + companyID + ", level=" + level + ", auditComment=" + auditComment + "]";
    }
}