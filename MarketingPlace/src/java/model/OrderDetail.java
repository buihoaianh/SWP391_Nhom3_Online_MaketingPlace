package model;

public class OrderDetail {
    private int orderDetailsId;
    private int orderId;
    private int productVariantId;
    private int quantity;
    private String unitPrice;

    public OrderDetail() {}

    public OrderDetail(int orderDetailsId, int orderId, int productVariantId, int quantity, String unitPrice) {
        this.orderDetailsId = orderDetailsId;
        this.orderId = orderId;
        this.productVariantId = productVariantId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }

    // Getters and Setters
    public int getOrderDetailsId() {
        return orderDetailsId;
    }

    public void setOrderDetailsId(int orderDetailsId) {
        this.orderDetailsId = orderDetailsId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductVariantId() {
        return productVariantId;
    }

    public void setProductVariantId(int productVariantId) {
        this.productVariantId = productVariantId;
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
}
