package com.dzp.wm.actions;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import org.apache.struts2.ServletActionContext;

import com.dzp.wm.biz.ShopBiz;
import com.dzp.wm.biz.ShopDetailBiz;
import com.dzp.wm.pojo.Shop;
import com.dzp.wm.pojo.ShopDetail;
import com.dzp.wm.pojo.User;
import com.opensymphony.xwork2.ActionContext;

public class ShopAction {
	
	private File shopImg;
	private String shopImgContentType;
	private String shopImgFileName;  
	private ShopBiz shopBiz;
	private ShopDetailBiz shopDetailBiz;
	private Shop shop;
	
	
	
	public String getCurrShop(){
		User currUser=(User) ActionContext.getContext().getSession().get("user");
		if(currUser!=null){
			Shop currShop=shopBiz.getShop(currUser);
			ActionContext.getContext().getSession().put("currShop1", currShop);
			return "ShopManaTop";
		}
		return "index";
	}
	
	public String getShopdetail(){
		User currUser=(User) ActionContext.getContext().getSession().get("user");
		if(currUser!=null){
			Shop currShop=shopBiz.getShop(currUser);
			ShopDetail shopDetail=shopDetailBiz.getShopDetail(currShop);
			ActionContext.getContext().getSession().put("shopDetail2", shopDetail);
			ActionContext.getContext().getSession().put("currShop2", currShop);

			return "shopInfo";
		}
		return "index";
	}

	public String updateShop(){
		User currUser=(User) ActionContext.getContext().getSession().get("user");
		if(currUser!=null){
			Shop currShop=shopBiz.getShop(currUser);
			ShopDetail shopDetail=shopDetailBiz.getShopDetail(currShop);
			String uploadPath=shopDetail.getShopImg();
			String picPath = null;
			try {
				if(shopImg!=null){
					InputStream is=new FileInputStream(shopImg);
					uploadPath=ServletActionContext.getServletContext().getRealPath("/upload");
					picPath=UUID.randomUUID().toString()+"."+shopImgFileName.split("\\.")[1];
					File toFile=new File(uploadPath,picPath);
					OutputStream os=new FileOutputStream(toFile);
					currShop.getShopDetail().setShopImg("/wm/upload/"+picPath);
					byte[] buffer=new byte[1024];
					int length=0;
					while((length=is.read(buffer))>0){
						os.write(buffer,0,length);
					}
					is.close();
					os.close();
				}
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			currShop.getShopDetail().setServiceMoney(shop.getShopDetail().getServiceMoney());
			currShop.setStartTime(shop.getStartTime());
			currShop.setCloseTime(shop.getCloseTime());
			//currShop.getShopDetail().setShopImg(shop.getShopDetail().getShopImg());;
			currShop.getShopDetail().setShopAddress(shop.getShopDetail().getShopAddress());
			currShop.getShopDetail().setLeastMoney(shop.getShopDetail().getLeastMoney());
			currShop.getShopDetail().setNotice(shop.getShopDetail().getNotice());
			currShop.getShopDetail().setShopRemark(shop.getShopDetail().getShopRemark());
			
			shopBiz.updateShop(currShop);
//			shopDetailBiz.updateShopDetail(shopDetail);
			
			//shopDetailBiz.updateShopDetail(shop.getShopDetail());
			//ActionContext.getContext().getSession().put("currUser", currUser);
			ActionContext.getContext().getSession().put("shopDetail2", shopDetail);
			ActionContext.getContext().getSession().put("currShop2", currShop);
			return "getShop";
		}
		return "index";
	}
	
	public ShopBiz getShopBiz() {
		return shopBiz;
	}

	public void setShopBiz(ShopBiz shopBiz) {
		this.shopBiz = shopBiz;
	}

	public ShopDetailBiz getShopDetailBiz() {
		return shopDetailBiz;
	}

	public void setShopDetailBiz(ShopDetailBiz shopDetailBiz) {
		this.shopDetailBiz = shopDetailBiz;
	}

	public String getShopImgContentType() {
		return shopImgContentType;
	}

	public void setShopImgContentType(String shopImgContentType) {
		this.shopImgContentType = shopImgContentType;
	}

	public String getShopImgFileName() {
		return shopImgFileName;
	}

	public void setShopImgFileName(String shopImgFileName) {
		this.shopImgFileName = shopImgFileName;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public File getShopImg() {
		return shopImg;
	}

	public void setShopImg(File shopImg) {
		this.shopImg = shopImg;
	}

}