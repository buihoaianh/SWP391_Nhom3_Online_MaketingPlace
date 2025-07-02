package model;

public class ProductVariant {

    private int productVariantId;
    private int productId;
    private Color color;
    private Size size;
    private Long price;
    private int quantity;

    private Product product;
    private Categories category;

    // ✅ Thêm mới
    private String status;

    
    
    public ProductVariant() {
    }
    public ProductVariant(int productVariantId, int productId, Color color, Size size, Long price, int quantity, Product product, Category category) {
        this.productVariantId = productVariantId;
        this.productId = productId;
        this.color = color;
        this.size = size;
        this.price = price;
        this.quantity = quantity;
        this.product = product;
        this.category = category;
    }
    
    

    public ProductVariant(int productVariantId, int productId, Color color, Size size, Long price, int quantity, Product product, Categories category, String status) {
        this.productVariantId = productVariantId;
        this.productId = productId;
        this.color = color;
        this.size = size;
        this.price = price;
        this.quantity = quantity;
        this.product = product;
        this.category = category;
        this.status = status;
    }

    public ProductVariant(Color color, Size size, Long price, int quantity) {
        this.color = color;
        this.size = size;
        this.price = price;
        this.quantity = quantity;
    }

    public ProductVariant(int productVariantId, Color color, Size size, Long price, int quantity) {
        this.productVariantId = productVariantId;
        this.color = color;
        this.size = size;
        this.price = price;
        this.quantity = quantity;
    }

    public int getProductVariantId() {
        return productVariantId;
    }

    public void setProductVariantId(int productVariantId) {
        this.productVariantId = productVariantId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public Size getSize() {
        return size;
    }

    public void setSize(Size size) {
        this.size = size;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Categories getCategory() {
        return category;
    }

    public void setCategory(Categories category) {
        this.category = category;
    }

    // ✅ Getter/setter cho status
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
