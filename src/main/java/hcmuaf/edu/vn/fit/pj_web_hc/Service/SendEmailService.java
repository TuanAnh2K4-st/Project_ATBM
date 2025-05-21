package hcmuaf.edu.vn.fit.pj_web_hc.Service;

import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;

public class SendEmailService {
    public static void send(String to, String subject, String content) {
        final String from = "azzhjhjhjhjhj@gmail.com";
        final String password = "exgr dmwm amsj phwc";

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props,
                new Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(from, password);
                    }
                });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(content);
            Transport.send(message);
            System.out.println("Gửi mail thành công tới " + to);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
