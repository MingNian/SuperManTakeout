package com.dzp.wm.dao.impl;

import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import com.dzp.wm.dao.ShopDAO;
import com.dzp.wm.dao.base.impl.BaseDAO;
import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.User;

public class ShopDAOImpl extends BaseDAO<Shop> implements ShopDAO {

	@Override
	public Shop getShop(User user) {
		System.out.println(user.getId());
		String hql = "  from Shop s where s.user.id = ? ";
		List<Shop> shops =  (List<Shop>) getHibernateTemplate().find(hql, user.getId());
		if(shops==null || shops.size()==0)
			return null;
		return shops.get(0);
	}

	@Override
	public void stopBusiness(Shop shop) {
		shop.setStatus(0);
		getHibernateTemplate().update(shop);
	}

	@Override
	public void recoverBusiness(Shop shop) {
		shop.setStatus(1);
		getHibernateTemplate().update(shop);
	}

	@Override
	public int getShopCount(String keyword) {
		String hql = " select count(*) from Shop  where shopName like ? ";
		return ((Long) getHibernateTemplate().find(hql, "%" + keyword + "%").get(0)).intValue();
	}

	@Override
	public Set<Shop> searchShop(String position,String keyword,int pageNum,int pageSize) {
		String hql = "   from Shop  where shopName like ? and shopAddress like ?  ";
		return new TreeSet<Shop>(getHibernateTemplate().getSessionFactory().getCurrentSession()
				.createQuery(hql, Shop.class).setParameter(0, "%" + keyword + "%").setParameter(1, "%" + position + "%")
				.setFirstResult(pageNum * pageSize - pageSize).setMaxResults(pageSize).list());
	}

	@Override
	public Set<Shop> getShop(int pageNum, int pageSize) {
		return searchShop("","", pageNum, pageSize);
	}

}
