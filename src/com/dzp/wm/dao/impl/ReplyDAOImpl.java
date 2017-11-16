package com.dzp.wm.dao.impl;

import com.dzp.wm.dao.ReplyDAO;
import com.dzp.wm.dao.base.impl.BaseDAO;
import com.dzp.wm.pojo.Evaluate;
import com.dzp.wm.pojo.Reply;

public class ReplyDAOImpl extends BaseDAO<Reply> implements ReplyDAO {

	@Override
	public Reply getReply(int evaluateId) {
		Evaluate evaluate=getHibernateTemplate().load(Evaluate.class, evaluateId);
		return evaluate.getReply();
	}

}
