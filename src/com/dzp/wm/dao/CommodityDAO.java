package com.dzp.wm.dao;

import java.util.List;

import com.dzp.wm.dao.base.IBaseDAO;
import com.dzp.wm.pojo.Commodity;
import com.dzp.wm.pojo.Shop;

public interface CommodityDAO extends IBaseDAO<Commodity>{
	
	//��ȡ��Ʒ�ܼ�¼����
	int getCommoditiesCount(Shop shop);
	List<Commodity> getCommodities(Shop shop,int pageSize,int pageNum);
	
	Commodity getCommodity(int id);
	
	List<Commodity> getDelCommodities(Shop shop, int pageSize, int pageNum);
	int getDelCommoditiesCount(Shop shop);
	
}
