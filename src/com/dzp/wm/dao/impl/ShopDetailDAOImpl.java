package com.dzp.wm.dao.impl;

import com.dzp.wm.dao.ShopDetailDAO;
import com.dzp.wm.dao.base.impl.BaseDAO;
import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.ShopDetail;

public class ShopDetailDAOImpl extends BaseDAO<ShopDetail> implements ShopDetailDAO {

	@Override
	public ShopDetail getShopDetail(Shop shop) {
		Shop shop1=getHibernateTemplate().load(Shop.class, shop.getId());
		return shop1.getShopDetail();
	}

	@Override
	public void addShopDetail(ShopDetail shopDetail) {
		System.out.println(getHibernateTemplate()==null);
		getHibernateTemplate().save(shopDetail);
	}

}
