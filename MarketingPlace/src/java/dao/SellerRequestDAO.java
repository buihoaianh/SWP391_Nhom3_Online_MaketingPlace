/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import config.ConnectDB;
import java.util.List;
import model.SellerRequest;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class SellerRequestDAO {

    public List<SellerRequest> getRequestsByAccountID(int accountID) throws SQLException {
        String sql = "SELECT * FROM SellerRequests WHERE AccountID = ?";
        PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql);
        ps.setInt(1, accountID);
        ResultSet rs = ps.executeQuery();

        List<SellerRequest> list = new ArrayList<>();
        while (rs.next()) {
            list.add(map(rs));
        }
        return list;
    }

    public List<SellerRequest> getAllRequests() throws SQLException {
        String sql = "SELECT * FROM SellerRequests";
        PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        List<SellerRequest> list = new ArrayList<>();
        while (rs.next()) {
            list.add(map(rs));
        }
        return list;
    }

    public void createRequest(int accountID) throws SQLException {
        String sql = "INSERT INTO SellerRequests (AccountID, RequestDate, Status) VALUES (?, GETDATE(), 'Pending')";
        PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql);
        ps.setInt(1, accountID);
        ps.executeUpdate();
    }

    public void updateStatusAndReason(int requestID, String status, int reviewerID, String reason) throws SQLException {
        String sql = "UPDATE SellerRequests SET Status = ?, ReviewedBy = ?, ReviewDate = GETDATE(), RejectReason = ? WHERE RequestID = ?";
        PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql);
        ps.setString(1, status);
        ps.setInt(2, reviewerID);
        ps.setString(3, reason);
        ps.setInt(4, requestID);
        ps.executeUpdate();
    }

    public SellerRequest getRequestByID(int requestID) throws SQLException {
        String sql = "SELECT * FROM SellerRequests WHERE RequestID = ?";
        PreparedStatement ps = ConnectDB.getConnection().prepareStatement(sql);
        ps.setInt(1, requestID);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            return map(rs);
        }
        return null;
    }

    private SellerRequest map(ResultSet rs) throws SQLException {
        SellerRequest sr = new SellerRequest();
        sr.setRequestId(rs.getInt("RequestID"));
        sr.setAccountId(rs.getInt("AccountID"));
        sr.setRequestDate(rs.getTimestamp("RequestDate"));
        sr.setStatus(rs.getString("Status"));
        sr.setReviewedBy((Integer) rs.getObject("ReviewedBy"));
        sr.setReviewDate(rs.getTimestamp("ReviewDate"));
        sr.setRejectReason(rs.getString("RejectReason"));
        return sr;
    }
}
