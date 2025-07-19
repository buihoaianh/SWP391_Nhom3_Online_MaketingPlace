/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author Hi Windows 11 Home
 */
public class FeedbackDisplayItem {
    private int orderId;
    private Date orderDate;

    private int orderDetailId;
    private int quantity;
    private String unitPrice;

    private int productVariantId;
    private String productName;
    private String thumbnailUrl;

    private String sizeName;
    private String colorName;
    private String categoryName;

    private String customerName;




    public FeedbackDisplayItem() {
    }

    public FeedbackDisplayItem(int orderId, Date orderDate, int orderDetailId, int quantity, String unitPrice, int productVariantId, String productName, String thumbnailUrl, String sizeName, String colorName, String categoryName) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.orderDetailId = orderDetailId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.productVariantId = productVariantId;
        this.productName = productName;
        this.thumbnailUrl = thumbnailUrl;
        this.sizeName = sizeName;
        this.colorName = colorName;
        this.categoryName = categoryName;
    }


    public FeedbackDisplayItem(int orderId, Date orderDate, int orderDetailId, int quantity, String unitPrice, int productVariantId, String productName, String thumbnailUrl, String sizeName, String colorName, String categoryName, String customerName) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.orderDetailId = orderDetailId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.productVariantId = productVariantId;
        this.productName = productName;
        this.thumbnailUrl = thumbnailUrl;
        this.sizeName = sizeName;
        this.colorName = colorName;
        this.categoryName = categoryName;
        this.customerName = customerName;
    }
    

    public String getCustomerName() { 
        return customerName; 
    }
    
    public void setCustomerName(String customerName) { 
        this.customerName = customerName; 
    }

    
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(String unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getProductVariantId() {
        return productVariantId;
    }

    public void setProductVariantId(int productVariantId) {
        this.productVariantId = productVariantId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getThumbnailUrl() {
        return thumbnailUrl;
    }

    public void setThumbnailUrl(String thumbnailUrl) {
        this.thumbnailUrl = thumbnailUrl;
    }

    public String getSizeName() {
        return sizeName;
    }

    public void setSizeName(String sizeName) {
        this.sizeName = sizeName;
    }

    public String getColorName() {
        return colorName;
    }

    public void setColorName(String colorName) {
        this.colorName = colorName;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
    
    
}

