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
public class PointConversionRules {
    private int RuleID;
    private int OrderHistoryID;
    private int MinAmount;
    private int MaxAmount;
    private int ConversionRate;
    private Date StartDate;
    private Date EndDate;
    private String Status;

    public PointConversionRules() {
    }

    public PointConversionRules(int RuleID, int OrderHistoryID, int MinAmount, int MaxAmount, int ConversionRate, Date StartDate, Date EndDate, String Status) {
        this.RuleID = RuleID;
        this.OrderHistoryID = OrderHistoryID;
        this.MinAmount = MinAmount;
        this.MaxAmount = MaxAmount;
        this.ConversionRate = ConversionRate;
        this.StartDate = StartDate;
        this.EndDate = EndDate;
        this.Status = Status;
    }

    public int getRuleID() {
        return RuleID;
    }

    public void setRuleID(int RuleID) {
        this.RuleID = RuleID;
    }

    public int getOrderHistoryID() {
        return OrderHistoryID;
    }

    public void setOrderHistoryID(int OrderHistoryID) {
        this.OrderHistoryID = OrderHistoryID;
    }

    public int getMinAmount() {
        return MinAmount;
    }

    public void setMinAmount(int MinAmount) {
        this.MinAmount = MinAmount;
    }

    public int getMaxAmount() {
        return MaxAmount;
    }

    public void setMaxAmount(int MaxAmount) {
        this.MaxAmount = MaxAmount;
    }

    public int getConversionRate() {
        return ConversionRate;
    }

    public void setConversionRate(int ConversionRate) {
        this.ConversionRate = ConversionRate;
    }

    public Date getStartDate() {
        return StartDate;
    }

    public void setStartDate(Date StartDate) {
        this.StartDate = StartDate;
    }

    public Date getEndDate() {
        return EndDate;
    }

    public void setEndDate(Date EndDate) {
        this.EndDate = EndDate;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    @Override
    public String toString() {
        return "PointConversionRules{" + "RuleID=" + RuleID + ", OrderHistoryID=" + OrderHistoryID + ", MinAmount=" + MinAmount + ", MaxAmount=" + MaxAmount + ", ConversionRate=" + ConversionRate + ", StartDate=" + StartDate + ", EndDate=" + EndDate + ", Status=" + Status + '}';
    }
    
    
}
