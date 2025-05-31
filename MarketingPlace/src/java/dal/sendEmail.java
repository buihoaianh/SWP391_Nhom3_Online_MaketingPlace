/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import javax.mail.Session;
import java.time.LocalDateTime;
import java.util.Properties;
import java.util.UUID;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.InternetAddress;

/**
 *
 * @author Hi Windows 11 Home
 */
public class sendEmail {//send to email
    
    private final int LIMIT_MINUS = 2;
    
    private final String from = "minhtran488930@gmail.com";
    private final String password = "utmt zdhk fxdn icjj";
    
    //Hàm tạo token (link xác thực)
    public String generateToken(){
        return UUID.randomUUID().toString();
    }
    
    private LocalDateTime dateTime(){
        return LocalDateTime.now().plusMinutes(LIMIT_MINUS);
    }
    
    public boolean isOverTime(LocalDateTime time){//tức là sau 1 khoảng thời gian TIME thì nó hết hạn a
        return LocalDateTime.now().isAfter(time);
    }
    
    public void sendEmail(String to, String otp, String name){// thiết lập cấu hình cho máy chủ
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true"); // ✅ đúng là starttls.enable, KHÔNG PHẢI starttle

        
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(from, password);
            }
        };
           
        Session session = Session.getInstance(props, auth); // ✅ PHẢI truyền auth vào

        
        MimeMessage msg = new MimeMessage(session);//để gửi 1 cái file html qua email
        
        try{
            msg.addHeader("Content-type", "text/html; charset=UTF-8");
            msg.setFrom(from);
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            //parse cái địa chỉ người nhận bằng cái InternetAddress, và thêm false để ko có ngoại lệ nếu có lỗi ở trong địa chỉ email
            msg.setSubject("Register Account", "UTF-8");
            String content = "<h3>Chào " + name + "</h3>"
                   + "<p>Mã OTP của bạn là: <strong>" + otp + "</strong></p>"
                   + "<p>Vui lòng nhập mã này để hoàn tất đăng ký.</p>";
            msg.setContent(content,"text/html; charset=UTF-8");
            Transport.send(msg);//guiwr ddi
            System.err.println("Send successfully!");
            
        }catch(Exception e){
            System.err.println("Send Error");
            System.err.println(e);
        }
        
        
        
    }
    
}
