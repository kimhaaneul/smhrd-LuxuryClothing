package com.smhrd.main.controller;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailSender {
    public static void main(String[] args) {
        // SMTP 서버 설정
        String host = "smtp.gmail.com"; // 이메일 호스트 주소
        String username = "komitsu.mail@gmail.com"; // 이메일 계정
        String password = "dcyt obxc kijb uaag"; // 이메일 계정 비밀번호
        
        // 이메일 정보 설정
        String fromEmail = "komitsu.mail@gmail.com"; // 발신자 이메일 주소
        String toEmail = "komitsu.mail@gmail.com"; // 수신자 이메일 주소
        String subject = "이메일 테스트용 입니다."; // 이메일 제목
        String messageContent = "이메일 테스트의 내용"; // 이메일 내용
        
        // SMTP 서버 설정을 위한 프로퍼티 설정
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");
        
        // 세션 생성
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return new javax.mail.PasswordAuthentication(username, password);
            }
        });
        
        try {
            // 메시지 생성
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject(subject);
            message.setText(messageContent);
            
            // 이메일 전송
            Transport.send(message);
            
            System.out.println("이메일이 성공적으로 전송되었습니다.");
        } catch (MessagingException e) {
            System.out.println("이메일 전송 중 오류가 발생하였습니다.");
            e.printStackTrace();
        }
    }
}