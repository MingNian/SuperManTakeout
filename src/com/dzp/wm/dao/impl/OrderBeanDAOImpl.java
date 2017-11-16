package com.dzp.wm.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.dzp.wm.dao.OrderBeanDAO;
import com.dzp.wm.dao.base.impl.BaseDAO;
import com.dzp.wm.pojo.Evaluate;
import com.dzp.wm.pojo.OrderBean;
import com.dzp.wm.pojo.Shop;

public class OrderBeanDAOImpl extends BaseDAO<OrderBean> implements OrderBeanDAO {

	@Override
	public int getPendingOrderBeansCount(Shop shop) {
		String hql="select count(*) from OrderBean o where o.shop.id = ? and o.status in (0,1,2)";
		return ((Long)getHibernateTemplate().find(hql, shop.getId()).get(0)).intValue();
	}

	@Override
	public List<OrderBean> getPendingOrderBeans(Shop shop, int pageSize, int pageNum) {
		String hql="from OrderBean o where o.shop.id = ? and o.status in (0,1,2)  order by o.orderBeanTime asc";
		return getHibernateTemplate().getSessionFactory().getCurrentSession()
				                      .createQuery(hql).setParameter(0, shop.getId())
				                      .setFirstResult((pageNum-1)*pageSize)
				                      .setMaxResults(pageSize).list();
	}

	@Override
	public int getOrderBeansCount(Shop shop) {
		String hql="select count(*) from OrderBean o where o.shop.id=? and o.status in (-1,3)";
		return ((Long)getHibernateTemplate().find(hql,shop.getId()).get(0)).intValue();
	}

	@Override
	public List<OrderBean> getOrderBeans(Shop shop, int pageSize, int pageNum) {
		String hql="from OrderBean o where o.shop.id = ? and o.status in (-1,3)  order by o.orderBeanTime desc";
		return getHibernateTemplate().getSessionFactory().getCurrentSession()
				                     .createQuery(hql).setParameter(0, shop.getId())
				                                       .setFirstResult((pageNum-1)*pageSize)
				                                       .setMaxResults(pageSize).list();
	
	}

	@Override
	public int getTodayOrderBeansCount(Shop shop) {
		Date endDate=new Date();
		Calendar cl=Calendar.getInstance();
		cl.setTime(endDate);
		cl.add(Calendar.DATE, -1);
		Date startDate=cl.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String start=sdf.format(startDate);
		String end=sdf.format(endDate);
		
		String hql="select count(*) from OrderBean o where o.shop.id=? and o.status in (-1,3)and o.orderBeanTime between '"+start+"' and '"+end+"' ";
		return ((Long)getHibernateTemplate().find(hql, shop.getId()).get(0)).intValue();
	}

	@Override
	public List<OrderBean> getTodayOrderBeans(Shop shop, int pageSize, int pageNum) {
		Date endDate=new Date();
		Calendar cl=Calendar.getInstance();
		cl.setTime(endDate);
		cl.add(Calendar.DATE, -1);
		Date startDate=cl.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String start=sdf.format(startDate);
		String end=sdf.format(endDate);
		
		String hql="from OrderBean o where o.shop.id=? and o.status in (-1,3)and o.orderBeanTime between '"+start+"' and '"+end+"' order by o.orderBeanTime desc";
		return getHibernateTemplate().getSessionFactory().getCurrentSession()
									  .createQuery(hql).setParameter(0, shop.getId())
									  .setFirstResult((pageNum-1)*pageSize)
									  .setMaxResults(pageSize).list();
	}

	@Override
	public int getWeekOrderBeansCount(Shop shop) {
		Date endDate=new Date();
		Calendar cl=Calendar.getInstance();
		cl.setTime(endDate);
		cl.add(Calendar.DATE, -7);
		Date startDate=cl.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String start=sdf.format(startDate);
		String end=sdf.format(endDate);
		
		String hql="select count(*) from OrderBean o where o.shop.id=? and o.status in (-1,3)and o.orderBeanTime between '"+start+"' and '"+end+"' ";
		return ((Long)getHibernateTemplate().find(hql, shop.getId()).get(0)).intValue();
	}

	@Override
	public List<OrderBean> getWeekOrderBeans(Shop shop, int pageSize, int pageNum) {
		Date endDate=new Date();
		Calendar cl=Calendar.getInstance();
		cl.setTime(endDate);
		cl.add(Calendar.DATE, -7);
		Date startDate=cl.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String start=sdf.format(startDate);
		String end=sdf.format(endDate);
		
		String hql="from OrderBean o where o.shop.id=? and o.status in (-1,3)and o.orderBeanTime between '"+start+"' and '"+end+"' order by o.orderBeanTime desc";
		
		return getHibernateTemplate().getSessionFactory().getCurrentSession()
				                      .createQuery(hql).setParameter(0, shop.getId())
				                      .setFirstResult((pageNum-1)*pageSize)
				                      .setMaxResults(pageSize).list();
	}

	@Override
	public int getMonthOrderBeansCount(Shop shop) {
		Date endDate=new Date();
		Calendar cl=Calendar.getInstance();
		cl.setTime(endDate);
		cl.add(Calendar.MONTH, -1);
		Date startDate=cl.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String start=sdf.format(startDate);
		String end=sdf.format(endDate);
		
		String hql="select count(*) from OrderBean o where o.shop.id=? and o.status in (-1,3)and o.orderBeanTime between '"+start+"' and '"+end+"' ";
		return ((Long)getHibernateTemplate().find(hql, shop.getId()).get(0)).intValue();
	}

	@Override
	public List<OrderBean> getMonthBeans(Shop shop, int pageSize, int pageNum) {
		Date endDate=new Date();
		Calendar cl=Calendar.getInstance();
		cl.setTime(endDate);
		cl.add(Calendar.MONTH, -1);
		Date startDate=cl.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String start=sdf.format(startDate);
		String end=sdf.format(endDate);
		
		String hql="from OrderBean o where o.shop.id=? and o.status in (-1,3)and o.orderBeanTime between '"+start+"' and '"+end+"' order by o.orderBeanTime desc";
		return getHibernateTemplate().getSessionFactory().getCurrentSession()
				                      .createQuery(hql).setParameter(0, shop.getId())
				                      .setFirstResult((pageNum-1)*pageSize)
				                      .setMaxResults(pageSize).list();
	}

	@Override
	public int getSeasonOrderBeansCount(Shop shop) {
		Date endDate=new Date();
		Calendar cl=Calendar.getInstance();
		cl.setTime(endDate);
		cl.add(Calendar.MONTH, -3);
		Date startDate=cl.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String start=sdf.format(startDate);
		String end=sdf.format(endDate);
		
		String hql="select count(*) from OrderBean o where o.shop.id=? and o.status in (-1,3)and o.orderBeanTime between '"+start+"' and '"+end+"'";
		return ((Long)getHibernateTemplate().find(hql, shop.getId()).get(0)).intValue();
	}

	@Override
	public List<OrderBean> getSeasonOrderBeans(Shop shop, int pageSize, int pageNum) {
		Date endDate=new Date();
		Calendar cl=Calendar.getInstance();
		cl.setTime(endDate);
		cl.add(Calendar.MONTH, -3);
		Date startDate=cl.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String start=sdf.format(startDate);
		String end=sdf.format(endDate);
		
		String hql="from OrderBean o where o.shop.id=? and o.status in (-1,3) and o.orderBeanTime between '"+start+"' and '"+end+"' order by o.orderBeanTime desc";
		return getHibernateTemplate().getSessionFactory().getCurrentSession()
				                      .createQuery(hql).setParameter(0, shop.getId())
				                      .setFirstResult((pageNum-1)*pageSize)
				                      .setMaxResults(pageSize).list();
	}

	@Override
	public void addOrderBean(OrderBean orderBean) {
		getHibernateTemplate().save(orderBean);
	}

	@Override
	public void insertEvaluate(Evaluate evaluate) {
		getHibernateTemplate().save(evaluate);
	}
}
