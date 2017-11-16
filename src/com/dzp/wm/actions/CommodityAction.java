package com.dzp.wm.actions;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Hibernate;

import com.dzp.wm.biz.CategoryBiz;
import com.dzp.wm.biz.CommodityBiz;
import com.dzp.wm.biz.ShopBiz;
import com.dzp.wm.pojo.Category;
import com.dzp.wm.pojo.Commodity;
import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.User;
import com.opensymphony.xwork2.ActionContext;

public class CommodityAction {
	
	private CommodityBiz commodityBiz;
	private ShopBiz shopBiz;
	private CategoryBiz categoryBiz;
	private int currPage;
	private File commodityImg;
	private String commodityImgContentType;
	private String commodityImgFileName;  
	private Commodity commodity;
	private Shop shop;
	private Category category;
	
	public String addStatus(){
		Commodity commodity2=commodityBiz.getCommodity(commodity.getId());
		//System.out.println(id);
		//System.out.println(status);
		commodity2.setStatus(true);
		commodityBiz.updateCommodity(commodity2);
		ActionContext.getContext().getSession().put("commodity2", commodity2);
		return "commodityIndex";
	}
	
	public String reduceStatus(){
		Commodity commodity2=commodityBiz.getCommodity(commodity.getId());
		//System.out.println(id);
		//System.out.println(status);
		commodity2.setStatus(false);
		commodityBiz.updateCommodity(commodity2);
		ActionContext.getContext().getSession().put("commodity2", commodity2);
		return "delcommodityIndex";
	}
	
	public String preDelCommodity(){
		User currUser=(User) ActionContext.getContext().getSession().get("user");
		Shop currShop=shopBiz.getShop(currUser);
		if(currPage<=0){
			currPage=1;
		}
		int pageSize=5;
		int pageCount=commodityBiz.getDelCommoditiesCount(currShop, pageSize);
		ActionContext.getContext().getSession().put("pageCount", pageCount);
		if(currPage>pageCount){
			currPage--;
		}
		ActionContext.getContext().getSession().put("currPage", currPage);
		List<Commodity> commodities=commodityBiz.getDelCommodities(currShop, pageSize, currPage);
		ActionContext.getContext().getSession().put("commodities3", commodities);
		Set<Category> categories=categoryBiz.getCategories(currUser.getShop().getId());
		categories.size();
		ActionContext.getContext().getSession().put("categories", categories);
		return "deleteCommodityManage";
	}
	
	public String preCommodity(){
		User currUser=(User) ActionContext.getContext().getSession().get("user");
		Shop currShop=shopBiz.getShop(currUser);
		if(currPage<=0){
			currPage=1;
		}
		int pageSize=5;
		int pageCount=commodityBiz.getCommodityPageCount(currShop, pageSize);
		ActionContext.getContext().getSession().put("pageCount", pageCount);
		if(currPage>pageCount){
			currPage--;
		}
		ActionContext.getContext().getSession().put("currPage", currPage);
		List<Commodity> commodities=commodityBiz.getCommodityList(currShop, pageSize, currPage);
		ActionContext.getContext().getSession().put("commodities", commodities);
		Set<Category> categories=categoryBiz.getCategories(currUser.getShop().getId());
		categories.size();
		ActionContext.getContext().getSession().put("categories", categories);
		return "commodityManage";
	}
	
	public String addCommodity(){
		User currUser=(User) ActionContext.getContext().getSession().get("user");
		Set<Category> categories=categoryBiz.getCategories(currUser.getShop().getId());
		categories.size();
		categories.size();
		ActionContext.getContext().getSession().put("categories", categories);
		String uploadPath=commodity.getCommodityImg();
		String picPath = null;
		try {	
				if(commodityImg!=null){
				InputStream is=new FileInputStream(commodityImg);
				uploadPath=ServletActionContext.getServletContext().getRealPath("/upload");
				picPath=UUID.randomUUID().toString()+"."+commodityImgFileName.split("\\.")[1];
				File toFile=new File(uploadPath,picPath);
				OutputStream os=new FileOutputStream(toFile);
				commodity.setCommodityImg("/wm/upload/"+picPath);
				byte[] buffer=new byte[1024];
				int length=0;
				while((length=is.read(buffer))>0){
					os.write(buffer, 0, length);
				}
				is.close();
				os.close();
			}
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		commodity.setStatus(true);
		commodityBiz.addCommodity(commodity);
		List<Commodity> commodities=commodityBiz.getCommodities();
		ActionContext.getContext().getSession().put("commodities", commodities);
		return "commodityIndex";
	}
	/*
	public String delCommodity(){
		commodityBiz.delCommodity(commodity.getId());
		List<Commodity> commodities=commodityBiz.getCommodities();
		ActionContext.getContext().getSession().put("commodities", commodities);
		return "commodityIndex";
	}
	*/
	public String updateCommodity(){
		Commodity commodity2=commodityBiz.getCommodity(commodity.getId());
		String uploadPath=commodity.getCommodityImg();
		String picPath = null;
		try {	
				if(commodityImg!=null){
				InputStream is=new FileInputStream(commodityImg);
				uploadPath=ServletActionContext.getServletContext().getRealPath("/upload");
				picPath=UUID.randomUUID().toString()+"."+commodityImgFileName.split("\\.")[1];
				File toFile=new File(uploadPath,picPath);
				OutputStream os=new FileOutputStream(toFile);
				commodity2.setCommodityImg("/wm/upload/"+picPath);
				byte[] buffer=new byte[1024];
				int length=0;
				while((length=is.read(buffer))>0){
					os.write(buffer, 0, length);
				}
				is.close();
				os.close();
			}
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		
		commodity2.setCategory(commodity.getCategory());
		commodity2.setCommodityName(commodity.getCommodityName());
		commodity2.setCommodityRemark(commodity.getCommodityRemark());
		commodity2.setPrice(commodity.getPrice());
		
		commodityBiz.updateCommodity(commodity2);
		List<Commodity> commodities=commodityBiz.getCommodities();
		ActionContext.getContext().getSession().put("commodities", commodities);
		return "commodityIndex";
	}
	
	public String updateDelCommodity(){
		Commodity commodity2=commodityBiz.getCommodity(commodity.getId());
		String uploadPath=commodity.getCommodityImg();
		String picPath = null;
		try {	
				if(commodityImg!=null){
				InputStream is=new FileInputStream(commodityImg);
				uploadPath=ServletActionContext.getServletContext().getRealPath("/upload");
				picPath=UUID.randomUUID().toString()+"."+commodityImgFileName.split("\\.")[1];
				File toFile=new File(uploadPath,picPath);
				OutputStream os=new FileOutputStream(toFile);
				commodity2.setCommodityImg("/wm/upload/"+picPath);
				byte[] buffer=new byte[1024];
				int length=0;
				while((length=is.read(buffer))>0){
					os.write(buffer, 0, length);
				}
				is.close();
				os.close();
			}
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		commodity2.setCategory(commodity.getCategory());
		
		commodity2.setCommodityName(commodity.getCommodityName());
		commodity2.setCommodityRemark(commodity.getCommodityRemark());
		commodity2.setPrice(commodity.getPrice());
		
		commodityBiz.updateCommodity(commodity2);
		List<Commodity> commodities=commodityBiz.getCommodities();
		ActionContext.getContext().getSession().put("commodities", commodities);
		return "delcommodityIndex";
	}
	
	public String categoryManage(){
		User shopOwner = (User)ActionContext.getContext().getSession().get("user");
		if(shopOwner.getShop()==null)
			return "login";
		Shop cShop = shopBiz.getShop(shopOwner);
		Set<Category> categorySet = categoryBiz.getCategories(cShop.getId());
		//categoryBiz.getCategories(cShop.getId());
		ActionContext.getContext().getSession().put("categorySets",categorySet);
		return "showCategory";
	}
	
	public String addCategory(){
		User shopOwner = (User)ActionContext.getContext().getSession().get("user");
		if(shopOwner.getShop()==null)
			return "login";
		
		category.setShop(shopOwner.getShop());
		category.setState(1);
		categoryBiz.addCategory(category);
		return categoryManage();
	}
	
	public String showEditCategory(){
		Category currCategory = categoryBiz.getCategory(category.getId());
		Hibernate.initialize(currCategory);
		ActionContext.getContext().getSession().put("currCategory",currCategory);
		
		return "showEditCategory";
	}

	public String editCategory(){
		Category currCategory = categoryBiz.getCategory(category.getId());
		currCategory.setCategoryName(category.getCategoryName());
		currCategory.setCategoryRemark(category.getCategoryRemark());
		categoryBiz.updateCategory(currCategory);
		return categoryManage();
	}
	
	public String delCategory(){
		Category cc = categoryBiz.getCategory(category.getId());
		cc.setState(0);
		for (Commodity c : cc.getCommodities()) {
			c.setStatus(false);
		}
		categoryBiz.updateCategory(cc);
		return  categoryManage();
	}
	
	public String detail(){
		User currUser=(User) ActionContext.getContext().getSession().get("user");
		Set<Category> categories=categoryBiz.getCategories(currUser.getShop().getId());
		categories.size();
		ActionContext.getContext().getSession().put("categories", categories);
		Commodity currCommodity=commodityBiz.getCommodity(commodity.getId());
		ActionContext.getContext().getSession().put("currCommodity", currCommodity);
		return "updateCommodity";
	}
	
	public String delComDetail(){
		User currUser=(User) ActionContext.getContext().getSession().get("user");
		Set<Category> categories=categoryBiz.getCategories(currUser.getShop().getId());
		categories.size();
		ActionContext.getContext().getSession().put("categories", categories);
		Commodity currCommodity=commodityBiz.getCommodity(commodity.getId());
		ActionContext.getContext().getSession().put("currCommodity", currCommodity);
		return "updateDelCommodity";
	}
	
	public CommodityBiz getCommodityBiz() {
		return commodityBiz;
	}

	public void setCommodityBiz(CommodityBiz commodityBiz) {
		this.commodityBiz = commodityBiz;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public String getCommodityImgContentType() {
		return commodityImgContentType;
	}

	public void setCommodityImgContentType(String commodityImgContentType) {
		this.commodityImgContentType = commodityImgContentType;
	}

	public String getCommodityImgFileName() {
		return commodityImgFileName;
	}

	public void setCommodityImgFileName(String commodityImgFileName) {
		this.commodityImgFileName = commodityImgFileName;
	}

	public Commodity getCommodity() {
		return commodity;
	}

	public ShopBiz getShopBiz() {
		return shopBiz;
	}

	public void setShopBiz(ShopBiz shopBiz) {
		this.shopBiz = shopBiz;
	}

	public File getCommodityImg() {
		return commodityImg;
	}

	public void setCommodityImg(File commodityImg) {
		this.commodityImg = commodityImg;
	}

	public CategoryBiz getCategoryBiz() {
		return categoryBiz;
	}

	public void setCategoryBiz(CategoryBiz categoryBiz) {
		this.categoryBiz = categoryBiz;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

}