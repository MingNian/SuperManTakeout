package com.dzp.wm.dao;

import com.dzp.wm.dao.base.IBaseDAO;
import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.ShopDetail;

public interface ShopDetailDAO extends IBaseDAO<ShopDetail>  {
	
	//��ȡ�ض�������Ϣ
	public ShopDetail getShopDetail(Shop shop);
	
	 /** 
	 * ��֤�̼ҳɹ�֮��,��Ӷ�Ӧ�̼�����
	 * @param shopDetail   
	 */
	public void addShopDetail(ShopDetail shopDetail);
	
	
}
