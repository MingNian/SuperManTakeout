package com.dzp.wm.dao.impl;

import java.util.List;

import com.dzp.wm.dao.AdminDAO;
import com.dzp.wm.dao.base.impl.BaseDAO;
import com.dzp.wm.pojo.Admin;

public class AdminDAOImpl extends BaseDAO<Admin> implements AdminDAO{

	@Override
	public Admin login(String loginId, String pwd) {
		String hql = " from Admin a where a.loginId = ? and a.pwd = ? ";
		List<Admin> adminList = (List<Admin>) getHibernateTemplate().find(hql, loginId,pwd);
		if(adminList == null || adminList.size()==0)
			return null;
		else
			return adminList.get(0);
	}

	
}
