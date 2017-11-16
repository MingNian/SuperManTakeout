package com.dzp.wm.biz.impl;

import com.dzp.wm.biz.ShopDetailBiz;
import com.dzp.wm.dao.ShopDetailDAO;
import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.ShopDetail;

public class ShopDetailBizImpl implements ShopDetailBiz {

	private ShopDetailDAO shopDetailDAO=null;
	
	@Override
	public ShopDetail getShopDetail(Shop shop) {
		return shopDetailDAO.getShopDetail(shop);
	}
	
	@Override
	public void updateShopDetail(ShopDetail shopDetail) {
		shopDetailDAO.update(shopDetail);
	}

	public ShopDetailDAO getShopDetailDAO() {
		return shopDetailDAO;
	}

	public void setShopDetailDAO(ShopDetailDAO shopDetailDAO) {
		this.shopDetailDAO = shopDetailDAO;
	}

}
