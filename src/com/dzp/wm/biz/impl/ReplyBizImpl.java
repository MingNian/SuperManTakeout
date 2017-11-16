package com.dzp.wm.biz.impl;

import com.dzp.wm.biz.ReplyBiz;
import com.dzp.wm.dao.ReplyDAO;
import com.dzp.wm.pojo.Reply;

public class ReplyBizImpl implements ReplyBiz {
	
	private ReplyDAO replyDAO=null;

	@Override
	public void addReply(Reply reply) {
		replyDAO.add(reply);
	}

	@Override
	public void delReply(int replyId) {
		replyDAO.del(replyId);
	}

	@Override
	public Reply getReply(int replyId) {
		return replyDAO.get(replyId);
	}
	
	@Override
	public Reply getReplyByEvaluate(int evaluateId) {
		return replyDAO.getReply(evaluateId);
	}
	
	public ReplyDAO getReplyDAO() {
		return replyDAO;
	}

	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}

	
}
