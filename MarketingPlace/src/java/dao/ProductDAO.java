/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import config.ConnectDB;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedHashMap;
import java.util.Map;
import model.Color;
import model.ProductVariant;
import model.Size;

/**
 *
 * @author tulok
 */
public class ProductDAO extends ConnectDB {

//    Connection conn = null;
//    PreparedStatement ps = null;
//    ResultSet rs = null;
//
//    public List<Product> getProducts() {
//        List<Product> list = new ArrayList<>();
//        String query = "select\n"
//                + "p.*, c.CategoryName\n"
//                + "from Products p\n"
//                + "left join Categories c on p.CategoryID = c.CategoryID "
//                + "order by p.CreateProductDate desc";
//        try {
//            conn = ConnectDB.getConnection(); //mo ket noi toi sql
//            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
//            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
//            while (rs.next()) {
//                Product o = new Product(rs.getInt(1),
//                        rs.getString(3),
//                        rs.getString(4),
//                        rs.getTimestamp(7),
//                        rs.getString(8),
//                        new Category(rs.getString("CategoryName")));
//                o.setStatus(rs.getString("Status"));
//                list.add(o);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//    public void createProduct(Product po) {
//        String sql = "INSERT INTO [Products] ([AccountID]\n"
//                + "      ,[ImageURL]\n"
//                + "      ,[ProductName]\n"
//                + "      ,[CategoryID]\n"
//                + "      ,[CreateProductDate]\n"
//                + "      ,[Description]\n"
//                + "      ,[Status]) VALUES (?, ?, ?, ?, ?,?,?)";
//
//        try {
//            conn = ConnectDB.getConnection(); //mo ket noi toi sql
//            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
//            ps.setInt(1, po.getAccountId());
//            ps.setString(2, po.getImageUrl());
//            ps.setString(3, po.getProductName());
//            ps.setInt(4, po.getCategoryId());
//            ps.setTimestamp(5, po.getCreatedDate());
//            ps.setString(6, po.getDescription());
//            ps.setString(7, po.getStatus());
//            ps.executeUpdate();
//
//            int productId = 0;
//            rs = ps.getGeneratedKeys();
//            if (rs.next()) {
//                productId = rs.getInt(1);
//            }
//
//            // inser product variant
//            String itemSQL = "INSERT INTO [ProductVariant] ([ProductId]\n"
//                    + "      ,[ColorId]\n"
//                    + "      ,[SizeId]\n"
//                    + "      ,[Quantity]\n"
//                    + "      ,[Price]) VALUES (?, ?, ?, ?, ?)";
//            PreparedStatement itemStmt = conn.prepareStatement(itemSQL);
//            for (ProductVariant pi : po.getProductVariants()) {
//                itemStmt.setInt(1, productId);
//                itemStmt.setInt(2, pi.getColor().getId());
//                itemStmt.setInt(3, pi.getSize().getId());
//                itemStmt.setInt(4, pi.getQuantity());
//                itemStmt.setLong(5, pi.getPrice());
//                itemStmt.addBatch();
//            }
//
//            itemStmt.executeBatch();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//    public Product getProductById(String id) {
//        String query = "select\n"
//                + "p.*\n"
//                + "from Products p\n"
//                + "where p.ProductID = ?";
//        try {
//            conn = ConnectDB.getConnection(); //mo ket noi toi sql
//            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
//            ps.setString(1, id);
//            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
//            while (rs.next()) {
//                Product o = new Product(rs.getInt(1),
//                        rs.getInt(2),
//                        rs.getString(3),
//                        rs.getString(4),
//                        rs.getInt(5),
//                        rs.getInt(6),
//                        rs.getTimestamp(7),
//                        rs.getString(8),
//                        rs.getString(9),
//                        getProductVariantsByProductId(rs.getInt(1)));
//                return o;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return null;
//    }
//
//    public List<ProductVariant> getProductVariantsByProductId(int productId) {
//        List<ProductVariant> list = new ArrayList<>();
//        String query = "select pv.ProductVariantId, pv.ColorId, pv.SizeId,pv.Price,\n"
//                + "pv.Quantity from ProductVariant pv\n"
//                + "where pv.ProductId = ?\n";
//        try {
//            conn = ConnectDB.getConnection(); //mo ket noi toi sql
//            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
//            ps.setInt(1, productId);
//            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
//            while (rs.next()) {
//                ProductVariant o = new ProductVariant(
//                        rs.getInt(1),
//                        new Color(rs.getInt(2)),
//                        new Size(rs.getInt(3)),
//                        rs.getLong(4),
//                        rs.getInt(5));
//                list.add(o);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//    public void updateProduct(Product po) {
//        String sql = "update [Products] \n"
//                + "      set [CategoryID] = ?\n"
//                + "      ,[ProductName]= ?\n"
//                + "      ,[Description]= ?\n"
//                + "      ,[Status]= ?\n"
//                + "      ,[ImageURL]= ?\n"
//                + "      where [ProductID] = ?";
//
//        try {
//            conn = ConnectDB.getConnection(); //mo ket noi toi sql
//            ps = conn.prepareStatement(sql);
//            ps.setInt(1, po.getCategoryId());
//            ps.setString(2, po.getProductName());
//            ps.setString(3, po.getDescription());
//            ps.setString(4, po.getStatus());
//            ps.setString(5, po.getImageUrl());
//            ps.setInt(6, po.getProductId());
//            ps.executeUpdate();
//
//            //delete variants
//            String sqlDelete = "delete from [ProductVariant] where [ProductId] = ?";
//            PreparedStatement deleteStmt = conn.prepareStatement(sqlDelete);
//            deleteStmt.setInt(1, po.getProductId());
//            deleteStmt.executeUpdate();
//
//            // inser product variant
//            String itemSQL = "INSERT INTO [ProductVariant] ([ProductId]\n"
//                    + "      ,[ColorId]\n"
//                    + "      ,[SizeId]\n"
//                    + "      ,[Quantity]\n"
//                    + "      ,[Price]) VALUES (?, ?, ?, ?, ?)";
//            PreparedStatement itemStmt = conn.prepareStatement(itemSQL);
//            for (ProductVariant pi : po.getProductVariants()) {
//                itemStmt.setInt(1, po.getProductId());
//                itemStmt.setInt(2, pi.getColor().getId());
//                itemStmt.setInt(3, pi.getSize().getId());
//                itemStmt.setInt(4, pi.getQuantity());
//                itemStmt.setLong(5, pi.getPrice());
//                itemStmt.addBatch();
//            }
//
//            itemStmt.executeBatch();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "SELECT p.ProductID, p.AccountID, p.ProductName, p.ThumbnailURL, p.CategoryID, "
                + "p.DiscountID, p.CreateProductDate, p.Description, p.Status, "
                + "pi.ImageURL, "
                + "pv.ProductVariantId, pv.ColorId, pv.SizeId, pv.Quantity AS VariantQuantity, "
                + "pv.Price AS VariantPrice, pv.Status AS VariantStatus "
                + "FROM Products p "
                + "LEFT JOIN ProductImages pi ON p.ProductID = pi.ProductID "
                + "LEFT JOIN ProductVariant pv ON p.ProductID = pv.ProductId "
                + "ORDER BY p.ProductID";

        try {
            PreparedStatement stm = connect.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            Map<Integer, Product> productMap = new LinkedHashMap<>();

            while (rs.next()) {
                int productId = rs.getInt("ProductID");
                Product product = productMap.get(productId);

                if (product == null) {
                    product = new Product();
                    product.setProductId(productId);
                    product.setAccountId(rs.getInt("AccountID"));
                    product.setProductName(rs.getString("ProductName"));
                    product.setThumbnailURL(rs.getString("ThumbnailURL"));
                    product.setCategoryID(rs.getInt("CategoryID"));
                    product.setDiscountId(rs.getInt("DiscountID"));
                    product.setCreateProductDate(rs.getDate("CreateProductDate"));
                    product.setDescription(rs.getString("Description"));
                    product.setStatus(rs.getString("Status"));
                    product.setImageUrls(new ArrayList<>());
                    product.setVariants(new ArrayList<>());
                    productMap.put(productId, product);
                }

                // Add image if exists
                String imageUrl = rs.getString("ImageURL");
                if (imageUrl != null && !product.getImageUrls().contains(imageUrl)) {
                    product.getImageUrls().add(imageUrl);
                }

                // Add variant if exists
                int variantId = rs.getInt("ProductVariantId");
                if (!rs.wasNull()) {
                    ProductVariant variant = new ProductVariant();
                    variant.setProductVariantId(variantId);
                    variant.setProductId(productId);
                    variant.setQuantity(rs.getInt("VariantQuantity"));
                    variant.setPrice(rs.getLong("VariantPrice"));
                    variant.setStatus(rs.getString("VariantStatus"));
                    variant.setProduct(product); // Liên kết ngược lại với Product

                    // Tạo đối tượng Color và Size chỉ với ID (chưa JOIN tên)
                    Color color = new Color();
                    color.setId(rs.getInt("ColorId"));
                    variant.setColor(color);

                    Size size = new Size();
                    size.setId(rs.getInt("SizeId"));
                    variant.setSize(size);

                    product.getVariants().add(variant);
                }
            }

            products.addAll(productMap.values());

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return products;
    }

    public Product getProductByID(int id) {
        String sql = "SELECT p.ProductID, p.AccountID, p.ProductName, p.ThumbnailURL, p.CategoryID, "
                + "p.DiscountID, p.CreateProductDate, p.Description, p.Status, "
                + "pi.ImageURL, "
                + "pv.ProductVariantId, pv.ColorId, pv.SizeId, pv.Quantity AS VariantQuantity, "
                + "pv.Price AS VariantPrice, pv.Status AS VariantStatus "
                + "FROM Products p "
                + "LEFT JOIN ProductImages pi ON p.ProductID = pi.ProductID "
                + "LEFT JOIN ProductVariant pv ON p.ProductID = pv.ProductId "
                + "WHERE p.ProductID = ?";

        try {
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();

            Product product = null;

            while (rs.next()) {
                if (product == null) {
                    product = new Product();
                    product.setProductId(rs.getInt("ProductID"));
                    product.setAccountId(rs.getInt("AccountID"));
                    product.setProductName(rs.getString("ProductName"));
                    product.setThumbnailURL(rs.getString("ThumbnailURL"));
                    product.setCategoryID(rs.getInt("CategoryID"));
                    product.setDiscountId(rs.getInt("DiscountID"));
                    product.setCreateProductDate(rs.getDate("CreateProductDate"));
                    product.setDescription(rs.getString("Description"));
                    product.setStatus(rs.getString("Status"));
                    product.setImageUrls(new ArrayList<>());
                    product.setVariants(new ArrayList<>());
                }

                // Add image if exists
                String imageUrl = rs.getString("ImageURL");
                if (imageUrl != null && !product.getImageUrls().contains(imageUrl)) {
                    product.getImageUrls().add(imageUrl);
                }

                // Add variant if exists
                int variantId = rs.getInt("ProductVariantId");
                if (!rs.wasNull()) {
                    ProductVariant variant = new ProductVariant();
                    variant.setProductVariantId(variantId);
                    variant.setProductId(id);
                    variant.setQuantity(rs.getInt("VariantQuantity"));
                    variant.setPrice(rs.getLong("VariantPrice"));
                    variant.setStatus(rs.getString("VariantStatus"));
                    variant.setProduct(product);

                    // Gán Color và Size (chỉ ID, nếu cần thêm name thì JOIN thêm bảng Color và Size)
                    Color color = new Color();
                    color.setId(rs.getInt("ColorId"));
                    variant.setColor(color);

                    Size size = new Size();
                    size.setId(rs.getInt("SizeId"));
                    variant.setSize(size);

                    product.getVariants().add(variant);
                }
            }

            return product;

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        int testProductId = 12; // ← ID sản phẩm có thật trong database của bạn

        Product p = dao.getProductByID(testProductId);

        if (p != null) {
            System.out.println("✅ Product found:");
            System.out.println("ProductID: " + p.getProductId());
            System.out.println("AccountID: " + p.getAccountId());
            System.out.println("ProductName: " + p.getProductName());
            System.out.println("ThumbnailURL: " + p.getThumbnailURL());
            System.out.println("CategoryID: " + p.getCategoryID());
            System.out.println("DiscountID: " + p.getDiscountId());
            System.out.println("CreateDate: " + p.getCreateProductDate());
            System.out.println("Description: " + p.getDescription());
            System.out.println("Status: " + p.getStatus());

            // In danh sách ảnh
            System.out.println("\n🖼 Image URLs:");
            for (String img : p.getImageUrls()) {
                System.out.println(" - " + img);
            }

            // In danh sách biến thể
            System.out.println("\n🧾 Product Variants:");
            for (ProductVariant variant : p.getVariants()) {
                System.out.println("VariantID: " + variant.getProductVariantId());
                System.out.println("  ColorID: " + (variant.getColor() != null ? variant.getColor().getId() : "null"));
                System.out.println("  SizeID: " + (variant.getSize() != null ? variant.getSize().getId() : "null"));
                System.out.println("  Quantity: " + variant.getQuantity());
                System.out.println("  Price: " + variant.getPrice());
                System.out.println("  Status: " + variant.getStatus());
                System.out.println("-------------------------------");
            }
        } else {
            System.out.println("❌ Không tìm thấy sản phẩm với ID = " + testProductId);
        }
    }

}
