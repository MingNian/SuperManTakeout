package com.dzp.wm.biz;

import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.ShopDetail;

public interface ShopDetailBiz {
	
	//��ȡ�ض�������Ϣ
	public ShopDetail getShopDetail(Shop shop);

	//�޸ĵ�����Ϣ
	public void updateShopDetail(ShopDetail shopDetail);

}
