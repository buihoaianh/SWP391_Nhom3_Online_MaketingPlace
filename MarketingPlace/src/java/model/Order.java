package model;

import java.util.Date;

public class Order {

    private int orderId;
    private int sellerId;
    private int customerId;
    private Date orderDate;
    private String status;
    private String totalAmount;
    private int paymentId;
    private int orderStatusId;

    public int getOrderStatusId() {
        return orderStatusId;
    }

    public void setOrderStatusId(int orderStatusId) {
        this.orderStatusId = orderStatusId;
    }

    public Order(int orderId, int sellerId, int customerId, Date orderDate, String status, String totalAmount, int paymentId, int orderStatusId) {
        this.orderId = orderId;
        this.sellerId = sellerId;
        this.customerId = customerId;
        this.orderDate = orderDate;
        this.status = status;
        this.totalAmount = totalAmount;
        this.paymentId = paymentId;
        this.orderStatusId = orderStatusId;
    }

    public Order() {
    }

    public Order(int orderId, int sellerId, int customerId, Date orderDate, String status, String totalAmount, int paymentId) {
        this.orderId = orderId;
        this.sellerId = sellerId;
        this.customerId = customerId;
        this.orderDate = orderDate;
        this.status = status;
        this.totalAmount = totalAmount;
        this.paymentId = paymentId;
    }

    // Getters and Setters
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getSellerId() {
        return sellerId;
    }

    public void setSellerId(int sellerId) {
        this.sellerId = sellerId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(String totalAmount) {
        this.totalAmount = totalAmount;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }
}
