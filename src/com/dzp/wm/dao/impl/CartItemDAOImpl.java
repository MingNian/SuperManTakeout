package com.dzp.wm.dao.impl;

import java.util.List;

import com.dzp.wm.dao.CartItemDAO;
import com.dzp.wm.dao.base.impl.BaseDAO;
import com.dzp.wm.pojo.CartItem;

public class CartItemDAOImpl extends BaseDAO<CartItem> implements CartItemDAO {
	
	@Override
	public void updateCartItem(CartItem cartItem) {
		getHibernateTemplate().save(cartItem);
	}

	@Override
	public CartItem addCartItem(CartItem cartItem) {
		getHibernateTemplate().save(cartItem);
		return getHibernateTemplate().load(CartItem.class, cartItem.getId());
	}

	@Override
	public CartItem getCartItem(int	uid,int cid) {
		String hql="from CartItem c where c.user.id = ? and c.commodity.id = ?";
		List<CartItem> cartItems =(List<CartItem>) getHibernateTemplate().find(hql,uid,cid);
		if(cartItems != null && cartItems.size()>0)	return cartItems.get(0);
		else 	return null;
	}

	@Override
	public void delCartItem(CartItem cartItem) {
		getHibernateTemplate().delete(cartItem);
	}

}
