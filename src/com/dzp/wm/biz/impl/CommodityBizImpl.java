package com.dzp.wm.biz.impl;

import java.util.List;

import com.dzp.wm.biz.CommodityBiz;
import com.dzp.wm.dao.CommodityDAO;
import com.dzp.wm.pojo.Commodity;
import com.dzp.wm.pojo.Shop;

public class CommodityBizImpl implements CommodityBiz {

	private CommodityDAO commodityDAO;
	
	@Override
	public int getCommodityPageCount(Shop shop, int pageSize) {
		int count=commodityDAO.getCommoditiesCount(shop);
		return (count+pageSize-1)/pageSize;
	}

	@Override
	public List<Commodity> getCommodityList(Shop shop, int pageSize, int currPage) {
		return commodityDAO.getCommodities(shop, pageSize, currPage);
	}
	
	@Override
	public int getDelCommoditiesCount(Shop shop, int pageSize) {
		int count=commodityDAO.getDelCommoditiesCount(shop);
		return (count+pageSize-1)/pageSize;
	}

	@Override
	public List<Commodity> getDelCommodities(Shop shop, int pageSize, int currPage) {
		return commodityDAO.getDelCommodities(shop, pageSize, currPage);
	}
	
	@Override
	public Commodity getCommodity(int commodityId) {
		return commodityDAO.getCommodity(commodityId);
	}
	
/*
	@Override
	public void delCommodity(int commodityId) {
		commodityDAO.del(commodityId);
		
	}
*/
	@Override
	public void addCommodity(Commodity commodity) {
		commodityDAO.add(commodity);
	}

	@Override
	public void updateCommodity(Commodity commodity) {
		commodityDAO.update(commodity);
		
	}
	
	@Override
	public List<Commodity> getCommodities() {
		return commodityDAO.loadAll();
	}

	public CommodityDAO getCommodityDAO() {
		return commodityDAO;
	}

	public void setCommodityDAO(CommodityDAO commodityDAO) {
		this.commodityDAO = commodityDAO;
	}

}
