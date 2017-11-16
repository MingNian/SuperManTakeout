package com.dzp.wm.biz.impl;

import com.dzp.wm.biz.ShopBiz;
import com.dzp.wm.dao.ShopDAO;
import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.User;

public class ShopBizImpl implements ShopBiz {

	private ShopDAO shopDAO=null;
	
	@Override
	public Shop getShop(User user) {
		return shopDAO.getShop(user);
	}

	@Override
	public void updateShop(Shop shop) {
		shopDAO.update(shop);
	}
	
	public ShopDAO getShopDAO() {
		return shopDAO;
	}

	public void setShopDAO(ShopDAO shopDAO) {
		this.shopDAO = shopDAO;
	}

}
