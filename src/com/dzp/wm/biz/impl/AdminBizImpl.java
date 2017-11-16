package com.dzp.wm.biz.impl;

import java.util.Set;

import com.dzp.wm.biz.AdminBiz;
import com.dzp.wm.dao.AdminDAO;
import com.dzp.wm.dao.CategoryDAO;
import com.dzp.wm.dao.ShopApplyDAO;
import com.dzp.wm.dao.ShopDAO;
import com.dzp.wm.dao.ShopDetailDAO;
import com.dzp.wm.dao.UserDAO;
import com.dzp.wm.pojo.Admin;
import com.dzp.wm.pojo.Category;
import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.ShopApply;
import com.dzp.wm.pojo.ShopDetail;
import com.dzp.wm.pojo.User;

public class AdminBizImpl implements AdminBiz {

	private AdminDAO adminDAO;
	private ShopApplyDAO shopApplyDAO;
	private ShopDAO shopDAO;
	private CategoryDAO categoryDAO;
	private ShopDetailDAO shopDetailDAO;
	private UserDAO userDAO;

	@Override
	public Admin getAdmin(Admin admin) {
		return adminDAO.get(admin.getId());
	}

	@Override
	public int getShopApplyCount() {
		return shopApplyDAO.getShopApplyCount();
	}

	@Override
	public Set<ShopApply> getShopApply(int pageNum, int pageSize) {
		return shopApplyDAO.getShopApply(pageNum, pageSize);
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
	public Category getCategory(int categoryId) {
		return categoryDAO.get(categoryId);
	}

	@Override
	public Set<Category> getCategorys(int pageNum, int pageSize) {
		return categoryDAO.getCategory(pageNum, pageSize);
	}

	@Override
	public Admin updateAdmin(Admin admin) {
		adminDAO.update(admin);
		return adminDAO.get(admin.getId());
	}

	@Override
	public void deleteCategory(int categoryId) {
		categoryDAO.del(categoryId);
	}

	@Override
	public Set<Shop> getShops(int pageNum, int pageSize,String position, String keyword) {
		return shopDAO.searchShop(position, keyword, pageNum,pageSize);
	}

	@Override
	public void stopBusiness(int shopId) {
		Shop shop = shopDAO.get(shopId);
		shopDAO.stopBusiness(shop);
	}

	@Override
	public void recoverBusiness(int shopId) {
		Shop shop = shopDAO.get(shopId);
		shopDAO.recoverBusiness(shop);
	}

	@Override
	public Admin login(String loginId, String pwd) {
		return adminDAO.login(loginId, pwd);
	}

	@Override
	public ShopApply getShopApply(int shopApplyId) {
		return shopApplyDAO.get(shopApplyId);
	}

	@Override
	public int addShop(Shop shop) {
		return (int) shopDAO.add(shop);
	}

	@Override
	public void addShopDetail(ShopDetail shopDetail) {
		shopDetailDAO.add(shopDetail);
	}

	@Override
	public void deleteShopApply(int shopApplyId) {
		shopApplyDAO.del(shopApplyDAO.get(shopApplyId));
	}

	@Override
	public Shop getShop(int shopId) {
		return shopDAO.get(shopId);
	}

	@Override
	public int getShopCount(String keyword) {
		return shopDAO.getShopCount(keyword);
	}
	
	@Override
	public void updateShopApply(ShopApply shopApply) {
		shopApplyDAO.update(shopApply);
	}

	@Override
	public Set<User> getUsers(String keyword, int pageNum, int pageSize) {
		return userDAO.getUsers(keyword, pageNum, pageSize);
	}

	@Override
	public int getUserCount(String keyword) {
		return userDAO.getUserCount(keyword);
	}

	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}

	public void setShopApplyDAO(ShopApplyDAO shopApplyDAO) {
		this.shopApplyDAO = shopApplyDAO;
	}

	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}

	public void setShopDAO(ShopDAO shopDAO) {
		this.shopDAO = shopDAO;
	}

	public void setShopDetailDAO(ShopDetailDAO shopDetailDAO) {
		this.shopDetailDAO = shopDetailDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

}
