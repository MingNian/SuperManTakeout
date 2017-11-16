package com.dzp.wm.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * @author Ming
 *
 * 2017��10��9��
 */
public class EmailUtil {

	public static String supermanEmailAccount = "supermantakeout@outlook.com";
    public static String supermanEmailPassword = "superman123";
    public static String supermanEmailSMTPHost = "smtp-mail.outlook.com";
    public static String supermanSmtpPort = "587";
    
    
    private String receiveMailAccount ;
    private String mailTopic;
    private String mailContent;

    /**
     * @param receiveMailAccount		���͸����˵��ʼ���ַ
     * @param mailTopic					���͵��ʼ��ı���
     * @param mailContent				���͵��ʼ�������
     */
    public EmailUtil(String receiveMailAccount, String mailTopic, String mailContent) {
		super();
		this.receiveMailAccount = receiveMailAccount;
		this.mailTopic = mailTopic;
		this.mailContent = mailContent;
	}

	public void sendEmail() {
        // 1. ������������, ���������ʼ��������Ĳ�������
        Properties props = new Properties();                    // ��������
        props.setProperty("mail.transport.protocol", "smtp");   // ʹ�õ�Э�飨JavaMail�淶Ҫ��
        props.setProperty("mail.smtp.host", supermanEmailSMTPHost);   // �����˵������ SMTP ��������ַ
        props.setProperty("mail.smtp.auth", "true");            // ��Ҫ������֤
        props.setProperty("mail.smtp.port", supermanSmtpPort);
        props.setProperty("mail.smtp.starttls.enable", "true");
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.socketFactory.fallback", "true");
        props.setProperty("mail.smtp.socketFactory.port", supermanSmtpPort);

        // 2. �������ô����Ự����, ���ں��ʼ�����������
        Session session = Session.getInstance(props,null);
        session.setDebug(true);                                 // ����Ϊdebugģʽ, ���Բ鿴��ϸ�ķ��� log

        // 3. ����һ���ʼ�
        MimeMessage message;
		try {
			message = createMimeMessage(session, supermanEmailAccount, receiveMailAccount);
			
			// 4. ���� Session ��ȡ�ʼ��������
			Transport transport = session.getTransport();
			
			transport.connect(supermanEmailAccount, supermanEmailPassword);
			
			// 6. �����ʼ�, �������е��ռ���ַ, message.getAllRecipients() ��ȡ�������ڴ����ʼ�����ʱ��ӵ������ռ���, ������, ������
			transport.sendMessage(message, message.getAllRecipients());
			
			// 7. �ر�����
			transport.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

    /**
     * ����һ��ֻ�����ı��ļ��ʼ�
     *
     * @param session �ͷ����������ĻỰ
     * @param sendMail ����������
     * @param receiveMail �ռ�������
     * @return
     * @throws Exception
     */
    public MimeMessage createMimeMessage(Session session, String sendMail, String receiveMail) throws Exception {
        // 1. ����һ���ʼ�
        MimeMessage message = new MimeMessage(session);

        // 2. From: �����ˣ��ǳ��й�����ɣ����ⱻ�ʼ�����������Ϊ���ķ������������ʧ�ܣ����޸��ǳƣ�
        message.setFrom(new InternetAddress(sendMail, "��������", "UTF-8"));

        // 3. To: �ռ��ˣ��������Ӷ���ռ��ˡ����͡����ͣ�
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "���������û�", "UTF-8"));

        // 4. Subject: �ʼ����⣨�����й�����ɣ����ⱻ�ʼ�����������Ϊ���ķ������������ʧ�ܣ����޸ı��⣩
        message.setSubject(mailTopic, "UTF-8");

        // 5. Content: �ʼ����ģ�����ʹ��html��ǩ���������й�����ɣ����ⱻ�ʼ�����������Ϊ���ķ������������ʧ�ܣ����޸ķ������ݣ�
        message.setContent(mailContent, "text/html;charset=UTF-8");

        // 6. ���÷���ʱ��
        message.setSentDate(new Date());

        // 7. ��������
        message.saveChanges();

        return message;
    }
}
