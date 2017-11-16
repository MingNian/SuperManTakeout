package com.dzp.wm.biz;

import com.dzp.wm.pojo.Reply;

public interface ReplyBiz {
	//添加商铺回应
	public void addReply(Reply reply);
		
	//删除特定的商铺回应
	public void delReply(int replyId);
	
	//获得对应用户评价的商铺回应
	public Reply getReplyByEvaluate(int evaluateId);
	
	//获得特定Id的商铺回应
	public Reply getReply(int replyId);
	
}
