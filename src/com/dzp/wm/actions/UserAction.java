package com.dzp.wm.actions;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Hibernate;

import com.dzp.wm.biz.AdminBiz;
import com.dzp.wm.biz.CartItemBiz;
import com.dzp.wm.biz.CommodityBiz;
import com.dzp.wm.biz.EvaluateBiz;
import com.dzp.wm.biz.OrderBeanBiz;
import com.dzp.wm.biz.OrderItemBiz;
import com.dzp.wm.biz.UserBiz;
import com.dzp.wm.pojo.CartItem;
import com.dzp.wm.pojo.Commodity;
import com.dzp.wm.pojo.Evaluate;
import com.dzp.wm.pojo.OrderBean;
import com.dzp.wm.pojo.OrderItem;
import com.dzp.wm.pojo.SearchHistory;
import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.ShopApply;
import com.dzp.wm.pojo.User;
import com.dzp.wm.pojo.UserAddress;
import com.opensymphony.xwork2.ActionContext;

public class UserAction {

	private UserBiz userBiz;
	private CartItemBiz cartItemBiz;
	private EvaluateBiz evaluateBiz;
	private Shop shop;
	private User user;
	private int id;
	private CartItem cartItem;
	private Commodity commodity;
	private CommodityBiz commodityBiz;
	private OrderItemBiz orderItemBiz;
	private OrderBeanBiz orderBeanBiz;
	private OrderBean orderBean;
	private OrderItem orderItem;
	private ShopApply shopApply;
	private File file;
	private File headImg;
	private String headImgContentType;
	private String headImgFileName;
	private Evaluate evaluate;
	private UserAddress userAddress;
	private int def;
	private String liuyan;
	private String userName;
	private String address;
	private int gender;
	private AdminBiz adminBiz;
	private String position;
	private String shopKeyword;
	private int pageNum=1;				
	private int pageSize=8;		

	public String toggleAddress(){
		ActionContext.getContext().getSession().put("position",position);
		return "index";
	}
	public String toggleShopKeyword(){
		ActionContext.getContext().getSession().put("shopKeyword",shopKeyword);
		User currUser = (User) ActionContext.getContext().getSession().get("user");
		if(currUser!=null){
			if(shopKeyword!=null && !"".equals(shopKeyword)){
				SearchHistory searchHistory = new SearchHistory(currUser);
				searchHistory.setKeyWord(shopKeyword);
				searchHistory.setUser(currUser);
				currUser.getSearchHistories().add(searchHistory);
				userBiz.update(currUser);
				Set<SearchHistory> searchHistories = userBiz.getFiveSearchHistories(currUser.getId());
				ActionContext.getContext().getSession().put("searchHistories", searchHistories);
			}
		}
		return "index";
	}
	
	public String showShops(){
		position=(String) ActionContext.getContext().getSession().get("position");
		if(position == null)
			position = "";
		if(shopKeyword == null)
			shopKeyword = "";
		if(pageNum<1)					
			pageNum=1;
		
		int shopCount = adminBiz.getShopCount(shopKeyword);
		int pageCount=shopCount%pageSize > 0 ? (shopCount+pageSize)/pageSize : shopCount/pageSize;
		if(pageNum>pageCount)		pageNum=pageCount;		
			
		Set<Shop> shops = adminBiz.getShops(pageNum, pageSize, position,shopKeyword);
		ActionContext.getContext().put("pageNum", pageNum);
		ActionContext.getContext().put("pageCount", pageCount);
		ActionContext.getContext().put("displayShops", shops);
		ActionContext.getContext().getSession().put("shopKeyword", shopKeyword);
		
		return "showShops";
	}
	
	
	public String updateUser(){
		User currUser=(User) ActionContext.getContext().getSession().get("user");
		currUser = userBiz.getUser(currUser.getId());
		String uploadPath=user.getHeadImg();
		String picPath = null;
		try {	
			if(headImg!=null){
				InputStream is=new FileInputStream(headImg);
				uploadPath=ServletActionContext.getServletContext().getRealPath("/upload");
				picPath=UUID.randomUUID().toString()+"."+headImgFileName.split("\\.")[1];
				File toFile=new File(uploadPath,picPath);
				OutputStream os=new FileOutputStream(toFile);
				currUser.setHeadImg("/wm/upload/"+picPath);
				byte[] buffer=new byte[1024];
				int length=0;
				
				
				while((length=is.read(buffer))>0){
					os.write(buffer, 0, length);
				}
				is.close();
				os.close();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		currUser.setNickName(user.getNickName());
		currUser.setTel(user.getTel());
		userBiz.update(currUser);
		Hibernate.initialize(currUser);
		currUser.getHeadImg();
		ActionContext.getContext().getSession().put("user",currUser);
		
		return "myInfo";
	}
	
	public String addCart(){
		User currUser = (User)ActionContext.getContext().getSession().get("user");
		Commodity currCommodity = commodityBiz.getCommodity(commodity.getId());
		CartItem currCartItem = cartItemBiz.getCartItem(currUser.getId(),currCommodity.getId());
		if(currCartItem == null){								
			cartItemBiz.addCartItem(new CartItem(currUser,currCommodity));
		}else{												
			currCartItem.setCount(currCartItem.getCount()+1);
			cartItemBiz.updateCartItem(currCartItem);
		}
		ActionContext.getContext().getSession().put("currCartItems",currUser.getCartItems());
		return browsingShop();
	}
	
	public String browsingShop(){
		Shop shop = userBiz.BrowsingShop(id);
		
		if(shop!=null){
			Hibernate.initialize(shop.getShopDetail());
			User currUser = (User)ActionContext.getContext().getSession().get("user");
			currUser = userBiz.getUser(currUser.getId());
			System.out.println(currUser.getCartItems().size());
			ActionContext.getContext().getSession().put("currCartItems", currUser.getCartItems());
			ActionContext.getContext().getSession().put("categories",shop.getCategorys());
			ActionContext.getContext().getSession().put("shop", shop);
			return "shopDetail";
		}
		return "browsingShopFail";
	}
	
	public String cutOne(){
		User currUser = (User)ActionContext.getContext().getSession().get("user");
		Commodity currCommodity = commodityBiz.getCommodity(commodity.getId());
		CartItem currCartItem = cartItemBiz.getCartItem(currUser.getId(),currCommodity.getId());
		if(currCartItem.getCount()==1){
			currUser.getCartItems().remove(currCartItem);
		}else{
			currCartItem.setCount(currCartItem.getCount()-1);
			cartItemBiz.updateCartItem(currCartItem);
		}
		return browsingShop();
	}
	
	public String addOne(){
		User currUser = (User)ActionContext.getContext().getSession().get("user");
		Commodity currCommodity = commodityBiz.getCommodity(commodity.getId());
		CartItem currCartItem = cartItemBiz.getCartItem(currUser.getId(),currCommodity.getId());
		currCartItem.setCount(currCartItem.getCount()+1);
		cartItemBiz.updateCartItem(currCartItem);
		return browsingShop();
	}
	
	public String clearCartItems(){
		User currUser = (User)ActionContext.getContext().getSession().get("user");
		userBiz.clearCartItemsByUserId(currUser.getId());
		return browsingShop();
	}
	
	public String addNewAddress(){
		User currUser = (User)ActionContext.getContext().getSession().get("user");
		UserAddress currAddress = new UserAddress(currUser); 
		currAddress.setAddress(address);
		
		if(gender == 0)			currAddress.setGender("Å®");
		else					currAddress.setGender("ÄÐ");
		currAddress.setTel(liuyan);
		
		currAddress.setUsername(userName);
		currAddress.setUser(currUser);
		userBiz.addUserAddress(currAddress);
		userBiz.update(currUser);
		ActionContext.getContext().getSession().put("user", currUser);
		ActionContext.getContext().getSession().put("addresses", currUser.getUserAddresses());
		return addresses();
	}
	
	public String pay() {
		User currUser = (User) ActionContext.getContext().getSession().get("user");
		Shop currShop = (Shop) ActionContext.getContext().getSession().get("shop");
		currShop = userBiz.BrowsingShop(id);
		currUser = userBiz.getUser(currUser.getId());
		List<UserAddress> currUserAddresses = userBiz.getAddressesByUid(currUser.getId());
		ActionContext.getContext().getSession().put("addresses", currUserAddresses);
		OrderBean orderBean = new OrderBean(currUser.getId());
		orderBean.setUser(currUser);
		Set<OrderItem> orderItems = new HashSet<OrderItem>();
		float orderMoney = 0;
		for (CartItem ci : currUser.getCartItems()) {
			OrderItem orderItem = new OrderItem(orderBean.getId());
			orderItem.setCommodity(ci.getCommodity());
			orderItem.setCount(ci.getCount());
			orderItem.setOrderBean(orderBean);
			orderItems.add(orderItem);
			orderMoney = orderMoney + ci.getCommodity().getPrice() * ci.getCount();
		}
		
		userBiz.clearCartItemsByUserId(currUser.getId());
		
		orderBean.setOrderBeanTime(new Date());
		orderBean.setOrderBeanMoney(orderMoney + currShop.getShopDetail().getServiceMoney());
		orderBean.setOrderBeanRemark(liuyan);
		orderBean.setShop(currShop);
		orderBean.setOrderItems(orderItems);
		orderBean.setUser(currUser);
		
		UserAddress ua = new UserAddress();
		ua.setId(def);
		orderBean.setOrderBeanAddr(ua);
		orderBean.setOrderBeanTel(ua.getTel());
		
		
		orderBeanBiz.addOrderBean(orderBean);
		
		ActionContext.getContext().getSession().put("orderBean", orderBean);
		ActionContext.getContext().getSession().put("addresses", currUser.getUserAddresses());
		return "pay";
	}
	
	public String addresses(){
		User currUser = (User) ActionContext.getContext().getSession().get("user");
		currUser = userBiz.getUser(currUser.getId());
		Hibernate.initialize(currUser.getUserAddresses());
		ActionContext.getContext().getSession().put("addresses", currUser.getUserAddresses());
		return "addresses";
	}
	
	public String orderBeanDetail(){
		OrderBean currOrder = orderBeanBiz.getOrderBean(id);
		Hibernate.initialize(currOrder);
		Hibernate.initialize(currOrder.getOrderItems());
		ActionContext.getContext().getSession().put("currOrderBean", currOrder);
		return "orderBeanDetail";
	}
	
	public String addNewEvaluate(){
		OrderBean currOrderBean = orderBeanBiz.getOrderBean(id);
		User currUser = (User) ActionContext.getContext().getSession().get("user");
		Shop currShop = (Shop) ActionContext.getContext().getSession().get("shop");
		evaluate.setUser(currUser);
		evaluate.setShop(currShop);
		evaluate.setOrderBean(currOrderBean);
		evaluate.setEvaluateDate(new Date());
		currOrderBean.setEvaluate(evaluate);
		orderBeanBiz.insertEvaluate(evaluate);
		orderBeanBiz.updateOrderBean(currOrderBean);
		ActionContext.getContext().getSession().put("currOrderBean", currOrderBean);
		return "addNewEvaluate";
	}
	
	public String evaluates(){
		Shop currShop = (Shop) ActionContext.getContext().getSession().get("shop");
		Set<Evaluate> evaluates = evaluateBiz.getEvaluates(currShop.getId());
		ActionContext.getContext().getSession().put("evaluates", evaluates);
		return "evaluates";
	}
	
	public String getUserOrderBeans(){
		User currUser =(User)ActionContext.getContext().getSession().get("user");
		currUser = userBiz.getUser(currUser.getId());
		Hibernate.initialize(currUser.getOrderBeans());
		ActionContext.getContext().getSession().put("orderBeans0", currUser.getOrderBeans());
		return "get";
	}
	
	public String collectionShop(){
		userBiz.addCollectShop(user.getId(),shop.getId());
		User currUser = userBiz.getUser(user.getId());
		Set<Shop> collection = currUser.getCollectShops();
		Hibernate.initialize(collection);
		ActionContext.getContext().getSession().put("collectShops", collection);
		id=shop.getId();
		return browsingShop();
	}
	
	public String removeCollection(){
		userBiz.removeCollectShop(user.getId(),shop.getId());
		User user5 = userBiz.getUser(user.getId());
		Set<Shop> collection = user5.getCollectShops();
		ActionContext.getContext().getSession().put("collectShops", collection);
		return browsingShop();
	}
	public String fillShopApply(){
		String fileName ="/file/"+UUID.randomUUID().toString()+".doc";
		String target=ServletActionContext.getServletContext().getRealPath(fileName);
		File targetFile = new File(target);
		try{
			FileUtils.copyFile(file, targetFile);
			shopApply.setApplyPath(fileName);
			shopApply.setState(1);
			User uuuser = (User)ActionContext.getContext().getSession().get("user");
			if(uuuser == null)
				return "login";
			shopApply.setUser(uuuser);
			userBiz.addShopApply(shopApply);
		}catch (IOException e) {
			e.printStackTrace();
		}
		return "fillShopApply";
	}
	
	public String getAllCollections(){
		User utemp = (User)ActionContext.getContext().getSession().get("user");
		utemp = userBiz.getUser(utemp.getId());
		ActionContext.getContext().getSession().put("collectShops",utemp.getCollectShops());
		return "myCollection";
	}
	
	
	public UserBiz getUserBiz() {
		return userBiz;
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public CartItemBiz getCartItemBiz() {
		return cartItemBiz;
	}
	
	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public void setCartItemBiz(CartItemBiz cartItemBiz) {
		this.cartItemBiz = cartItemBiz;
	}

	public CartItem getCartItem() {
		return cartItem;
	}

	public void setCartItem(CartItem cartItem) {
		this.cartItem = cartItem;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	public CommodityBiz getCommodityBiz() {
		return commodityBiz;
	}

	public void setCommodityBiz(CommodityBiz commodityBiz) {
		this.commodityBiz = commodityBiz;
	}

	public ShopApply getShopApply() {
		return shopApply;
	}

	public void setShopApply(ShopApply shopApply) {
		this.shopApply = shopApply;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public File getHeadImg() {
		return headImg;
	}

	public void setHeadImg(File headImg) {
		this.headImg = headImg;
	}

	public String getHeadImgContentType() {
		return headImgContentType;
	}

	public void setHeadImgContentType(String headImgContentType) {
		this.headImgContentType = headImgContentType;
	}

	public String getHeadImgFileName() {
		return headImgFileName;
	}

	public void setHeadImgFileName(String headImgFileName) {
		this.headImgFileName = headImgFileName;
	}

	public OrderBean getOrderBean() {
		return orderBean;
	}

	public void setOrderBean(OrderBean orderBean) {
		this.orderBean = orderBean;
	}

	public OrderItem getOrderItem() {
		return orderItem;
	}

	public void setOrderItem(OrderItem orderItem) {
		this.orderItem = orderItem;
	}

	public OrderBeanBiz getOrderBeanBiz() {
		return orderBeanBiz;
	}

	public void setOrderBeanBiz(OrderBeanBiz orderBeanBiz) {
		this.orderBeanBiz = orderBeanBiz;
	}

	public OrderItemBiz getOrderItemBiz() {
		return orderItemBiz;
	}

	public void setOrderItemBiz(OrderItemBiz orderItemBiz) {
		this.orderItemBiz = orderItemBiz;
	}

	public int getDef() {
		return def;
	}

	public void setDef(int def) {
		this.def = def;
	}

	public String getLiuyan() {
		return liuyan;
	}

	public void setLiuyan(String liuyan) {
		this.liuyan = liuyan;
	}


	public AdminBiz getAdminBiz() {
		return adminBiz;
	}

	public void setAdminBiz(AdminBiz adminBiz) {
		this.adminBiz = adminBiz;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getShopKeyword() {
		return shopKeyword;
	}

	public void setShopKeyword(String shopKeyword) {
		this.shopKeyword = shopKeyword;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}



	public Evaluate getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(Evaluate evaluate) {
		this.evaluate = evaluate;
	}

	public EvaluateBiz getEvaluateBiz() {
		return evaluateBiz;
	}

	public void setEvaluateBiz(EvaluateBiz evaluateBiz) {
		this.evaluateBiz = evaluateBiz;
	}
	public UserAddress getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(UserAddress userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
}
