package com.dzp.wm.biz;

import com.dzp.wm.pojo.Reply;

public interface ReplyBiz {
	//������̻�Ӧ
	public void addReply(Reply reply);
		
	//ɾ���ض������̻�Ӧ
	public void delReply(int replyId);
	
	//��ö�Ӧ�û����۵����̻�Ӧ
	public Reply getReplyByEvaluate(int evaluateId);
	
	//����ض�Id�����̻�Ӧ
	public Reply getReply(int replyId);
	
}
