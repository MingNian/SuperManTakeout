package com.dzp.wm.biz.impl;

import java.util.List;

import com.dzp.wm.biz.OrderBeanBiz;
import com.dzp.wm.dao.OrderBeanDAO;
import com.dzp.wm.pojo.Evaluate;
import com.dzp.wm.pojo.OrderBean;
import com.dzp.wm.pojo.Shop;

public class OrderBeanBizImpl implements OrderBeanBiz {

	private OrderBeanDAO orderBeanDAO=null;
	
	@Override
	public void updateOrderBean(OrderBean orderBean) {
		orderBeanDAO.update(orderBean);
	}
	
	@Override
	public int getPendingPageCount(Shop shop, int pageSize) {
		int count=orderBeanDAO.getPendingOrderBeansCount(shop);
		return (count+pageSize-1)/pageSize;
	}

	@Override
	public List<OrderBean> getPendingOrderBeans(Shop shop, int pageSize, int currPage) {
		return orderBeanDAO.getPendingOrderBeans(shop, pageSize, currPage);
	}

	@Override
	public int getOrderBeanPageCount(Shop shop, int pageSize) {
		int count=orderBeanDAO.getOrderBeansCount(shop);
		return (count+pageSize-1)/pageSize;
	}

	@Override
	public List<OrderBean> getOrderBeans(Shop shop, int pageSize, int currPage) {
		return orderBeanDAO.getOrderBeans(shop, pageSize, currPage);
	}

	@Override
	public int getTodayOrderBeanPageCount(Shop shop, int pageSize) {
		int count=orderBeanDAO.getTodayOrderBeansCount(shop);
		return (count+pageSize-1)/pageSize;
	}

	@Override
	public List<OrderBean> getTodayOrderBeans(Shop shop, int pageSize, int currPage) {
		return orderBeanDAO.getTodayOrderBeans(shop, pageSize, currPage);
	}

	@Override
	public int getWeekOrderBeanPageCount(Shop shop, int pageSize) {
		int count=orderBeanDAO.getWeekOrderBeansCount(shop);
		return (count+pageSize-1)/pageSize;
	}

	@Override
	public List<OrderBean> getWeekOrderBean(Shop shop, int pageSize, int currPage) {
		return orderBeanDAO.getWeekOrderBeans(shop, pageSize, currPage);
	}

	@Override
	public int getMonthOrderBeanPageCount(Shop shop, int pageSize) {
		int count=orderBeanDAO.getMonthOrderBeansCount(shop);
		return (count+pageSize-1)/pageSize;
	}

	@Override
	public List<OrderBean> getMonthOrderBean(Shop shop, int pageSize, int currPage) {
		return orderBeanDAO.getMonthBeans(shop, pageSize, currPage);
	}

	@Override
	public int getSeasonOrderBeanPageCount(Shop shop, int pageSize) {
		int count=orderBeanDAO.getSeasonOrderBeansCount(shop);
		return (count+pageSize-1)/pageSize;
	}

	@Override
	public List<OrderBean> getSeasonOrderBean(Shop shop, int pageSize, int currPage) {
		return orderBeanDAO.getSeasonOrderBeans(shop, pageSize, currPage);
	}

	@Override
	public OrderBean getOrderBean(int orderBeanId) {
		return orderBeanDAO.get(orderBeanId);
	}

	public OrderBeanDAO getOrderBeanDAO() {
		return orderBeanDAO;
	}

	public void setOrderBeanDAO(OrderBeanDAO orderBeanDAO) {
		this.orderBeanDAO = orderBeanDAO;
	}

	@Override
	public void addOrderBean(OrderBean orderBean) {
		orderBeanDAO.addOrderBean(orderBean);
	}

	@Override
	public void insertEvaluate(Evaluate evaluate) {
		orderBeanDAO.insertEvaluate(evaluate);
		
	}

}
