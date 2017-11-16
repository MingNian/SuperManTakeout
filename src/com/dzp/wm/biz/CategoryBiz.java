package com.dzp.wm.biz;

import java.util.Set;

import com.dzp.wm.pojo.Category;

public interface CategoryBiz {
	
	
	public Set<Category> getCategories(int sid);
	public Category getCategory(int id);
	public void addCategory(Category category);
	public void updateCategory(Category category);
	
	
}
