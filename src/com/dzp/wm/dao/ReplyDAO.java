package com.dzp.wm.dao;

import com.dzp.wm.dao.base.IBaseDAO;
import com.dzp.wm.pojo.Reply;

public interface ReplyDAO extends IBaseDAO<Reply>  {
	
	//获取特定用户的评价对应的商铺回应
	public Reply getReply(int evaluateId);

}
