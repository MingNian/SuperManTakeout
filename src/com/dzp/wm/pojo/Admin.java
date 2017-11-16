package com.dzp.wm.pojo;

import java.util.Set;

//t_admin
public class Admin implements Comparable<Admin>{
	private int id;
	private String loginId;
	private String pwd;
	private String adminName;
	private String gender;
	private String email;
	
	private Set<Shop> shops;
	
	public Admin(){}

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

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public Set<Shop> getShops() {
		return shops;
	}

	public void setShops(Set<Shop> shops) {
		this.shops = shops;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public int compareTo(Admin o) {

		return this.id > o.id ? 1 : -1;
	}
}
