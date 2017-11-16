package com.dzp.wm.dao.impl;

import java.util.Set;

import com.dzp.wm.dao.EvaluateDAO;
import com.dzp.wm.dao.base.impl.BaseDAO;
import com.dzp.wm.pojo.Evaluate;
import com.dzp.wm.pojo.Shop;

public class EvaluateDAOImpl extends BaseDAO<Evaluate> implements EvaluateDAO {

	
	@Override
	public Set<Evaluate> getEvaluates(int shopId) {
		Shop shop=getHibernateTemplate().load(Shop.class, shopId);
		return shop.getEvaluates();
	}
}
