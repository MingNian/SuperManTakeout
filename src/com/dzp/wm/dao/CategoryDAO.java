package com.dzp.wm.dao;

import java.util.Set;

import com.dzp.wm.dao.base.IBaseDAO;
import com.dzp.wm.pojo.Category;

/**
 * @author Ming
 *
 * 2017年10月9日
 */
public interface CategoryDAO  extends IBaseDAO<Category>  {

	
	 /** 
	 * 返回菜系总个数
	 * @return   			返回菜系总个数
	 */
	public int getCategoryCount();
	
	 /** 
	 * 在页面中显示分类
	 * @param pageNum		当前第几页
	 * @param pageSize		每页显示几条信息
	 * @return   
	 */
	public Set<Category> getCategory(int pageNum,int pageSize);
	
	public Set<Category> getCategory(int sid);
	
}
