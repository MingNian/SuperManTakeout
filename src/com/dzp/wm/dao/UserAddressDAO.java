package com.dzp.wm.dao;

import java.util.List;

import com.dzp.wm.dao.base.IBaseDAO;
import com.dzp.wm.pojo.UserAddress;

public interface UserAddressDAO extends IBaseDAO<UserAddress>  {

	public  List<UserAddress> getAddressesByUid(int id);
}
