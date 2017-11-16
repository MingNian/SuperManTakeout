package com.dzp.wm.biz;

import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.ShopDetail;

public interface ShopDetailBiz {
	
	//获取特定商铺信息
	public ShopDetail getShopDetail(Shop shop);

	//修改店铺信息
	public void updateShopDetail(ShopDetail shopDetail);

}
