package com.dzp.wm.biz;

import java.util.List;

import com.dzp.wm.pojo.Evaluate;
import com.dzp.wm.pojo.OrderBean;
import com.dzp.wm.pojo.Shop;

public interface OrderBeanBiz {

	//锟斤拷锟斤拷锟斤拷锟揭灰筹拷锟绞撅拷锟斤拷锟斤拷锟斤拷锟斤拷腋锟斤拷锟斤拷锟斤拷囟锟斤拷锟斤拷檀锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟揭筹拷锟�
	int getPendingPageCount(Shop shop,int pageSize);
	List<OrderBean> getPendingOrderBeans(Shop shop,int pageSize,int currPage);
	
	//锟斤拷锟斤拷锟斤拷锟揭灰筹拷锟绞撅拷锟斤拷锟斤拷锟斤拷锟斤拷腋锟斤拷锟斤拷锟斤拷囟锟斤拷锟斤拷锟斤拷锟斤拷锟缴讹拷锟斤拷锟斤拷锟斤拷页锟斤拷
	int getOrderBeanPageCount(Shop shop,int pageSize);
	List<OrderBean> getOrderBeans(Shop shop,int pageSize,int currPage);
		
	int getTodayOrderBeanPageCount(Shop shop,int pageSize);
	List<OrderBean> getTodayOrderBeans(Shop shop,int pageSize,int currPage);
	
	int getWeekOrderBeanPageCount(Shop shop,int pageSize);
	List<OrderBean> getWeekOrderBean(Shop shop,int pageSize,int currPage);
	
	int getMonthOrderBeanPageCount(Shop shop,int pageSize);
	List<OrderBean> getMonthOrderBean(Shop shop,int pageSize,int currPage);
	
	int getSeasonOrderBeanPageCount(Shop shop,int pageSize);
	List<OrderBean> getSeasonOrderBean(Shop shop,int pageSize,int currPage);
	
	//锟斤拷取一锟斤拷锟截讹拷锟斤拷锟斤拷
	public OrderBean getOrderBean(int orderBeanId);
	
	//鏇存柊璁㈠崟(鐘舵�佺殑鏀瑰彉)
	public void updateOrderBean(OrderBean orderBean);
	
	public void addOrderBean(OrderBean orderBean);
	
	public void insertEvaluate(Evaluate evaluate);
	
}