package com.dzp.wm.biz.impl;

import java.util.Set;

import com.dzp.wm.biz.CategoryBiz;
import com.dzp.wm.dao.CategoryDAO;
import com.dzp.wm.pojo.Category;

public class CategoryBizImpl implements CategoryBiz {

	private CategoryDAO categoryDAO=null;

	@Override
	public Set<Category> getCategories(int sid) {
		return categoryDAO.getCategory(sid);
	}

	@Override
	public void addCategory(Category category) {
		categoryDAO.add(category);
	}

	@Override
	public void updateCategory(Category category) {
		categoryDAO.update(category);
	}
	
	@Override
	public Category getCategory(int id) {
		return categoryDAO.get(id);
	}
	
	public CategoryDAO getCategoryDAO() {
		return categoryDAO;
	}

	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}

}
