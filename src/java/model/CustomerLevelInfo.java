/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class CustomerLevelInfo {
      private int customerID;
    private String fullName;
    private String email;
    private BigDecimal totalSpent;
    private String memberName;
    private String memberDescription;
    private Date lastUpdated;

    public CustomerLevelInfo() {
    }

    public CustomerLevelInfo(int customerID, String fullName, String email, BigDecimal totalSpent, String memberName, String memberDescription, Date lastUpdated) {
        this.customerID = customerID;
        this.fullName = fullName;
        this.email = email;
        this.totalSpent = totalSpent;
        this.memberName = memberName;
        this.memberDescription = memberDescription;
        this.lastUpdated = lastUpdated;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public BigDecimal getTotalSpent() {
        return totalSpent;
    }

    public void setTotalSpent(BigDecimal totalSpent) {
        this.totalSpent = totalSpent;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getMemberDescription() {
        return memberDescription;
    }

    public void setMemberDescription(String memberDescription) {
        this.memberDescription = memberDescription;
    }

    public Date getLastUpdated() {
        return lastUpdated;
    }

    public void setLastUpdated(Date lastUpdated) {
        this.lastUpdated = lastUpdated;
    }

    @Override
    public String toString() {
        return "CustomerLevelInfo{" + "customerID=" + customerID + ", fullName=" + fullName + ", email=" + email + ", totalSpent=" + totalSpent + ", memberName=" + memberName + ", memberDescription=" + memberDescription + ", lastUpdated=" + lastUpdated + '}';
    }
    
    
}
