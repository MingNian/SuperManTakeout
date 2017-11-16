package com.dzp.wm.biz.impl;

import com.dzp.wm.biz.CartItemBiz;
import com.dzp.wm.dao.CartItemDAO;
import com.dzp.wm.pojo.CartItem;

public class CartItemBizImpl implements CartItemBiz {
	private CartItemDAO cartItemDAO;

	public CartItemDAO getCartItemDAO() {
		return cartItemDAO;
	}

	public void setCartItemDAO(CartItemDAO cartItemDAO) {
		this.cartItemDAO = cartItemDAO;
	}

	@Override
	public void addCartItem(CartItem cartItem) {
		cartItemDAO.add(cartItem);
	}

	@Override
	public CartItem getCartItem(int uid,int cid) {
		return cartItemDAO.getCartItem(uid,cid);
	}

	@Override
	public void updateCartItem(CartItem cartitem) {
		cartItemDAO.update(cartitem);
	}

	@Override
	public void delCartItem(CartItem cartItem) {
		cartItemDAO.delCartItem(cartItem);
	}

}
