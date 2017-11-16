package com.dzp.wm.dao;

import java.util.Set;

import com.dzp.wm.dao.base.IBaseDAO;
import com.dzp.wm.pojo.ShopApply;

/**
 * @author Ming
 *
 * 2017��10��9��
 */
public interface ShopApplyDAO extends IBaseDAO<ShopApply>  {
	
	
	 /** 
	 * �������д�������̼���������
	 * @return  			�����Ϊ�̼ҵ�����
	 */
	public int getShopApplyCount();
	
	 /** 
	 * ��ҳ��ʾ�̼�������Ϣ
	 * @param pageNum		��ǰ�ڼ�ҳ
	 * @param pageSize		��ǰÿҳ��ʾ������Ϣ
	 * @return   
	 */
	public Set<ShopApply> getShopApply(int pageNum,int pageSize);
	
	public Set<ShopApply> getShopApplyByUserId(int uid);
}
