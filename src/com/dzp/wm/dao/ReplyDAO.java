package com.dzp.wm.dao;

import com.dzp.wm.dao.base.IBaseDAO;
import com.dzp.wm.pojo.Reply;

public interface ReplyDAO extends IBaseDAO<Reply>  {
	
	//��ȡ�ض��û������۶�Ӧ�����̻�Ӧ
	public Reply getReply(int evaluateId);

}
