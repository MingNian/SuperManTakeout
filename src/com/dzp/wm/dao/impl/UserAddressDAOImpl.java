package com.dzp.wm.dao.impl;

import java.util.List;

import com.dzp.wm.dao.UserAddressDAO;
import com.dzp.wm.dao.base.impl.BaseDAO;
import com.dzp.wm.pojo.UserAddress;

public class UserAddressDAOImpl extends BaseDAO<UserAddress>  implements UserAddressDAO {

	@Override
	public List<UserAddress> getAddressesByUid(int id) {
		String hql = "from UserAddress u where u.user.id = ?";
		List<UserAddress> userAddressList = (List<UserAddress>) getHibernateTemplate().find(hql, id);
		return userAddressList;
	}

}
