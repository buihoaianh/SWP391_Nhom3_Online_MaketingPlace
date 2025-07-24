/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class CategoryProductCount {
    private String categoryName;
    private int productCount;

    public CategoryProductCount() {
    }

    public CategoryProductCount(String categoryName, int productCount) {
        this.categoryName = categoryName;
        this.productCount = productCount;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getProductCount() {
        return productCount;
    }

    public void setProductCount(int productCount) {
        this.productCount = productCount;
    }

    @Override
    public String toString() {
        return "CategoryProductCount{" + "categoryName=" + categoryName + ", productCount=" + productCount + '}';
    }
    
    
}
