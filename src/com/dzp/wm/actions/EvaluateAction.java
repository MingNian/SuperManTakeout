package com.dzp.wm.actions;

import com.dzp.wm.biz.EvaluateBiz;
import com.dzp.wm.biz.ShopBiz;
import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.User;
import com.opensymphony.xwork2.ActionContext;

public class EvaluateAction {
	
	private EvaluateBiz evaluateBiz;
	private ShopBiz shopBiz;
	private User user;
	
	public String EvaluateList(){
		Shop currShop=(Shop) ActionContext.getContext().getSession().get("currShop");
		user=currShop.getUser();
		currShop=shopBiz.getShop(user);
		ActionContext.getContext().getSession().put("currShop", currShop);
		currShop.getEvaluates().size();
		return "";
	}

	public EvaluateBiz getEvaluateBiz() {
		return evaluateBiz;
	}

	public void setEvaluateBiz(EvaluateBiz evaluateBiz) {
		this.evaluateBiz = evaluateBiz;
	}

	public ShopBiz getShopBiz() {
		return shopBiz;
	}

	public void setShopBiz(ShopBiz shopBiz) {
		this.shopBiz = shopBiz;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
	
}
