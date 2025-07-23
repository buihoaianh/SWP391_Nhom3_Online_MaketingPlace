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
public class OrderHistory {

    private int OrderHistoryID;
    private int OrderID;
    private int CustomerID;
    private BigDecimal OrderTotalAmount;
    private Date CreatedDate;

    public OrderHistory() {
    }

    public OrderHistory(int OrderHistoryID, int OrderID, int CustomerID, BigDecimal OrderTotalAmount, Date CreatedDate) {
        this.OrderHistoryID = OrderHistoryID;
        this.OrderID = OrderID;
        this.CustomerID = CustomerID;
        this.OrderTotalAmount = OrderTotalAmount;
        this.CreatedDate = CreatedDate;
    }

    public int getOrderHistoryID() {
        return OrderHistoryID;
    }

    public void setOrderHistoryID(int OrderHistoryID) {
        this.OrderHistoryID = OrderHistoryID;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(int CustomerID) {
        this.CustomerID = CustomerID;
    }

    public BigDecimal getOrderTotalAmount() {
        return OrderTotalAmount;
    }

    public void setOrderTotalAmount(BigDecimal OrderTotalAmount) {
        this.OrderTotalAmount = OrderTotalAmount;
    }

    public Date getCreatedDate() {
        return CreatedDate;
    }

    public void setCreatedDate(Date CreatedDate) {
        this.CreatedDate = CreatedDate;
    }

    @Override
    public String toString() {
        return "OrderHistory{" + "OrderHistoryID=" + OrderHistoryID + ", OrderID=" + OrderID + ", CustomerID=" + CustomerID + ", OrderTotalAmount=" + OrderTotalAmount + ", CreatedDate=" + CreatedDate + '}';
    }

    
}
