/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.Timestamp;
/**
 *
 * @author Admin
 */
public class SellerRequest {
    private int requestId;
    private int accountId;
    private Timestamp requestDate;
    private String status;
    private Integer reviewedBy;
    private Timestamp reviewDate;
    private String rejectReason;

    public SellerRequest() {
    }

    public SellerRequest(int requestId, int accountId, Timestamp requestDate, String status, Integer reviewedBy, Timestamp reviewDate, String rejectReason) {
        this.requestId = requestId;
        this.accountId = accountId;
        this.requestDate = requestDate;
        this.status = status;
        this.reviewedBy = reviewedBy;
        this.reviewDate = reviewDate;
        this.rejectReason = rejectReason;
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public Timestamp getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(Timestamp requestDate) {
        this.requestDate = requestDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getReviewedBy() {
        return reviewedBy;
    }

    public void setReviewedBy(Integer reviewedBy) {
        this.reviewedBy = reviewedBy;
    }

    public Timestamp getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(Timestamp reviewDate) {
        this.reviewDate = reviewDate;
    }

    public String getRejectReason() {
        return rejectReason;
    }

    public void setRejectReason(String rejectReason) {
        this.rejectReason = rejectReason;
    }
    
    
}
