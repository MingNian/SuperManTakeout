package com.dzp.wm.dao.impl;

import java.util.List;

import com.dzp.wm.dao.CommodityDAO;
import com.dzp.wm.dao.base.impl.BaseDAO;
import com.dzp.wm.pojo.Commodity;
import com.dzp.wm.pojo.Shop;

public class CommodityDAOImpl extends BaseDAO<Commodity> implements CommodityDAO {

	@Override
	public int getCommoditiesCount(Shop shop) {
		String hql="select count(*) from Commodity c where c.category.shop.id=? and c.status=true";
		return ((Long)getHibernateTemplate().find(hql, shop.getId()).get(0)).intValue();
	}

	@Override
	public List<Commodity> getCommodities(Shop shop, int pageSize, int pageNum) {
		String hql="from Commodity c where c.category.shop.id=? and c.status=true";
		return getHibernateTemplate().getSessionFactory().getCurrentSession()
				                      .createQuery(hql).setParameter(0, shop.getId())
				                      .setFirstResult((pageNum-1)*pageSize)
				                      .setMaxResults(pageSize).list();
	}

	@Override
	public int getDelCommoditiesCount(Shop shop) {
		String hql="select count(*) from Commodity c where c.category.shop.id=? and c.status=false";
		return ((Long)getHibernateTemplate().find(hql, shop.getId()).get(0)).intValue();
	}

	@Override
	public List<Commodity> getDelCommodities(Shop shop, int pageSize, int pageNum) {
		String hql="from Commodity c where c.category.shop.id=? and c.status=false";
		return getHibernateTemplate().getSessionFactory().getCurrentSession()
										.createQuery(hql).setParameter(0, shop.getId())
						                .setFirstResult((pageNum-1)*pageSize)
						                .setMaxResults(pageSize).list();
	}

	@Override
	public Commodity getCommodity(int id) {
		String hql = "from Commodity c where c.id = ?";
		return  (Commodity) getHibernateTemplate().find(hql, id).get(0);
	}
}