package com.dzp.wm.util;

public class SendEmailThread implements Runnable {
	private EmailUtil e;
	public SendEmailThread(EmailUtil e) {
		this.e=e;
	}
	
	@Override
	public void run() {
		e.sendEmail();
	}

}
