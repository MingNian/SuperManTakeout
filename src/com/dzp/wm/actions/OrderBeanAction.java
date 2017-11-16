package com.dzp.wm.actions;

import java.util.Date;
import java.util.List;

import com.dzp.wm.biz.OrderBeanBiz;
import com.dzp.wm.biz.ReplyBiz;
import com.dzp.wm.biz.ShopBiz;
import com.dzp.wm.pojo.Evaluate;
import com.dzp.wm.pojo.OrderBean;
import com.dzp.wm.pojo.OrderItem;
import com.dzp.wm.pojo.Reply;
import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.User;
import com.dzp.wm.util.EmailUtil;
import com.opensymphony.xwork2.ActionContext;

public class OrderBeanAction {

	private OrderBeanBiz orderBeanBiz;
	private ShopBiz shopBiz;
	private ReplyBiz replyBiz;
	private int id;
	private int currPage;
	private int status;
	private Shop shop;
	private Reply reply;
	private OrderBean orderBean;
	private Evaluate evaluate;
	private String content;
	
	public String addReply(){
		OrderBean currOrderBean = orderBeanBiz.getOrderBean(id);
		Evaluate evaluate=currOrderBean.getEvaluate();
		reply.setReplyDate(new Date());
		reply.setEvaluate(evaluate);
		replyBiz.addReply(reply);
		ActionContext.getContext().getSession().put("currReply", reply);
		id = currOrderBean.getId();
		return "orderItem";
	}
	
	public String dealPendingOrderBean(){
		OrderBean orderBean=orderBeanBiz.getOrderBean(id);
		status=status+1;
		orderBean.setStatus(status);
		orderBeanBiz.updateOrderBean(orderBean);
		ActionContext.getContext().getSession().put("orderBean", orderBean);
		if(status==3){
			return "historyBillList";
		}
		return "pendingOrderBeanList";
	}
	
	public String setPendingOrderBean(){
		OrderBean orderBean=orderBeanBiz.getOrderBean(id);
		User userTemp=orderBean.getUser();
		String emailAddress=userTemp.getEmail();
		EmailUtil eUtil=new EmailUtil(emailAddress, "您的订单已被拒接", content);
		eUtil.sendEmail();
		orderBean.setStatus(-1);
		orderBeanBiz.updateOrderBean(orderBean);
		ActionContext.getContext().getSession().put("orderBean", orderBean);
		return "historyBillList";
	}
	
	public String prePending(){
		User currUser=(User) ActionContext.getContext().getSession().get("user");
		Shop currShop=shopBiz.getShop(currUser);
		if(currPage<=0){
			currPage=1;
		}
		int pageSize=8;
		int pageCount=orderBeanBiz.getPendingPageCount(currShop, pageSize);
		ActionContext.getContext().getSession().put("pageCount", pageCount);
		
		if(currPage>pageCount){
			currPage--;
		}
		
		ActionContext.getContext().getSession().put("currPage", currPage);
		List<OrderBean> orderBeans=orderBeanBiz.getPendingOrderBeans(currShop, pageSize, currPage);
		ActionContext.getContext().getSession().put("orderBeans2", orderBeans);
		return "pendingOrderBean";
	}
	
	public String preOrderBean(){
		User currUser=(User) ActionContext.getContext().getSession().get("user");
		Shop currShop=shopBiz.getShop(currUser);
		if(currPage<=0){
			currPage=1;
		}
		int pageSize=8;
		int pageCount=orderBeanBiz.getOrderBeanPageCount(currShop, pageSize);
		ActionContext.getContext().getSession().put("pageCount", pageCount);
		
		if(currPage>pageCount){
			currPage--;
		}
		ActionContext.getContext().getSession().put("currPage", currPage);
		
		List<OrderBean> orderBeans=orderBeanBiz.getOrderBeans(currShop, pageSize, currPage);
		for(OrderBean orderBean:orderBeans){
			float price1=0;
			for(OrderItem orderItem:orderBean.getOrderItems()){
				price1=price1+orderItem.getCount()*orderItem.getCommodity().getPrice();
			}
			float price3=price1+orderBean.getShop().getShopDetail().getServiceMoney();
			orderBean.setOrderBeanMoney(price3);
		}
		ActionContext.getContext().getSession().put("orderBeans3", orderBeans);
		return "historyBill";
	}
	
	public String preToday(){
		User currUser=(User) ActionContext.getContext().getSession().get("user");
		Shop currShop=shopBiz.getShop(currUser);
		if(currPage<=0){
			currPage=1;
		}
		int pageSize=8;
		int pageCount=orderBeanBiz.getTodayOrderBeanPageCount(currShop, pageSize);
		ActionContext.getContext().getSession().put("pageCount", pageCount);
		
		if(currPage>pageCount){
			currPage--;
		}
		ActionContext.getContext().getSession().put("currPage", currPage);
		
		List<OrderBean> orderBeans=orderBeanBiz.getTodayOrderBeans(currShop, pageSize, currPage);
		orderBeans.size();
		for(OrderBean orderBean:orderBeans){
			float price1=0;
			for(OrderItem orderItem:orderBean.getOrderItems()){
				price1=price1+orderItem.getCount()*orderItem.getCommodity().getPrice();
			}
			float price3=price1+orderBean.getShop().getShopDetail().getServiceMoney();
			orderBean.setOrderBeanMoney(price3);
		}
		
		ActionContext.getContext().getSession().put("orderBeans4", orderBeans);
		return "todayOrderBean";
	}
	
	public String preWeek(){
		User currUser=(User) ActionContext.getContext().getSession().get("user");
		Shop currShop=shopBiz.getShop(currUser);
		if(currPage<=0){
			currPage=1;
		}
		int pageSize=8;
		int pageCount=orderBeanBiz.getWeekOrderBeanPageCount(currShop, pageSize);
		ActionContext.getContext().getSession().put("pageCount", pageCount);
		
		if(currPage>pageCount){
			currPage--;
		}
		ActionContext.getContext().getSession().put("currPage", currPage);
		
		List<OrderBean> orderBeans=orderBeanBiz.getWeekOrderBean(currShop, pageSize, currPage);
		orderBeans.size();
		for(OrderBean orderBean:orderBeans){
			float price1=0;
			for(OrderItem orderItem:orderBean.getOrderItems()){
				price1=price1+orderItem.getCount()*orderItem.getCommodity().getPrice();
			}
			float price3=price1+orderBean.getShop().getShopDetail().getServiceMoney();
			orderBean.setOrderBeanMoney(price3);
		}
		ActionContext.getContext().getSession().put("orderBeans5", orderBeans);
		return "weekOrderBean";
	}
	
	public String preMonth(){
		User currUser=(User) ActionContext.getContext().getSession().get("user");
		Shop currShop=shopBiz.getShop(currUser);
		if(currPage<=0){
			currPage=1;
		}
		int pageSize=8;
		int pageCount=orderBeanBiz.getMonthOrderBeanPageCount(currShop, pageSize);
		ActionContext.getContext().getSession().put("pageCount", pageCount);
		
		if(currPage>pageCount){
			currPage--;
		}
		ActionContext.getContext().getSession().put("currPage", currPage);
		
		List<OrderBean> orderBeans=orderBeanBiz.getMonthOrderBean(currShop, pageSize, currPage);
		System.out.println(orderBeans.size());
		for(OrderBean orderBean:orderBeans){
			float price1=0;
			for(OrderItem orderItem:orderBean.getOrderItems()){
				price1=price1+orderItem.getCount()*orderItem.getCommodity().getPrice();
			}
			float price3=price1+orderBean.getShop().getShopDetail().getServiceMoney();
			orderBean.setOrderBeanMoney(price3);
		}
		ActionContext.getContext().getSession().put("orderBeans6", orderBeans);
		return "monthOrderBean";
	}
	
	public String preSeason(){
		User currUser=(User) ActionContext.getContext().getSession().get("user");
		Shop currShop=shopBiz.getShop(currUser);
		if(currPage<=0){
			currPage=1;
		}
		int pageSize=8;
		int pageCount=orderBeanBiz.getSeasonOrderBeanPageCount(currShop, pageSize);
		ActionContext.getContext().getSession().put("pageCount", pageCount);
		
		if(currPage>pageCount){
			currPage--;
		}
		ActionContext.getContext().getSession().put("currPage", currPage);
		
		List<OrderBean> orderBeans=orderBeanBiz.getSeasonOrderBean(currShop, pageSize, currPage);
		orderBeans.size();
		for(OrderBean orderBean:orderBeans){
			float price1=0;
			for(OrderItem orderItem:orderBean.getOrderItems()){
				price1=price1+orderItem.getCount()*orderItem.getCommodity().getPrice();
			}
			float price3=price1+orderBean.getShop().getShopDetail().getServiceMoney();
			orderBean.setOrderBeanMoney(price3);
		}
		ActionContext.getContext().getSession().put("orderBeans7", orderBeans);
		return "seasonOrderBean";
	}
	
	public String detail(){
		OrderBean orderBean=orderBeanBiz.getOrderBean(id);
		float price2=0;
		for(OrderItem orderItem:orderBean.getOrderItems()){
			price2=price2+orderItem.getCount()*orderItem.getCommodity().getPrice();
		}
		float price3=price2+orderBean.getShop().getShopDetail().getServiceMoney();
		orderBean.setOrderBeanMoney(price3);
		ActionContext.getContext().getSession().put("orderBean", orderBean);
		return "orderItem";
	}
	
	public OrderBeanBiz getOrderBeanBiz() {
		return orderBeanBiz;
	}

	public void setOrderBeanBiz(OrderBeanBiz orderBeanBiz) {
		this.orderBeanBiz = orderBeanBiz;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public ShopBiz getShopBiz() {
		return shopBiz;
	}

	public void setShopBiz(ShopBiz shopBiz){
		this.shopBiz = shopBiz;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	public OrderBean getOrderBean() {
		return orderBean;
	}

	public void setOrderBean(OrderBean orderBean) {
		this.orderBean = orderBean;
	}

	public Evaluate getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(Evaluate evaluate) {
		this.evaluate = evaluate;
	}

	public ReplyBiz getReplyBiz() {
		return replyBiz;
	}

	public void setReplyBiz(ReplyBiz replyBiz) {
		this.replyBiz = replyBiz;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}