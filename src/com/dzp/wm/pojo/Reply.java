package com.dzp.wm.pojo;

import java.util.Date;

//��Ӧ���̻�Ӧt_reply
public class Reply {
	private int id;
	private String content;
	private Date replyDate;
	private Evaluate evaluate;
	
	public Reply(){}

	public Reply(int id, String content, Date replyDate, Evaluate evaluate) {
		super();
		this.id = id;
		this.content = content;
		this.replyDate = replyDate;
		this.evaluate = evaluate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	public Evaluate getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(Evaluate evaluate) {
		this.evaluate = evaluate;
	}
}
