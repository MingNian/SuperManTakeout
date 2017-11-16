package com.dzp.wm.biz.impl;

import java.util.List;
import java.util.Set;

import com.dzp.wm.biz.UserBiz;
import com.dzp.wm.dao.ShopApplyDAO;
import com.dzp.wm.dao.UserAddressDAO;
import com.dzp.wm.dao.UserDAO;
import com.dzp.wm.pojo.Evaluate;
import com.dzp.wm.pojo.SearchHistory;
import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.ShopApply;
import com.dzp.wm.pojo.User;
import com.dzp.wm.pojo.UserAddress;

public class UserBizImpl implements UserBiz {
	private UserDAO userDAO;
	private ShopApplyDAO shopApplyDAO;
	private UserAddressDAO userAddressDAO;
	
	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Override
	public User login(String loginId, String pwd) {
		User user = userDAO.getUser(loginId, pwd);
		return user;
	}

	@Override
	public User getUser(int id) {
		User user = userDAO.getUser(id);
		return user;
	}

	@Override
	public Shop BrowsingShop(int id) {
		Shop shop = userDAO.getShop(id);
		return shop;
	}

	@Override
	public Set<Evaluate> Evaluate(int shopId) {
		Set<Evaluate> evaluateSet = userDAO.getEvaluate(shopId);
		return evaluateSet;
	}

	@Override
	public Set<Shop> getShops(String keyWord) {
		Set<Shop> shops = userDAO.getShops(keyWord);
		return shops;
	}

	@Override
	public void addUser(User user) {
		userDAO.add(user);
	}

	@Override
	public void clearCartItems(int id) {
		userDAO.clearCartItems(id);
	}

	@Override
	public void pay(int id) {
		userDAO.pay(id);
	}

	@Override
	public void addCollectShop(int uid, int sid) {
		User user = userDAO.getUser(uid);
		Shop shop = userDAO.getShop(sid);
		Set<Shop> collectShops = user.getCollectShops();
		collectShops.add(shop);
		userDAO.update(user);
	}

	@Override
	public void removeCollectShop(int uid, int sid) {
		User user = userDAO.getUser(uid);
		Shop shop = userDAO.getShop(sid);
		Set<Shop> collectShops = user.getCollectShops();
		System.out.println(collectShops.size()+"----");
		collectShops.remove(shop);
	}


	@Override
	public void update(User user) {
		userDAO.update(user);
	}

	@Override
	public Set<ShopApply> getShopApplyByUserId(int uid) {
		return shopApplyDAO.getShopApplyByUserId(uid);
	}

	public ShopApplyDAO getShopApplyDAO() {
		return shopApplyDAO;
	}

	public void setShopApplyDAO(ShopApplyDAO shopApplyDAO) {
		this.shopApplyDAO = shopApplyDAO;
	}

	@Override
	public void addShopApply(ShopApply shopApply) {
		shopApplyDAO.add(shopApply);
	}

	@Override
	public void clearCartItemsByUserId(int id) {
		userDAO.clearCartItems(id);
	}

	@Override
	public List<UserAddress> getAddressesByUid(int id) {
		return userAddressDAO.getAddressesByUid(id);
	}

	public UserAddressDAO getUserAddressDAO() {
		return userAddressDAO;
	}

	public void setUserAddressDAO(UserAddressDAO userAddressDAO) {
		this.userAddressDAO = userAddressDAO;
	}

	@Override
	public void addUserAddress(UserAddress userAddress) {
		userAddressDAO.add(userAddress);
		
	}

	@Override
	public Set<SearchHistory> getFiveSearchHistories(int id) {
		return userDAO.getFiveSearchHistories(id);
	}
}
