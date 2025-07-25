/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 *
 * @author tulok
 */
public class DiscountPeriod {

    private int discountPeriodID;
    private int discountID;
    private LocalDateTime startDate;
    private LocalDateTime endDate;

    public DiscountPeriod(int discountId, LocalDate startDate1, LocalDate endDate1) {
    }

    public DiscountPeriod(int discountPeriodID, int discountID, LocalDateTime startDate, LocalDateTime endDate) {
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

    public LocalDateTime getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDateTime startDate) {
        this.startDate = startDate;
    }

    public LocalDateTime getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDateTime endDate) {
        this.endDate = endDate;
    }

    

}
