package com.dzp.wm.dao;

import java.util.Set;

import com.dzp.wm.dao.base.IBaseDAO;
import com.dzp.wm.pojo.ShopApply;

/**
 * @author Ming
 *
 * 2017年10月9日
 */
public interface ShopApplyDAO extends IBaseDAO<ShopApply>  {
	
	
	 /** 
	 * 返回所有待处理的商家申请数量
	 * @return  			申请成为商家的数量
	 */
	public int getShopApplyCount();
	
	 /** 
	 * 分页显示商家申请信息
	 * @param pageNum		当前第几页
	 * @param pageSize		当前每页显示几条信息
	 * @return   
	 */
	public Set<ShopApply> getShopApply(int pageNum,int pageSize);
	
	public Set<ShopApply> getShopApplyByUserId(int uid);
}
