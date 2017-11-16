package com.dzp.wm.pojo;

public class UserAddress {
	private int id;
	private String username;
	private String address;
	private boolean defaultAddrFlag;
	private String tel;
	private String gender;
	private User user;
	
	public UserAddress(){}
	
	public UserAddress(User user) {
		super();
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}


	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public boolean isDefaultAddrFlag() {
		return defaultAddrFlag;
	}

	public void setDefaultAddrFlag(boolean defaultAddrFlag) {
		this.defaultAddrFlag = defaultAddrFlag;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
}
