package com.dzp.wm.biz;

import java.util.List;
import java.util.Set;

import com.dzp.wm.pojo.Evaluate;
import com.dzp.wm.pojo.SearchHistory;
import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.ShopApply;
import com.dzp.wm.pojo.User;
import com.dzp.wm.pojo.UserAddress;

public interface UserBiz {
		
		public User login(String loginId  , String pwd );

		public User getUser(int id);
		
		public Shop BrowsingShop(int id);
		
		public Set<Evaluate> Evaluate(int shopId);
		
		public Set<Shop> getShops(String keyWord);
		
		public void addUser(User user);
		
		public void clearCartItems(int id);
		
		public void pay(int id);
		
		public void addCollectShop(int uid,int sid);
		
		public void removeCollectShop(int uid,int sid);
		
		public void update(User user);
		
		public Set<ShopApply> getShopApplyByUserId(int uid);
		
		public void addUserAddress(UserAddress userAddress);
		
		public void addShopApply(ShopApply shopApply);
		
		public void clearCartItemsByUserId(int id);

		public List<UserAddress> getAddressesByUid(int id);

		public Set<SearchHistory> getFiveSearchHistories(int id);
}