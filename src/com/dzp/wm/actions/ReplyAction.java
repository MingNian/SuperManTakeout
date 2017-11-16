package com.dzp.wm.actions;

import java.util.Date;

import com.dzp.wm.biz.ReplyBiz;
import com.dzp.wm.pojo.Evaluate;
import com.dzp.wm.pojo.Reply;

public class ReplyAction {

	private ReplyBiz replyBiz;
	private Reply reply;
	private String content;
	private Evaluate evaluate;
	
	
	public String addReply(){
		reply.setContent(content);
		reply.setEvaluate(evaluate);
		reply.setReplyDate(new Date());
		replyBiz.addReply(reply);
		return "replyList";
		
	}
	
	public String delReply(){
		replyBiz.delReply(reply.getId());
		return "replyList";
	}
	
	public String getReply(){
		replyBiz.getReply(reply.getId());
		return "replyDetail";
	}
	
	public String getReplyByEvaluate(){
		replyBiz.getReplyByEvaluate(evaluate.getId());
		return "replyDetail";
	}

	public ReplyBiz getReplyBiz() {
		return replyBiz;
	}

	public void setReplyBiz(ReplyBiz replyBiz) {
		this.replyBiz = replyBiz;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Evaluate getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(Evaluate evaluate) {
		this.evaluate = evaluate;
	}
	
}
