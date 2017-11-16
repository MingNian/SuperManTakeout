package com.dzp.wm.dao.impl;

import java.util.Set;
import java.util.TreeSet;

import com.dzp.wm.dao.CategoryDAO;
import com.dzp.wm.dao.base.impl.BaseDAO;
import com.dzp.wm.pojo.Category;

public class CategoryDAOImpl extends BaseDAO<Category> implements CategoryDAO {

	@Override
	public int getCategoryCount() {
		String hql = " count(*) from Category ";
		return ((Long) getHibernateTemplate().find(hql).get(0)).intValue();
	}

	@Override
	public Set<Category> getCategory(int pageNum, int pageSize) {
		String hql = " from Category ";
		return new TreeSet<Category>(getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql)
				.setFirstResult(pageNum * pageSize - pageSize).setMaxResults(pageSize).list());

	}

	@Override
	public Set<Category> getCategory(int sid) {
		String hql = " from Category where shopId = ? and state = 1 ";
		return new TreeSet<Category>(getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql)
				.setParameter(0, sid).list());
	}

}
