package com.dzp.wm.dao;

import com.dzp.wm.dao.base.IBaseDAO;
import com.dzp.wm.pojo.CartItem;

public interface CartItemDAO extends IBaseDAO<CartItem>  {

	void updateCartItem(CartItem cartItem);
	CartItem addCartItem(CartItem cartItem);
	CartItem getCartItem(int uid,int cid);
	void delCartItem(CartItem cartItem);

}
