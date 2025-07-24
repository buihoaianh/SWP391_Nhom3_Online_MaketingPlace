/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class ProductReportDTO {
     private String categoryName;
    private int productID;
    private String thumbnailURL;
    private String productName;
    private String description;

    public ProductReportDTO() {
    }

    public ProductReportDTO(String categoryName, int productID, String thumbnailURL, String productName, String description) {
        this.categoryName = categoryName;
        this.productID = productID;
        this.thumbnailURL = thumbnailURL;
        this.productName = productName;
        this.description = description;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getThumbnailURL() {
        return thumbnailURL;
    }

    public void setThumbnailURL(String thumbnailURL) {
        this.thumbnailURL = thumbnailURL;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "ProductReportDTO{" + "categoryName=" + categoryName + ", productID=" + productID + ", thumbnailURL=" + thumbnailURL + ", productName=" + productName + ", description=" + description + '}';
    }
    
    
}
