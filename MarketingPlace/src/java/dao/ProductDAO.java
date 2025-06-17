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

/**
 *
 * @author tulok
 */
public class ProductDAO extends ConnectDB {

    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "SELECT [ProductID]\n"
                + "      ,[AccountID]\n"
                + "      ,[ImageURL]\n"
                + "      ,[ProductName]\n"
                + "      ,[Price]\n"
                + "      ,[Quantity]\n"
                + "      ,[CategoryID]\n"
                + "      ,[DiscountID]\n"
                + "      ,[CreateProductDate]\n"
                + "      ,[Description]\n"
                + "  FROM [dbo].[Products]";
        try {
            PreparedStatement stm = connect.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("ProductID"));
                p.setAccountId(rs.getInt("AccountID"));
                p.setImageURL(rs.getString("ImageURL"));
                p.setProductName(rs.getString("ProductName"));
                p.setPrice(rs.getString("Price"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setCategoryID(rs.getInt("CategoryID"));
                p.setDiscountId(rs.getInt("DiscountID"));
                p.setCreateProductDate(rs.getDate("CreateProductDate"));
                p.setDescription(rs.getString("Description"));
                products.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return products;
    }

    public Product getProductByID(int id) {
        String sql = "SELECT [ProductID]\n"
                + "      ,[AccountID]\n"
                + "      ,[ImageURL]\n"
                + "      ,[ProductName]\n"
                + "      ,[Price]\n"
                + "      ,[Quantity]\n"
                + "      ,[CategoryID]\n"
                + "      ,[DiscountID]\n"
                + "      ,[CreateProductDate]\n"
                + "      ,[Description]\n"
                + "  FROM [Online_Maketingplace].[dbo].[Products]\n"
                + "  Where [ProductID] = ?";
        try {
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("ProductID"));
                p.setAccountId(rs.getInt("AccountID"));
                p.setImageURL(rs.getString("ImageURL"));
                p.setProductName(rs.getString("ProductName"));
                p.setPrice(rs.getString("Price"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setCategoryID(rs.getInt("CategoryID"));
                p.setDiscountId(rs.getInt("DiscountID"));
                p.setCreateProductDate(rs.getDate("CreateProductDate"));
                p.setDescription(rs.getString("Description"));
                return p;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
