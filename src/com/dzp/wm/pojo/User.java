package com.dzp.wm.pojo;

import java.util.Set;
//��Ӧt_user��
public class User implements Comparable<User> {
	private int id;
	private String loginId;
	private String pwd;
	private String nickName;
	private String realName;
	private String gender;
	private String tel;
	private String email;
	private String currAddress;
	private int state;
	private String headImg;
	private Set<SearchHistory> searchHistories;
	private Shop shop;
	private Set<Shop> collectShops;
	
	private Set<Evaluate> evaluates;
	private Set<UserAddress> userAddresses;
	private Set<OrderBean> orderBeans;
	private Set<CartItem> cartItems;
	
	public User(){}

	public User(int id) {
		super();
		this.id = id;
	}

	public User(int id, String loginId, String pwd, String nickName, String realName, String gender, String tel) {
		super();
		this.id = id;
		this.loginId = loginId;
		this.pwd = pwd;
		this.nickName = nickName;
		this.realName = realName;
		this.gender = gender;
		this.tel = tel;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	

	public Set<OrderBean> getOrderBeans() {
		return orderBeans;
	}

	public void setOrderBeans(Set<OrderBean> orderBeans) {
		this.orderBeans = orderBeans;
	}

	public Set<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(Set<CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	public Set<Evaluate> getEvaluates() {
		return evaluates;
	}

	public void setEvaluates(Set<Evaluate> evaluates) {
		this.evaluates = evaluates;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public Set<UserAddress> getUserAddresses() {
		return userAddresses;
	}

	public void setUserAddresses(Set<UserAddress> userAddresses) {
		this.userAddresses = userAddresses;
	}

	public Set<Shop> getCollectShops() {
		return collectShops;
	}

	public void setCollectShops(Set<Shop> collectShops) {
		this.collectShops = collectShops;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", loginId=" + loginId + ", pwd=" + pwd + ", nickName=" + nickName + ", realName="
				+ realName + ", gender=" + gender + ", tel=" + tel + "]";
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public int compareTo(User o) {
		if(this.getId() == o.getId())
			return 0;
		return this.id > o.id ? 1 : -1;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}

	public String getCurrAddress() {
		return currAddress;
	}

	public void setCurrAddress(String currAddress) {
		this.currAddress = currAddress;
	}

	public Set<SearchHistory> getSearchHistories() {
		return searchHistories;
	}

	public void setSearchHistories(Set<SearchHistory> searchHistories) {
		this.searchHistories = searchHistories;
	}

}
