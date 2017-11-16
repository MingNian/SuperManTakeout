package com.dzp.wm.dao;

import java.util.Set;

import com.dzp.wm.dao.base.IBaseDAO;
import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.User;

public interface ShopDAO extends IBaseDAO<Shop>{
	
	//获取特定用户的商店
	public Shop getShop(User user);
	
	 /** 
	 * 根据关键字搜索商家
	 * @param keyword		关键字
	 * @return   			商家Set集合
	 */
	public Set<Shop> searchShop(String position,String keyword,int pageNum,int pageSize);
	
	 /** 
	 * 暂停营业
	 * @param shop 			被暂停营业的商家 
	 * 0  被禁止开店  1 表示商家休息中  2 表示商家开店中 
	 */
	public void stopBusiness(Shop shop);
	
	 /** 
	 * 恢复营业
	 * @param shop			被恢复营业的商家  
	 * 0  被禁止开店  1 表示商家休息中  2 表示商家开店中 
	 */
	public void recoverBusiness(Shop shop);
	
	 /** 
	 * 获取商家总数量
	 * @return   
	 */
	public int getShopCount(String keyword);
	
	/** 
	 * 
	 * @param pageNum		当前第几页
	 * @param pageSize		每页显示几条信息
	 * @return   
	 *
	 * @author Ming
	 */
	public Set<Shop> getShop(int pageNum,int pageSize);
	
}
