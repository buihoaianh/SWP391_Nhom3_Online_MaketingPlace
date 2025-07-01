package dao;

import config.ConnectDB;
import java.sql.*;
import model.*;

public class ProductVariantDAO extends ConnectDB {

    public ProductVariant getProductVariantById(int variantId) {
        String query = "SELECT pv.*, "
                + "p.ProductName, p.AccountID, p.ThumbnailURL, p.CategoryID, "
                + "p.DiscountID, p.CreateProductDate, p.Description, p.Status AS ProductStatus, "
                + "c.ColorId, c.ColorName, s.SizeId, s.SizeName "
                + "FROM ProductVariant pv "
                + "JOIN Products p ON pv.ProductId = p.ProductID "
                + "JOIN Color c ON pv.ColorId = c.ColorId "
                + "JOIN Size s ON pv.SizeId = s.SizeId "
                + "WHERE pv.ProductVariantId = ?";

        try (
                PreparedStatement ps = connect.prepareStatement(query)) {

            ps.setInt(1, variantId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Product
                Product product = new Product();
                product.setProductId(rs.getInt("ProductId"));
                product.setProductName(rs.getString("ProductName"));
                product.setAccountId(rs.getInt("AccountID"));
                product.setThumbnailURL(rs.getString("ThumbnailURL"));
                product.setCategoryID(rs.getInt("CategoryID"));
                product.setDiscountId(rs.getInt("DiscountID"));
                product.setCreateProductDate(rs.getTimestamp("CreateProductDate"));
                product.setDescription(rs.getString("Description"));
                product.setStatus(rs.getString("ProductStatus"));

                // Color
                Color color = new Color();
                color.setId(rs.getInt("ColorId"));
                color.setName(rs.getString("ColorName"));

                // Size
                Size size = new Size();
                size.setId(rs.getInt("SizeId"));
                size.setName(rs.getString("SizeName"));

                // ProductVariant
                ProductVariant variant = new ProductVariant();
                variant.setProductVariantId(rs.getInt("ProductVariantId"));
                variant.setProductId(rs.getInt("ProductId"));
                variant.setQuantity(rs.getInt("Quantity"));
                variant.setPrice(rs.getLong("Price"));
                variant.setStatus(rs.getString("Status"));
                variant.setProduct(product);
                variant.setColor(color);
                variant.setSize(size);

                return variant;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public static void main(String[] args) {
        ProductVariantDAO dao = new ProductVariantDAO();

        int testVariantId = 13; // Thay ID này bằng một ID tồn tại trong bảng ProductVariant

        ProductVariant variant = dao.getProductVariantById(testVariantId);

        if (variant != null) {
            System.out.println("✅ Variant found:");
            System.out.println("Variant ID: " + variant.getProductVariantId());
            System.out.println("Quantity: " + variant.getQuantity());
            System.out.println("Price: " + variant.getPrice());
            System.out.println("Status: " + variant.getStatus());

            System.out.println("\n📦 Product Info:");
            Product product = variant.getProduct();
            System.out.println("Product ID: " + product.getProductId());
            System.out.println("Name: " + product.getProductName());
            System.out.println("Account ID: " + product.getAccountId());
            System.out.println("Category ID: " + product.getCategoryID());
            System.out.println("Thumbnail: " + product.getThumbnailURL());
            System.out.println("Discount ID: " + product.getDiscountId());
            System.out.println("Created Date: " + product.getCreateProductDate());
            System.out.println("Description: " + product.getDescription());
            System.out.println("Status: " + product.getStatus());

            System.out.println("\n🎨 Color: " + variant.getColor().getName()
                    + " (ID: " + variant.getColor().getId() + ")");
            System.out.println("📏 Size: " + variant.getSize().getName()
                    + " (ID: " + variant.getSize().getId() + ")");
        } else {
            System.out.println("❌ Không tìm thấy biến thể với ID = " + testVariantId);
        }
    }
}
