package com.dzp.wm.test;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.junit.Test;

import com.dzp.wm.util.EmailUtil;

public class WmTest {
	
	private Session session;
	//@Before
	public void setup(){
		Configuration cfg=new Configuration().configure();
		SessionFactory sf=cfg.buildSessionFactory();
		session=sf.openSession();
	}
	
	@Test
	public void test(){
		EmailUtil e = new EmailUtil("973026831@qq.com", "超人外卖认证邮箱","正文adsfffffff");
		try {
			e.sendEmail();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	
	//@After
	public void teardown(){
		session.beginTransaction();
		session.close();
	}

}
