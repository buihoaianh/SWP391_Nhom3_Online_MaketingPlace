/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class TopProduct {

    private String productName;
    private int totalSold;

    public TopProduct() {
    }

    public TopProduct(String productName, int totalSold) {
        this.productName = productName;
        this.totalSold = totalSold;
    }

    public String getProductName() {
        return productName;
    }

    public int getTotalSold() {
        return totalSold;
    }
}
