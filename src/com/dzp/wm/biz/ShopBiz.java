package com.dzp.wm.biz;

import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.User;

public interface ShopBiz {
	
	//获取特定用户的商店
	public Shop getShop(User user);
	
	//修改特定商店信息
	public void updateShop(Shop shop);
		
}
