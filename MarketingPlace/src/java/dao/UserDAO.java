/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import config.ConnectDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class UserDAO extends ConnectDB {

    public ResultSet getListCustomer(int currentPage, int pageSize) {
        ResultSet rs = null;
        String sql = "Select * from Account where RoleID = 2 order by AccountID offset ? rows fetch next ? rows only";
        try {
            PreparedStatement pre = connect.prepareStatement(sql);
            pre.setInt(1, (currentPage - 1) * pageSize);
            pre.setInt(2, pageSize);
            rs = pre.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    public ResultSet getDetailCustomer(int customerId) {
        ResultSet rs = null;
            String sql = "Select p.ProductName, od.Quantity, od.UnitPrice from OrderDetails od "
                + "inner join Orders o on o.OrderID = od.OrderID "
                + "inner join Products p on od.ProductID = p.ProductID "
                + "where o.CustomerID = ?";
        try {
            PreparedStatement pre = connect.prepareStatement(sql);
            pre.setInt(1, customerId);
            rs = pre.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }
}
