package com.dzp.wm.dao;

import com.dzp.wm.dao.base.IBaseDAO;
import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.ShopDetail;

public interface ShopDetailDAO extends IBaseDAO<ShopDetail>  {
	
	//获取特定商铺信息
	public ShopDetail getShopDetail(Shop shop);
	
	 /** 
	 * 认证商家成功之后,添加对应商家详情
	 * @param shopDetail   
	 */
	public void addShopDetail(ShopDetail shopDetail);
	
	
}
