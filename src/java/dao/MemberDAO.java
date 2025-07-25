package dao;

import config.ConnectDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Member;

public class MemberDAO extends ConnectDB {

    private Connection connect;

    public MemberDAO() {
        try {
            this.connect = ConnectDB.getConnection();
            if (this.connect == null) {
                System.err.println("Fatal error: connect in MemberDAO is null.");
                throw new SQLException("Unable to create Connection.");
            } else {
                System.out.println("Successfully connected to database in MemberDAO.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean addMember(Member m) {
        String sql = "INSERT INTO Member (MemberName, MinAmount, MaxAmount, Description, ImageURL) "
                + "VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement pre = connect.prepareStatement(sql)) {
            pre.setString(1, m.getMemberName());
            pre.setString(2, m.getMinAmount());
            pre.setString(3, m.getMaxAmount());
            pre.setString(4, m.getDescription());
            pre.setString(5, m.getImageURL());
            return pre.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("addMember error: " + e.getMessage());
        }
        return false;
    }

    public boolean updateMember(Member m) {
        String sql = "UPDATE Member SET MemberName = ?, MinAmount = ?, MaxAmount = ?, Description = ?, ImageURL = ? "
                + "WHERE MemberID = ?";
        try (PreparedStatement pre = connect.prepareStatement(sql)) {
            pre.setString(1, m.getMemberName());
            pre.setString(2, m.getMinAmount());
            pre.setString(3, m.getMaxAmount());
            pre.setString(4, m.getDescription());
            pre.setString(5, m.getImageURL());
            pre.setInt(6, m.getMemberID());
            return pre.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("updateMember error: " + e.getMessage());
        }
        return false;
    }

    public boolean deleteMember(int id) {
        String sql = "DELETE FROM Member WHERE MemberID = ?";
        try (PreparedStatement pre = connect.prepareStatement(sql)) {
            pre.setInt(1, id);
            return pre.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("deleteMember error: " + e.getMessage());
        }
        return false;
    }

    public List<Member> getAllMembers() {
        List<Member> list = new ArrayList<>();
        String sql = "SELECT * FROM Member";

        try (PreparedStatement pre = connect.prepareStatement(sql); ResultSet rs = pre.executeQuery()) {

            while (rs.next()) {
                Member m = new Member(
                        rs.getInt("MemberID"),
                        rs.getString("MemberName"),
                        rs.getString("MinAmount"),
                        rs.getString("MaxAmount"),
                        rs.getString("Description"),
                        rs.getString("ImageURL")
                );
                list.add(m);
            }
        } catch (SQLException e) {
            System.out.println("getAllMembers error: " + e.getMessage());
        }

        return list;
    }

    public Member getMemberById(int id) {
        String sql = "SELECT * FROM Member WHERE MemberID = ?";
        try (PreparedStatement pre = connect.prepareStatement(sql)) {
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return new Member(
                        rs.getInt("MemberID"),
                        rs.getString("MemberName"),
                        rs.getString("MinAmount"),
                        rs.getString("MaxAmount"),
                        rs.getString("Description"),
                        rs.getString("ImageURL")
                );
            }
        } catch (SQLException e) {
            System.out.println("getMemberById error: " + e.getMessage());
        }
        return null;
    }

    public static void printMemberList(List<Member> list) {
        if (list.isEmpty()) {
            System.out.println("No members found.");
            return;
        }

        System.out.printf("%-5s | %-15s | %-8s | %-8s | %-30s | %-30s%n",
                "ID", "Name", "MinAmount", "MaxAmount", "Description", "Image URL");
        System.out.println("-------------------------------------------------------------------------------------------------------------");

        for (Member m : list) {
            System.out.printf("%-5d | %-15s | %-8d | %-8d | %-30s | %-30s%n",
                    m.getMemberID(),
                    m.getMemberName(),
                    m.getMinAmount(),
                    m.getMaxAmount(),
                    m.getDescription(),
                    m.getImageURL());
        }
    }

    public List<Member> searchMemberByName(String keyword) {
        List<Member> list = new ArrayList<>();
        String sql = "SELECT * FROM Member WHERE MemberName COLLATE Latin1_General_CI_AI LIKE ?";

        try (PreparedStatement pre = connect.prepareStatement(sql)) {
            pre.setString(1, "%" + keyword + "%");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Member m = new Member(
                        rs.getInt("MemberID"),
                        rs.getString("MemberName"),
                        rs.getString("MinAmount"),
                        rs.getString("MaxAmount"),
                        rs.getString("Description"),
                        rs.getString("ImageURL")
                );
                list.add(m);
            }
        } catch (SQLException e) {
            System.out.println("searchMemberByName error: " + e.getMessage());
        }

        return list;
    }

    public List<Member> getMembersByPage(int page, int pageSize) {
        List<Member> list = new ArrayList<>();
        String sql = "SELECT * FROM Member ORDER BY MemberID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement pre = connect.prepareStatement(sql)) {
            pre.setInt(1, (page - 1) * pageSize);
            pre.setInt(2, pageSize);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Member m = new Member(
                        rs.getInt("MemberID"),
                        rs.getString("MemberName"),
                        rs.getString("MinAmount"),
                        rs.getString("MaxAmount"),
                        rs.getString("Description"),
                        rs.getString("ImageURL")
                );
                list.add(m);
            }
        } catch (SQLException e) {
            System.out.println("getMembersByPage error: " + e.getMessage());
        }

        return list;
    }

    public int getTotalMembers() {
        String sql = "SELECT COUNT(*) FROM Member";
        try (PreparedStatement pre = connect.prepareStatement(sql)) {
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getTotalMembers error: " + e.getMessage());
        }
        return 0;
    }

    public static void main(String[] args) {
        MemberDAO dao = new MemberDAO();

//        Member m = new Member(0, "Bạc", 1000, 2999, "Hạng bạc", "bac.png");
//        dao.addMember(m);
//        printMemberList(dao.getAllMembers());
    }
}
