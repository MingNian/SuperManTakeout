package com.dzp.wm.biz;

import com.dzp.wm.pojo.CartItem;

public interface CartItemBiz {
	void addCartItem(CartItem cartitem);
	
	CartItem getCartItem(int uid,int cid);
	
	void updateCartItem(CartItem cartitem);
	
	void delCartItem(CartItem cartItem);
}
