package com.dzp.wm.dao;

import java.util.List;

import com.dzp.wm.dao.base.IBaseDAO;
import com.dzp.wm.pojo.Evaluate;
import com.dzp.wm.pojo.OrderBean;
import com.dzp.wm.pojo.Shop;

public interface OrderBeanDAO extends IBaseDAO<OrderBean>  {
	
	//锟斤拷锟斤拷囟锟斤拷痰锟斤拷锟接碉拷锟斤拷锟窖结单锟斤拷锟斤拷锟斤拷锟杰硷拷录锟斤拷锟斤拷
	int getPendingOrderBeansCount(Shop shop);
	List<OrderBean> getPendingOrderBeans(Shop shop,int pageSize,int pageNum);
	
	//锟斤拷锟斤拷囟锟斤拷痰锟斤拷锟斤拷锟缴讹拷锟斤拷锟杰硷拷录锟斤拷锟斤拷
	int getOrderBeansCount(Shop shop);
	List<OrderBean> getOrderBeans(Shop shop,int pageSize,int pageNum);
	
	// 鑾峰緱鐗瑰畾鍟嗛摵浠婃棩璁㈠崟鐨勮褰曟潯鏁�
	int getTodayOrderBeansCount(Shop shop);
	List<OrderBean> getTodayOrderBeans(Shop shop,int pageSize,int pageNum);
	
	//鑾峰緱鐗瑰畾鍟嗛摵鏈�杩戜竴鍛ㄨ鍗曠殑璁板綍鏉℃暟
	int getWeekOrderBeansCount(Shop shop);
	List<OrderBean> getWeekOrderBeans(Shop shop,int pageSize,int pageNum);

	//鑾峰緱鐗瑰畾鍟嗛摵鏈�杩戜竴鏈堣鍗曠殑璁板綍鏉℃暟
	int getMonthOrderBeansCount(Shop shop);
	List<OrderBean> getMonthBeans(Shop shop,int pageSize,int pageNum);

	// 鑾峰緱鐗瑰畾鍟嗛摵鏈�杩戜笁鏈堣鍗曠殑璁板綍鏉℃暟
	int getSeasonOrderBeansCount(Shop shop);
	
	List<OrderBean> getSeasonOrderBeans(Shop shop,int pageSize,int pageNum);
	
	void addOrderBean(OrderBean orderBean);
	
	void insertEvaluate(Evaluate evaluate);
}
