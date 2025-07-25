/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tulok
 */
public class Discount {

    private int discountID;
    private String discountName;
    private String discountType;
    private String discountValue;
    private boolean status;
    private String description;

    public Discount(String discountName, String discountValue, String description, boolean status, String description1) {
        this.discountName = discountName;
        this.discountValue = discountValue;
        this.status = status;
        this.description = description;
    }

    

    public Discount() {
    }

    public Discount(int discountID, String discountName, String discountType, String discountValue, boolean status, String description) {
        this.discountID = discountID;
        this.discountName = discountName;
        this.discountType = discountType;
        this.discountValue = discountValue;
        this.status = status;
        this.description = description;
    }

    public int getDiscountID() {
        return discountID;
    }

    public void setDiscountID(int discountID) {
        this.discountID = discountID;
    }

    public String getDiscountName() {
        return discountName;
    }

    public void setDiscountName(String discountName) {
        this.discountName = discountName;
    }

    public String getDiscountType() {
        return discountType;
    }

    public void setDiscountType(String discountType) {
        this.discountType = discountType;
    }

    public String getDiscountValue() {
        return discountValue;
    }

    public void setDiscountValue(String discountValue) {
        this.discountValue = discountValue;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
