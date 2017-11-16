package com.dzp.wm.dao.impl;

import java.util.Set;

import com.dzp.wm.dao.OrderItemDAO;
import com.dzp.wm.dao.base.impl.BaseDAO;
import com.dzp.wm.pojo.CartItem;
import com.dzp.wm.pojo.OrderBean;
import com.dzp.wm.pojo.OrderItem;

public class OrderItemDAOImpl extends BaseDAO<OrderItem> implements OrderItemDAO {

	@Override
	public Set<OrderItem> getOrderItems(int orderBeanId) {
		OrderBean orderBean=getHibernateTemplate().load(OrderBean.class, orderBeanId);
		return orderBean.getOrderItems();
	}

	@Override
	public void addOrderItem(OrderItem orderItem) {
		getHibernateTemplate().save(orderItem);
	}
	
}
