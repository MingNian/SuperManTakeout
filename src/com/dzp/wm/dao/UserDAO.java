package com.dzp.wm.dao;

import java.util.List;
import java.util.Set;

import com.dzp.wm.dao.base.IBaseDAO;
import com.dzp.wm.pojo.Evaluate;
import com.dzp.wm.pojo.SearchHistory;
import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.User;
import com.dzp.wm.pojo.UserAddress;

public interface UserDAO extends IBaseDAO<User>  {
	
	//��¼
	public User getUser(String loginId,String pwd);
	
	//ע��
	public User addUser(User user);
	
	//�޸ĸ�������
	public boolean updateUser(User user);
	
	public User getUser(int id);
	
	public Shop getShop(int id);
	
	public Set<Evaluate> getEvaluate(int shopId);

	public Set<Shop> getShops(String keyWord);
	
	public void clearCartItems(int id);

	public void pay(int id);

	public int getUserCount(String keyword);

	public Set<User> getUsers(String keyword, int pageNum, int pageSize);

	public List<UserAddress> getAddressesByUid(int uid);

	public Set<SearchHistory> getFiveSearchHistories(int id);
}
