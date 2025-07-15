/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class MemberPoints {
    
    private int MemberPointID;
    private int AccountID;
    private int TotalPoints;
    private Date LastUpdated;
    private int RuleID;

    public MemberPoints() {
    }

    public MemberPoints(int MemberPointID, int AccountID, int TotalPoints, Date LastUpdated, int RuleID) {
        this.MemberPointID = MemberPointID;
        this.AccountID = AccountID;
        this.TotalPoints = TotalPoints;
        this.LastUpdated = LastUpdated;
        this.RuleID = RuleID;
    }

    public int getMemberPointID() {
        return MemberPointID;
    }

    public void setMemberPointID(int MemberPointID) {
        this.MemberPointID = MemberPointID;
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    public int getTotalPoints() {
        return TotalPoints;
    }

    public void setTotalPoints(int TotalPoints) {
        this.TotalPoints = TotalPoints;
    }

    public Date getLastUpdated() {
        return LastUpdated;
    }

    public void setLastUpdated(Date LastUpdated) {
        this.LastUpdated = LastUpdated;
    }

    public int getRuleID() {
        return RuleID;
    }

    public void setRuleID(int RuleID) {
        this.RuleID = RuleID;
    }

    @Override
    public String toString() {
        return "MemberPoints{" + "MemberPointID=" + MemberPointID + ", AccountID=" + AccountID + ", TotalPoints=" + TotalPoints + ", LastUpdated=" + LastUpdated + ", RuleID=" + RuleID + '}';
    }
 
    
}
