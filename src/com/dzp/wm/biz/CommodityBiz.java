package com.dzp.wm.biz;

import java.util.List;

import com.dzp.wm.pojo.Commodity;
import com.dzp.wm.pojo.Shop;

public interface CommodityBiz {
	
	//锟斤拷锟斤拷锟斤拷锟揭灰筹拷锟绞撅拷锟斤拷锟斤拷锟斤拷锟斤拷腋锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷页锟斤拷
	int getCommodityPageCount(Shop shop,int pageSize);
	List<Commodity> getCommodityList(Shop shop,int pageSize , int currPage) ;

	//鑾峰彇鐗瑰畾鍟嗗簵宸蹭笅鏋跺晢鍝�
	int getDelCommoditiesCount(Shop shop,int pageSize);
	List<Commodity> getDelCommodities(Shop shop,int pageSize,int currPage);
	
	// 锟斤拷取锟斤拷品Id锟截讹拷锟斤拷品
	public Commodity getCommodity(int commodityId);

	// 删锟斤拷锟截讹拷锟斤拷品Id锟斤拷应锟斤拷锟斤拷品
	//public void delCommodity(int commodityId);

	// 锟斤拷锟斤拷锟斤拷品
	public void addCommodity(Commodity commodity);

	// 锟睫革拷锟截讹拷锟斤拷品锟斤拷息
	public void updateCommodity(Commodity commodity);
	
	//鍔犺浇鐗瑰畾鍟嗗簵鎵�鏈夌殑鍟嗗搧
	public List<Commodity> getCommodities();
}
