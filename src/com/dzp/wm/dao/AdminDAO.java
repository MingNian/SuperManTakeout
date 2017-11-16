package com.dzp.wm.dao;

import com.dzp.wm.dao.base.IBaseDAO;
import com.dzp.wm.pojo.Admin;

public interface AdminDAO extends IBaseDAO<Admin>  {
	
	public Admin login(String loginId,String pwd);
}
