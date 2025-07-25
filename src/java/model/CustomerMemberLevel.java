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
public class CustomerMemberLevel {
    
    private int CustomerMemberLevelID;
    private int CustomerID;
    private BigDecimal TotalSpent;
    private int MemberID;
    private Date LastUpdated;

    public CustomerMemberLevel() {
    }

    public CustomerMemberLevel(int CustomerMemberLevelID, int CustomerID, BigDecimal TotalSpent, int MemberID, Date LastUpdated) {
        this.CustomerMemberLevelID = CustomerMemberLevelID;
        this.CustomerID = CustomerID;
        this.TotalSpent = TotalSpent;
        this.MemberID = MemberID;
        this.LastUpdated = LastUpdated;
    }

    public int getCustomerMemberLevelID() {
        return CustomerMemberLevelID;
    }

    public void setCustomerMemberLevelID(int CustomerMemberLevelID) {
        this.CustomerMemberLevelID = CustomerMemberLevelID;
    }

    public int getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(int CustomerID) {
        this.CustomerID = CustomerID;
    }

    public BigDecimal getTotalSpent() {
        return TotalSpent;
    }

    public void setTotalSpent(BigDecimal TotalSpent) {
        this.TotalSpent = TotalSpent;
    }

    public int getMemberID() {
        return MemberID;
    }

    public void setMemberID(int MemberID) {
        this.MemberID = MemberID;
    }

    public Date getLastUpdated() {
        return LastUpdated;
    }

    public void setLastUpdated(Date LastUpdated) {
        this.LastUpdated = LastUpdated;
    }

    @Override
    public String toString() {
        return "CustomerMemberLevel{" + "CustomerMemberLevelID=" + CustomerMemberLevelID + ", CustomerID=" + CustomerID + ", TotalSpent=" + TotalSpent + ", MemberID=" + MemberID + ", LastUpdated=" + LastUpdated + '}';
    }

    
   
   
    
}
