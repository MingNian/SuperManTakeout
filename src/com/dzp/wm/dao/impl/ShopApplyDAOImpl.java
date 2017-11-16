package com.dzp.wm.dao.impl;

import java.util.Set;
import java.util.TreeSet;

import com.dzp.wm.dao.ShopApplyDAO;
import com.dzp.wm.dao.base.impl.BaseDAO;
import com.dzp.wm.pojo.ShopApply;

public class ShopApplyDAOImpl extends BaseDAO<ShopApply> implements ShopApplyDAO {


	@Override
	public int getShopApplyCount() {
		String hql = " count(*) from ShopApply  ";
		return ((Long) getHibernateTemplate().find(hql).get(0)).intValue();
	}

	@Override
	public Set<ShopApply> getShopApply(int pageNum, int pageSize) {
		String hql = " from ShopApply sa where sa.state = 1  ";
		return new TreeSet<ShopApply>(getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql)
				.setFirstResult(pageNum * pageSize - pageSize).setMaxResults(pageSize).list());
	}

	@Override
	public Set<ShopApply> getShopApplyByUserId(int uid) {
		String hql = " from ShopApply sa where sa.user.id = ? " ;
		return new TreeSet<ShopApply>(getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql)
				.setParameter(0, uid).list());
	}

}
