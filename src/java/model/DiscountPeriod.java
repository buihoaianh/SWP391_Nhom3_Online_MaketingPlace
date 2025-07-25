/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;

/**
 *
 * @author tulok
 */
public class DiscountPeriod {

    private int discountPeriodID;
    private int discountID;
    private LocalDate startDate;
    private LocalDate endDate;

    public DiscountPeriod() {
    }

    public DiscountPeriod(int discountPeriodID, int discountID, LocalDate startDate, LocalDate endDate) {
        this.discountPeriodID = discountPeriodID;
        this.discountID = discountID;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public int getDiscountPeriodID() {
        return discountPeriodID;
    }

    public void setDiscountPeriodID(int discountPeriodID) {
        this.discountPeriodID = discountPeriodID;
    }

    public int getDiscountID() {
        return discountID;
    }

    public void setDiscountID(int discountID) {
        this.discountID = discountID;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }
    
}
