package com.dzp.wm.biz;

import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.User;

public interface ShopBiz {
	
	//��ȡ�ض��û����̵�
	public Shop getShop(User user);
	
	//�޸��ض��̵���Ϣ
	public void updateShop(Shop shop);
		
}
