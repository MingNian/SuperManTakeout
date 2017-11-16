package com.dzp.wm.biz;

import java.util.Set;

import com.dzp.wm.pojo.Admin;
import com.dzp.wm.pojo.User;
import com.dzp.wm.pojo.Category;
import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.ShopApply;
import com.dzp.wm.pojo.ShopDetail;

public interface AdminBiz {

	public Admin getAdmin(Admin admin);

	public int getShopApplyCount();

	public Set<ShopApply> getShopApply(int pageNum, int pageSize);

	public void addCategory(Category category);

	public void updateCategory(Category category);

	public Category getCategory(int categoryId);

	public Set<Category> getCategorys(int pageNum, int pageSize);

	public Admin updateAdmin(Admin admin);

	public void deleteCategory(int categoryId);

	public Set<Shop> getShops(int pageNum, int pageSize,String position,String keyword);

	public void stopBusiness(int shopId);

	public void recoverBusiness(int shopId);

	public Admin login(String loginId, String pwd);

	public ShopApply getShopApply(int shopApplyId);

	public int addShop(Shop shop);

	public void addShopDetail(ShopDetail shopDetail);

	public void deleteShopApply(int shopApplyId);

	public Shop getShop(int shopId);

	public int getShopCount(String keyword);
	
	public Set<User> getUsers(String keyword,int pageNum,int pageSize);
	public int getUserCount(String keyword);
	
	public void updateShopApply(ShopApply shopApply);
}
