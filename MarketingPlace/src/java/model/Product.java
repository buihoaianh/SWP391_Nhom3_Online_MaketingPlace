package model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Product {
    private int productId;
    private int accountId;
    private String productName;
    private String thumbnailURL;
    private int categoryID;
    private int discountId;
    private Timestamp createProductDate;
    private String description;
    private String status;

    // Mới thêm:
    private List<String> imageUrls;
    private List<ProductVariant> variants;
    
    //Thêm mới
    private Category category;
    private List<ProductVariant> productVariants;
    private List<ProductImage> images;

    
    

    public Product(int productId, int accountId, String imageUrl, String productName, int categoryId, Integer discountId, Timestamp createdDate, String description, String status, Category category, List<ProductVariant> productVariants) {
        this.productId = productId;
        this.accountId = accountId;
        this.thumbnailURL = imageUrl;//private String imageUrl;
        this.productName = productName;
        this.categoryID = categoryId;//private int categoryId;
        this.discountId = discountId;
        this.createProductDate = createdDate;//private Timestamp createdDate;
        this.description = description;
        this.status = status;
        this.category = category;
        this.productVariants = productVariants;
    }
    
    public Product(int productId, int accountId, String imageUrl, String productName, int categoryId, Integer discountId, Timestamp createdDate, String description, String status, List<ProductVariant> productVariants) {
        this.productId = productId;
        this.accountId = accountId;
        this.thumbnailURL = imageUrl;
        this.productName = productName;
        this.categoryID = categoryId;
        this.discountId = discountId;
        this.createProductDate = createdDate;
        this.description = description;
        this.status = status;
        this.productVariants = productVariants;
    }
    
    public Product(int productId, int accountId, String imageUrl, String productName, int categoryId, Integer discountId, Timestamp createdDate, String description, String status, List<ProductVariant> productVariants, List<ProductImage> images) {
        this.productId = productId;
        this.accountId = accountId;
        this.thumbnailURL = imageUrl;
        this.productName = productName;
        this.categoryID = categoryId;
        this.discountId = discountId;
        this.createProductDate = createdDate;
        this.description = description;
        this.status = status;
        this.productVariants = productVariants;
        this.images = images;
    }

    public Product(int productId, String imageUrl, String productName, Timestamp createdDate, String description, Category category) {
        this.productId = productId;
        this.thumbnailURL = imageUrl;
        this.productName = productName;
        this.createProductDate = createdDate;
        this.description = description;
        this.category = category;
    }

    public Product(int accountId, String imageUrl, String productName, int categoryId, Timestamp createdDate, String description, String status, List<ProductVariant> productVariants) {
        this.accountId = accountId;
        this.thumbnailURL = imageUrl;
        this.productName = productName;
        this.categoryID = categoryId;
        this.createProductDate = createdDate;
        this.description = description;
        this.status = status;
        this.productVariants = productVariants;
    }

    public Product(int productId, String imageUrl, String productName, int categoryId, String description, String status, List<ProductVariant> productVariants) {
        this.productId = productId;
        this.thumbnailURL = imageUrl;
        this.productName = productName;
        this.categoryID = categoryId;
        this.description = description;
        this.status = status;
        this.productVariants = productVariants;
    }
    
    
    public Product() {
        imageUrls = new ArrayList<>();
        variants = new ArrayList<>();
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

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getThumbnailURL() {
        return thumbnailURL;
    }

    public void setThumbnailURL(String thumbnailURL) {
        this.thumbnailURL = thumbnailURL;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public int getDiscountId() {
        return discountId;
    }

    public void setDiscountId(int discountId) {
        this.discountId = discountId;
    }

    public Timestamp getCreateProductDate() {
        return createProductDate;
    }

    public void setCreateProductDate(Timestamp createProductDate) {
        this.createProductDate = createProductDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<String> getImageUrls() {
        return imageUrls;
    }

    public void setImageUrls(List<String> imageUrls) {
        this.imageUrls = imageUrls;
    }

    public List<ProductVariant> getVariants() {
        return variants;
    }

    public void setVariants(List<ProductVariant> variants) {
        this.variants = variants;
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

    public List<ProductImage> getImages() {
        return images;
    }

    public void setImages(List<ProductImage> images) {
        this.images = images;
    }
    
}
