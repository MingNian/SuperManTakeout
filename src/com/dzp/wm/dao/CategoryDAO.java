package com.dzp.wm.dao;

import java.util.Set;

import com.dzp.wm.dao.base.IBaseDAO;
import com.dzp.wm.pojo.Category;

/**
 * @author Ming
 *
 * 2017��10��9��
 */
public interface CategoryDAO  extends IBaseDAO<Category>  {

	
	 /** 
	 * ���ز�ϵ�ܸ���
	 * @return   			���ز�ϵ�ܸ���
	 */
	public int getCategoryCount();
	
	 /** 
	 * ��ҳ������ʾ����
	 * @param pageNum		��ǰ�ڼ�ҳ
	 * @param pageSize		ÿҳ��ʾ������Ϣ
	 * @return   
	 */
	public Set<Category> getCategory(int pageNum,int pageSize);
	
	public Set<Category> getCategory(int sid);
	
}
