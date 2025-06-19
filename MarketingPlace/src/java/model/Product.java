/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Product {

    private int productId;
    private int accountId;
    private String imageUrl;
    private String productName;
    private int categoryId;
    private Integer discountId;
    private Timestamp createdDate;
    private String description;
    private String status;

    private Category category;
    private List<ProductVariant> productVariants;

    public Product() {
    }

    public Product(int productId, int accountId, String imageUrl, String productName, int categoryId, Integer discountId, Timestamp createdDate, String description, String status, Category category, List<ProductVariant> productVariants) {
        this.productId = productId;
        this.accountId = accountId;
        this.imageUrl = imageUrl;
        this.productName = productName;
        this.categoryId = categoryId;
        this.discountId = discountId;
        this.createdDate = createdDate;
        this.description = description;
        this.status = status;
        this.category = category;
        this.productVariants = productVariants;
    }
    
    public Product(int productId, int accountId, String imageUrl, String productName, int categoryId, Integer discountId, Timestamp createdDate, String description, String status, List<ProductVariant> productVariants) {
        this.productId = productId;
        this.accountId = accountId;
        this.imageUrl = imageUrl;
        this.productName = productName;
        this.categoryId = categoryId;
        this.discountId = discountId;
        this.createdDate = createdDate;
        this.description = description;
        this.status = status;
        this.productVariants = productVariants;
    }

    public Product(int productId, String imageUrl, String productName, Timestamp createdDate, String description, Category category) {
        this.productId = productId;
        this.imageUrl = imageUrl;
        this.productName = productName;
        this.createdDate = createdDate;
        this.description = description;
        this.category = category;
    }

    public Product(int accountId, String imageUrl, String productName, int categoryId, Timestamp createdDate, String description, String status, List<ProductVariant> productVariants) {
        this.accountId = accountId;
        this.imageUrl = imageUrl;
        this.productName = productName;
        this.categoryId = categoryId;
        this.createdDate = createdDate;
        this.description = description;
        this.status = status;
        this.productVariants = productVariants;
    }

    public Product(int productId, String imageUrl, String productName, int categoryId, String description, String status, List<ProductVariant> productVariants) {
        this.productId = productId;
        this.imageUrl = imageUrl;
        this.productName = productName;
        this.categoryId = categoryId;
        this.description = description;
        this.status = status;
        this.productVariants = productVariants;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getDiscountId() {
        return discountId;
    }

    public void setDiscountId(Integer discountId) {
        this.discountId = discountId;
    }

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<ProductVariant> getProductVariants() {
        return productVariants;
    }

    public void setProductVariants(List<ProductVariant> productVariants) {
        this.productVariants = productVariants;
    }

}
