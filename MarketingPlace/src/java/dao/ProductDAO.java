/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import config.ConnectDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import model.Category;
import model.Color;
import model.ProductVariant;
import model.Size;
/**
 *
 * @author tulok
 */
public class ProductDAO extends ConnectDB {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getProducts() {
        List<Product> list = new ArrayList<>();
        String query = "select\n"
                + "p.*, c.CategoryName\n"
                + "from Products p\n"
                + "left join Categories c on p.CategoryID = c.CategoryID "
                + "order by p.CreateProductDate desc";
        try {
            conn = ConnectDB.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                Product o = new Product(rs.getInt(1),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getTimestamp(7),
                        rs.getString(8),
                        new Category(rs.getString("CategoryName")));
                o.setStatus(rs.getString("Status"));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void createProduct(Product po) {
        String sql = "INSERT INTO [Products] ([AccountID]\n"
                + "      ,[ImageURL]\n"
                + "      ,[ProductName]\n"
                + "      ,[CategoryID]\n"
                + "      ,[CreateProductDate]\n"
                + "      ,[Description]\n"
                + "      ,[Status]) VALUES (?, ?, ?, ?, ?,?,?)";

        try {
            conn = ConnectDB.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, po.getAccountId());
            ps.setString(2, po.getImageUrl());
            ps.setString(3, po.getProductName());
            ps.setInt(4, po.getCategoryId());
            ps.setTimestamp(5, po.getCreatedDate());
            ps.setString(6, po.getDescription());
            ps.setString(7, po.getStatus());
            ps.executeUpdate();

            int productId = 0;
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                productId = rs.getInt(1);
            }

            // inser product variant
            String itemSQL = "INSERT INTO [ProductVariant] ([ProductId]\n"
                    + "      ,[ColorId]\n"
                    + "      ,[SizeId]\n"
                    + "      ,[Quantity]\n"
                    + "      ,[Price]) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement itemStmt = conn.prepareStatement(itemSQL);
            for (ProductVariant pi : po.getProductVariants()) {
                itemStmt.setInt(1, productId);
                itemStmt.setInt(2, pi.getColor().getId());
                itemStmt.setInt(3, pi.getSize().getId());
                itemStmt.setInt(4, pi.getQuantity());
                itemStmt.setLong(5, pi.getPrice());
                itemStmt.addBatch();
            }

            itemStmt.executeBatch();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Product getProductById(String id) {
        String query = "select\n"
                + "p.*\n"
                + "from Products p\n"
                + "where p.ProductID = ?";
        try {
            conn = ConnectDB.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, id);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                Product o = new Product(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getTimestamp(7),
                        rs.getString(8),
                        rs.getString(9),
                        getProductVariantsByProductId(rs.getInt(1)));
                return o;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<ProductVariant> getProductVariantsByProductId(int productId) {
        List<ProductVariant> list = new ArrayList<>();
        String query = "select pv.ProductVariantId, pv.ColorId, pv.SizeId,pv.Price,\n"
                + "pv.Quantity from ProductVariant pv\n"
                + "where pv.ProductId = ?\n";
        try {
            conn = ConnectDB.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setInt(1, productId);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                ProductVariant o = new ProductVariant(
                        rs.getInt(1),
                        new Color(rs.getInt(2)),
                        new Size(rs.getInt(3)),
                        rs.getLong(4),
                        rs.getInt(5));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void updateProduct(Product po) {
        String sql = "update [Products] \n"
                + "      set [CategoryID] = ?\n"
                + "      ,[ProductName]= ?\n"
                + "      ,[Description]= ?\n"
                + "      ,[Status]= ?\n"
                + "      ,[ImageURL]= ?\n"
                + "      where [ProductID] = ?";

        try {
            conn = ConnectDB.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(sql);
            ps.setInt(1, po.getCategoryId());
            ps.setString(2, po.getProductName());
            ps.setString(3, po.getDescription());
            ps.setString(4, po.getStatus());
            ps.setString(5, po.getImageUrl());
            ps.setInt(6, po.getProductId());
            ps.executeUpdate();

            //delete variants
            String sqlDelete = "delete from [ProductVariant] where [ProductId] = ?";
            PreparedStatement deleteStmt = conn.prepareStatement(sqlDelete);
            deleteStmt.setInt(1, po.getProductId());
            deleteStmt.executeUpdate();

            // inser product variant
            String itemSQL = "INSERT INTO [ProductVariant] ([ProductId]\n"
                    + "      ,[ColorId]\n"
                    + "      ,[SizeId]\n"
                    + "      ,[Quantity]\n"
                    + "      ,[Price]) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement itemStmt = conn.prepareStatement(itemSQL);
            for (ProductVariant pi : po.getProductVariants()) {
                itemStmt.setInt(1, po.getProductId());
                itemStmt.setInt(2, pi.getColor().getId());
                itemStmt.setInt(3, pi.getSize().getId());
                itemStmt.setInt(4, pi.getQuantity());
                itemStmt.setLong(5, pi.getPrice());
                itemStmt.addBatch();
            }

            itemStmt.executeBatch();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    public ArrayList<Product> getAllProduct() {
//        ArrayList<Product> products = new ArrayList<>();
//        String sql = "SELECT [ProductID]\n"
//                + "      ,[AccountID]\n"
//                + "      ,[ImageURL]\n"
//                + "      ,[ProductName]\n"
//                + "      ,[Price]\n"
//                + "      ,[Quantity]\n"
//                + "      ,[CategoryID]\n"
//                + "      ,[DiscountID]\n"
//                + "      ,[CreateProductDate]\n"
//                + "      ,[Description]\n"
//                + "  FROM [dbo].[Products]";
//        try {
//            PreparedStatement stm = connect.prepareStatement(sql);
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//                Product p = new Product();
//                p.setProductId(rs.getInt("ProductID"));
//                p.setAccountId(rs.getInt("AccountID"));
//                p.setImageUrl(rs.getString("ImageURL"));
//                p.setProductName(rs.getString("ProductName"));
//                p.setPrice(rs.("Price"));
//                p.setQuantity(rs.getInt("Quantity"));
//                p.setCategoryID(rs.getInt("CategoryID"));
//                p.setDiscountId(rs.getInt("DiscountID"));
//                p.setCreateProductDate(rs.getDate("CreateProductDate"));
//                p.setDescription(rs.getString("Description"));
//                products.add(p);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//        return products;
//    }
//
//    public Product getProductByID(int id) {
//        String sql = "SELECT [ProductID]\n"
//                + "      ,[AccountID]\n"
//                + "      ,[ImageURL]\n"
//                + "      ,[ProductName]\n"
//                + "      ,[Price]\n"
//                + "      ,[Quantity]\n"
//                + "      ,[CategoryID]\n"
//                + "      ,[DiscountID]\n"
//                + "      ,[CreateProductDate]\n"
//                + "      ,[Description]\n"
//                + "  FROM [Online_Maketingplace].[dbo].[Products]\n"
//                + "  Where [ProductID] = ?";
//        try {
//            PreparedStatement stm = connect.prepareStatement(sql);
//            stm.setInt(1, id);
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//                Product p = new Product();
//                p.setProductId(rs.getInt("ProductID"));
//                p.setAccountId(rs.getInt("AccountID"));
//                p.setImageURL(rs.getString("ImageURL"));
//                p.setProductName(rs.getString("ProductName"));
//                p.setPrice(rs.getString("Price"));
//                p.setQuantity(rs.getInt("Quantity"));
//                p.setCategoryID(rs.getInt("CategoryID"));
//                p.setDiscountId(rs.getInt("DiscountID"));
//                p.setCreateProductDate(rs.getDate("CreateProductDate"));
//                p.setDescription(rs.getString("Description"));
//                return p;
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return null;
//    }
}
