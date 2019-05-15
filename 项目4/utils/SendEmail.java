‘package com.qhit.email;


import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.security.GeneralSecurityException;
import java.util.Properties;

/**
 * Created by 16682 on 2019/3/26.
 */
public class SendEmail {
    public static void main(String [] args) throws GeneralSecurityException, GeneralSecurityException {
        // 收件人电子邮箱
        String to = "908589432@qq.com";

        // 发件人电子邮箱
        String from = "1668287280@qq.com";

        // 指定发送邮件的主机为 smtp.qq.com
        String host = "smtp.qq.com";  //QQ 邮件服务器

        // 获取系统属性
        Properties properties = System.getProperties();

        // 设置邮件服务器
        properties.setProperty("mail.smtp.host", host);

        properties.put("mail.smtp.auth", "true");
        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.ssl.socketFactory", sf);
        // 获取默认session对象
        Session session = Session.getDefaultInstance(properties,new Authenticator(){
            public PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication("1668287280@qq.com", "cvkzaplggvjafcca"); //发件人邮件用户名、密码
            }
        });

        try{
            // 创建默认的 MimeMessage 对象
            MimeMessage message = new MimeMessage(session);

            // Set From: 头部头字段
            message.setFrom(new InternetAddress(from));

            // Set To: 头部头字段
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: 头部头字段
            message.setSubject("我的邮件");

            // 设置消息体
            message.setText("可以实现验证和发消息");

            // 发送消息
            Transport.send(message);
            System.out.println("邮件已经发送！！！！");
        }catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }
}
