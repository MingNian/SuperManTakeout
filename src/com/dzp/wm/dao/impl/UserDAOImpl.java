package com.dzp.wm.dao.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import com.dzp.wm.dao.UserDAO;
import com.dzp.wm.dao.base.impl.BaseDAO;
import com.dzp.wm.pojo.CartItem;
import com.dzp.wm.pojo.Evaluate;
import com.dzp.wm.pojo.SearchHistory;
import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.User;
import com.dzp.wm.pojo.UserAddress;

public class UserDAOImpl extends BaseDAO<User> implements UserDAO {

	@Override
	public User getUser(String loginId, String pwd) {
		String hql = "from User u where u.loginId=? and u.pwd=? or u.email=? and u.pwd=?";
		List<User> userList = (List<User>) getHibernateTemplate().find(hql, loginId,pwd,loginId, pwd);
		return (userList != null && userList.size() > 0) ? userList.get(0) : null;
	}

	@Override
	public User addUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public User getUser(int id) {
		User user = getHibernateTemplate().load(User.class, id);
		return user != null ? user : null;
	}

	@Override
	public Shop getShop(int id) {
		Shop shop = getHibernateTemplate().load(Shop.class, id);
		return shop;
	}

	@Override
	public Set<Evaluate> getEvaluate(int shopId) {
		String hql = "from Evaluate e where e.orderBean.shop.id = ?";
		Set<Evaluate> evaluateSet = new HashSet<Evaluate>((List<Evaluate>) getHibernateTemplate().find(hql, shopId));
		return evaluateSet;
	}

	@Override
	public Set<Shop> getShops(String keyWord) {
		String hql = "from Shop s where s.shopAddress like ?";
		Set<Shop> shops = new HashSet<Shop>((List<Shop>) getHibernateTemplate().find(hql, "%"+keyWord+"%"));
		System.out.println(shops.isEmpty());
		return shops;
	}

	@Override
	public void clearCartItems(int id) {
		String hql = "delete from CartItem c where c.user.id = ?";
		getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql).setParameter(0, id).executeUpdate(); 
		
	}

	@Override
	public void pay(int id) {
		
	}

	@Override
	public Set<User> getUsers(String keyword, int pageNum, int pageSize) {
		String hql = "   from User  where nickName like ? or loginId like ?  ";
		return new TreeSet<User>(getHibernateTemplate().getSessionFactory().getCurrentSession()
				.createQuery(hql, User.class).setParameter(0, "%" + keyword + "%").setParameter(1, "%" + keyword + "%")
				.setFirstResult(pageNum * pageSize - pageSize).setMaxResults(pageSize).list());
	}

	@Override
	public int getUserCount(String keyword) {
		String hql = " select count(*) from User where nickName like ? or loginId like ? ";
		return ((Long) getHibernateTemplate().find(hql, "%" + keyword + "%","%" + keyword + "%").get(0)).intValue();
	}

	@Override
	public List<UserAddress> getAddressesByUid(int uid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Set<SearchHistory> getFiveSearchHistories(int id) {
		String hql = " from SearchHistory s where s.user.id = ? order by s.id desc";
		return new TreeSet<SearchHistory>((List<SearchHistory>) getHibernateTemplate().getSessionFactory().getCurrentSession()
				.createQuery(hql).setParameter(0, id).setFirstResult(0).setMaxResults(5).list());
	} 
}