package com.dzp.wm.actions;

import java.util.Set;

import com.dzp.wm.biz.AdminBiz;
import com.dzp.wm.biz.UserBiz;
import com.dzp.wm.pojo.Admin;
import com.dzp.wm.pojo.Category;
import com.dzp.wm.pojo.OrderBean;
import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.ShopApply;
import com.dzp.wm.pojo.ShopDetail;
import com.dzp.wm.pojo.User;
import com.dzp.wm.util.EmailUtil;
import com.opensymphony.xwork2.ActionContext;

public class AdminAction {

	private AdminBiz adminBiz;
	private UserBiz userBiz;
	private Admin admin;			
	private Category currCategory;		
	private String keyword;				
	private String content;				
	private int shopId=1;					
	private int pageNum=1;				
	private int pageSize=8;				
	private int categoryId=1;			
	private int shopApplyId=1;
	private int uid;

	public String adminInfo() {
		Admin currAdmin = (Admin) ActionContext.getContext().getSession().get("currAdmin");
		if (currAdmin == null) {
			return "login";
		}
		currAdmin = adminBiz.getAdmin(currAdmin);
		ActionContext.getContext().getSession().put("currAdmin", currAdmin);
		ActionContext.getContext().put("pageSize", pageSize);
		return "adminInfo";
	}

	public String updateAdmin(){
		Admin currAdmin = (Admin) ActionContext.getContext().getSession().get("currAdmin");
		if(admin.getId()!=currAdmin.getId()){
			return "login";
		}
		adminBiz.updateAdmin(admin);
		return this.adminInfo();
	}
	
	public String shopApply() {
		Admin currAdmin = (Admin) ActionContext.getContext().getSession().get("currAdmin");
		if(currAdmin==null)
			return "login";
		if(keyword==null)				
			keyword="";
		if(pageNum<1)					
			pageNum=1;
		int shopCount = adminBiz.getShopCount(keyword);
		int pageCount=shopCount%pageSize > 0 ? (shopCount+pageSize)/pageSize : shopCount/pageSize;
		if(pageNum>pageCount)			
			pageNum=pageCount;
		
		Set<ShopApply> shopApplies = adminBiz.getShopApply(pageNum, pageSize);
		ActionContext.getContext().getSession().put("shopApplies", shopApplies);
		ActionContext.getContext().put("pageNum", pageNum);
		ActionContext.getContext().put("pageCount", pageCount);
		
		return "shopApply";
	}

	
	public String offer(){
		Admin currAdmin = (Admin) ActionContext.getContext().getSession().get("currAdmin");
		if(currAdmin==null)
			return "login";
		ShopApply shopApply = adminBiz.getShopApply(shopApplyId);
		Shop shop = new Shop();
		shop.setDocPath(shopApply.getApplyPath());
		shop.setUser(shopApply.getUser()); 
		shop.setShopAddress("中国");
		shop.setStatus(1);
		
		shop.setId(shopApply.getUser().getId());
		shop.setId(shopId);
		int shopId = adminBiz.addShop(shop);
		System.out.println(shopId);
		ShopDetail detail = new ShopDetail();
		detail.setShop(shop);
		detail.setId(shopId);
		detail.setShopImg("/wm/img/jgb.png");
		shop.setShopName(shopApply.getShopName());
		detail.setShopRemark(shopApply.getShopRemark());
		shop.setShopDetail(detail);
		detail.setId(shop.getId());
		
		adminBiz.addShopDetail(detail);
		shopApply.setState(0);
		adminBiz.updateShopApply(shopApply);
		return shopApply();
	}
	
	public String notOffer(){
		Admin currAdmin = (Admin) ActionContext.getContext().getSession().get("currAdmin");
		if(currAdmin==null)
			return "login";
		System.out.println(shopApplyId);
		ShopApply shopApply = adminBiz.getShopApply(shopApplyId);
		User userTemp = shopApply.getUser();
		String emailAddress = userTemp.getEmail();
		EmailUtil eUtil = new EmailUtil(emailAddress, "超人外卖商家认证失败", content);
		eUtil.sendEmail();
		shopApply.setReason(content);
		shopApply.setState(0);
		adminBiz.updateShopApply(shopApply);
		return shopApply();
	}
	
	public String categoryManage() {
		Admin currAdmin = (Admin) ActionContext.getContext().getSession().get("currAdmin");
		if(currAdmin==null)
			return "login";
		if(keyword==null)				
			keyword="";
		if(pageNum<1)					
			pageNum=1;
		int shopCount = adminBiz.getShopCount(keyword);
		int pageCount=shopCount%pageSize > 0 ? (shopCount+pageSize)/pageSize : shopCount/pageSize;
		if(pageNum>pageCount)			
			pageNum=pageCount;
		
		Set<Category> categories = adminBiz.getCategorys(pageNum, pageSize);
		ActionContext.getContext().getSession().put("categories", categories);
		ActionContext.getContext().put("pageNum", pageNum);
		ActionContext.getContext().put("pageCount", pageCount);
		return "categoryManage";
	}
	
	public String toCategoryEdit(){
		Admin currAdmin = (Admin) ActionContext.getContext().getSession().get("currAdmin");
		if(currAdmin==null)
			return "login";
		Category category = adminBiz.getCategory(categoryId);
		ActionContext.getContext().put("currCategory", category);
		return "editCategory";
	}
	
	
	public String addCategory(){
		Admin currAdmin = (Admin) ActionContext.getContext().getSession().get("currAdmin");
		if(currAdmin==null)
			return "login";
		adminBiz.addCategory(currCategory);
		return categoryManage();
	}
	
	
	public String updateCategory(){
		Admin currAdmin = (Admin) ActionContext.getContext().getSession().get("currAdmin");
		if(currAdmin==null)
			return "login";
		adminBiz.updateCategory(currCategory);
		return categoryManage();
	}
	
	
	public String deleteCategory(){
		Admin currAdmin = (Admin) ActionContext.getContext().getSession().get("currAdmin");
		if(currAdmin==null)
			return "login";
		adminBiz.deleteCategory(categoryId);
		return categoryManage();
	}
	
	


	public String showShops() {
		Admin currAdmin = (Admin) ActionContext.getContext().getSession().get("currAdmin");
		if(currAdmin==null)
			return "login";
		keyword="";
		
		if(pageNum<1)			
			pageNum=1;
		int shopCount = adminBiz.getShopCount(keyword);
		int pageCount=shopCount%pageSize > 0 ? (shopCount+pageSize)/pageSize : shopCount/pageSize;
		if(pageNum>pageCount)			
			pageNum=pageCount;
		
		System.out.println(shopCount);
		Set<Shop> shops = adminBiz.getShops(pageNum, pageSize, "", "");
		System.out.println(shops.size());
		System.out.println(shops==null);
		ActionContext.getContext().put("pageNum", pageNum);
		ActionContext.getContext().put("pageCount", pageCount);
		ActionContext.getContext().put("displayShops", shops);
		System.out.println("showShops-----------------------------");
		return "showShops";
	}
	
	
	public String stopBusiness(){
		Admin currAdmin = (Admin) ActionContext.getContext().getSession().get("currAdmin");
		if(currAdmin==null)
			return "login";
		System.out.println(shopId);
		System.out.println(content);
		Shop tempShop = adminBiz.getShop(shopId);
		EmailUtil eUtil = new EmailUtil(tempShop.getUser().getEmail(), "瓒呬汉澶栧崠", content);
		eUtil.sendEmail();
		adminBiz.stopBusiness(shopId);
		return showShops();
	}
	
	
	public String recoverBusiness(){
		Admin currAdmin = (Admin) ActionContext.getContext().getSession().get("currAdmin");
		if(currAdmin==null)
			return "login";
		adminBiz.recoverBusiness(shopId);
		return showShops();
	}
	
	public String adminExit(){
		ActionContext.getContext().getSession().remove("currAdmin");
		ActionContext.getContext().getSession().remove("shopApplies");
		ActionContext.getContext().getSession().remove("categories");
		
		return "login";
	}
	
	public String userManage(){
		Admin currAdmin = (Admin) ActionContext.getContext().getSession().get("currAdmin");
		if(currAdmin==null)
			return "login";
		if(keyword==null)				
			keyword="";
		if(pageNum<1)
			pageNum=1;
		int userCount = adminBiz.getUserCount(keyword);
		int pageCount=userCount%pageSize > 0 ? (userCount+pageSize)/pageSize : userCount/pageSize;
		if(pageNum>pageCount)			
			pageNum=pageCount;
		
		Set<User> users = adminBiz.getUsers(keyword, pageNum, pageSize);
		ActionContext.getContext().getSession().put("users", users);
		ActionContext.getContext().put("pageNum", pageNum);
		ActionContext.getContext().put("pageCount", pageCount);
		return "showUsers";
	}
	
	public String recoverUser(){
		Admin currAdmin = (Admin) ActionContext.getContext().getSession().get("currAdmin");
		if(currAdmin==null)
			return "login";
		User userTemp = userBiz.getUser(uid);
		userTemp.setState(1);
		userBiz.update(userTemp);
		return userManage();
	}
	
	public String stopUser(){
		Admin currAdmin = (Admin) ActionContext.getContext().getSession().get("currAdmin");
		if(currAdmin==null)
			return "login";
		System.out.println(userBiz==null);
		User userTemp = userBiz.getUser(uid);
		userTemp.setState(0);
		userBiz.update(userTemp);
		return userManage();
	}
	
	public String shopApplyHistory(){
		Set<ShopApply> shopApplyHistory = userBiz.getShopApplyByUserId(uid);
		User disPlayUser = userBiz.getUser(uid);
		ActionContext.getContext().getSession().put("shopApplyHistory",shopApplyHistory);
		ActionContext.getContext().getSession().put("disPlayUser",disPlayUser);
		return "shopApplyHistory";
	}
	
	public String showUserHistory(){
		Set<OrderBean> historyOrder = userBiz.getUser(uid).getOrderBeans();
		User disPlayUser = userBiz.getUser(uid);
		ActionContext.getContext().getSession().put("disPlayUser",disPlayUser);
		ActionContext.getContext().getSession().put("historyOrder",historyOrder);
		return "showUserHistory";
	}
	
	public void setAdminBiz(AdminBiz adminBiz) {
		this.adminBiz = adminBiz;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public AdminBiz getAdminBiz() {
		return adminBiz;
	}

	public Category getCurrCategory() {
		return currCategory;
	}

	public void setCurrCategory(Category currCategory) {
		this.currCategory = currCategory;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getShopId() {
		return shopId;
	}

	public void setShopId(int shopId) {
		this.shopId = shopId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public int getShopApplyId() {
		return shopApplyId;
	}

	public void setShopApplyId(int shopApplyId) {
		this.shopApplyId = shopApplyId;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public UserBiz getUserBiz() {
		return userBiz;
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}
	
}
