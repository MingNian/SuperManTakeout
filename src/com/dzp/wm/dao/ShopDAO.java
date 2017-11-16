package com.dzp.wm.dao;

import java.util.Set;

import com.dzp.wm.dao.base.IBaseDAO;
import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.User;

public interface ShopDAO extends IBaseDAO<Shop>{
	
	//��ȡ�ض��û����̵�
	public Shop getShop(User user);
	
	 /** 
	 * ���ݹؼ��������̼�
	 * @param keyword		�ؼ���
	 * @return   			�̼�Set����
	 */
	public Set<Shop> searchShop(String position,String keyword,int pageNum,int pageSize);
	
	 /** 
	 * ��ͣӪҵ
	 * @param shop 			����ͣӪҵ���̼� 
	 * 0  ����ֹ����  1 ��ʾ�̼���Ϣ��  2 ��ʾ�̼ҿ����� 
	 */
	public void stopBusiness(Shop shop);
	
	 /** 
	 * �ָ�Ӫҵ
	 * @param shop			���ָ�Ӫҵ���̼�  
	 * 0  ����ֹ����  1 ��ʾ�̼���Ϣ��  2 ��ʾ�̼ҿ����� 
	 */
	public void recoverBusiness(Shop shop);
	
	 /** 
	 * ��ȡ�̼�������
	 * @return   
	 */
	public int getShopCount(String keyword);
	
	/** 
	 * 
	 * @param pageNum		��ǰ�ڼ�ҳ
	 * @param pageSize		ÿҳ��ʾ������Ϣ
	 * @return   
	 *
	 * @author Ming
	 */
	public Set<Shop> getShop(int pageNum,int pageSize);
	
}
