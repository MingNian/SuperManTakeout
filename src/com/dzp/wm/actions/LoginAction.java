package com.dzp.wm.actions;

import java.util.List;
import java.util.Set;

import org.hibernate.Hibernate;

import com.dzp.wm.biz.AdminBiz;
import com.dzp.wm.biz.UserBiz;
import com.dzp.wm.pojo.Admin;
import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.User;
import com.dzp.wm.pojo.UserAddress;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	private String password;
	private String loginId;
	private String keyWord = "";
	private Set<Shop> shops;
	private int num;
	private UserBiz userBiz ;
	private AdminBiz adminBiz;
	private String email;

	public String login(){
		if(num==1)
			return userLogin();
		else
			return adminLogin();
	}
	
	public String userLogin(){
		User user = userBiz.login(loginId,password);
		if(user!=null){
			shops = userBiz.getShops(keyWord);
			Set<Shop> collectshops = user.getCollectShops();
			System.out.println(collectshops.size());
			Hibernate.initialize(user.getShop());
			Hibernate.initialize(user.getCollectShops());
			Hibernate.initialize(user.getCartItems());
			Hibernate.initialize(user.getSearchHistories());
			List<UserAddress> currUserAddresses = userBiz.getAddressesByUid(user.getId());
			ActionContext.getContext().getSession().put("orderBeans", user.getOrderBeans());
			ActionContext.getContext().getSession().put("addresses", currUserAddresses);
			ActionContext.getContext().getSession().put("user", user);
			ActionContext.getContext().getSession().put("shops", shops);
			ActionContext.getContext().getSession().put("cartItems", user.getCartItems());
			ActionContext.getContext().getSession().put("collectShops", collectshops);
			ActionContext.getContext().getSession().put("searchHistories", userBiz.getFiveSearchHistories(user.getId()));
			return "userSuccess";
		}
		return "userError";
	}
	
	public String adminLogin(){
		Admin currAdmin = adminBiz.login(loginId,password);
		if(currAdmin==null)
			return "adminLoginFail";
		else{
			Hibernate.initialize(currAdmin);
			ActionContext.getContext().getSession().put("currAdmin", currAdmin);
			return "adminLoginSuccess";
		}
	}

	public String regist(){
		User user = new User();
		user.setNickName(loginId);
		user.setEmail(email);
		user.setPwd(password);
		user.setNickName(loginId);
		user.setLoginId(loginId);
		userBiz.addUser(user);
		return "registSuccess";
	}
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	
	public Set<Shop> getShops() {
		return shops;
	}

	public void setShops(Set<Shop> shops) {
		this.shops = shops;
	}

	public UserBiz getUserBiz() {
		return userBiz;
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public AdminBiz getAdminBiz() {
		return adminBiz;
	}

	public void setAdminBiz(AdminBiz adminBiz) {
		this.adminBiz = adminBiz;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
