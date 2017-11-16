package com.dzp.wm.pojo;

public class CartItem implements Comparable<CartItem> {
	private int id;
	private int count;
	private User user;
	private Commodity commodity;
	
	public CartItem(){}
	
	public CartItem(User user, Commodity commodity){
		this.count=1;
		this.user=user;
		this.commodity=commodity;
	}
	
	public CartItem(int id){
		this.id = id;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public int compareTo(CartItem o) {
		if(this.id == o.id){
			return 0;
		}
		return 1;
	}
}
