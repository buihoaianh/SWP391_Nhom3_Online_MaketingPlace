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
    private int provinceCode, districtCode, wardCode;
    private String provinceName, districtName, wardName;

    public int getOrderStatusId() {
        return orderStatusId;
    }

    public void setOrderStatusId(int orderStatusId) {
        this.orderStatusId = orderStatusId;
    }

    public Order(int orderId, int sellerId, int customerId, Date orderDate, String status, String totalAmount, int paymentId, int orderStatusId, int provinceCode, int districtCode, int wardCode, String provinceName, String districtName, String wardName) {
        this.orderId = orderId;
        this.sellerId = sellerId;
        this.customerId = customerId;
        this.orderDate = orderDate;
        this.status = status;
        this.totalAmount = totalAmount;
        this.paymentId = paymentId;
        this.orderStatusId = orderStatusId;
        this.provinceCode = provinceCode;
        this.districtCode = districtCode;
        this.wardCode = wardCode;
        this.provinceName = provinceName;
        this.districtName = districtName;
        this.wardName = wardName;
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

    public int getProvinceCode() {
        return provinceCode;
    }

    public void setProvinceCode(int provinceCode) {
        this.provinceCode = provinceCode;
    }

    public int getDistrictCode() {
        return districtCode;
    }

    public void setDistrictCode(int districtCode) {
        this.districtCode = districtCode;
    }

    public int getWardCode() {
        return wardCode;
    }

    public void setWardCode(int wardCode) {
        this.wardCode = wardCode;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }

    public String getWardName() {
        return wardName;
    }

    public void setWardName(String wardName) {
        this.wardName = wardName;
    }

}
