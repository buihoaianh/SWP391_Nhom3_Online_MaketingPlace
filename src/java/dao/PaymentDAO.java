package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import config.ConnectDB;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class PaymentDAO extends ConnectDB {

    public int insertPayment(int paymentMethodId) {
        int paymentId = -1;
        String sql = "INSERT INTO Payments (PaymentDate, PaymentMethodID) OUTPUT INSERTED.PaymentID VALUES (?, ?)";

        try (
             PreparedStatement ps = connect.prepareStatement(sql)) {

            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String formattedNow = now.format(formatter);

            ps.setString(1, formattedNow);
            ps.setInt(2, paymentMethodId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                paymentId = rs.getInt("PaymentID");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return paymentId;
    }
}
