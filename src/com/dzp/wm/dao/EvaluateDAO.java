package com.dzp.wm.dao;

import java.util.Set;

import com.dzp.wm.dao.base.IBaseDAO;
import com.dzp.wm.pojo.Evaluate;

public interface EvaluateDAO extends IBaseDAO<Evaluate>  {
	
	//得到特定商铺所对应的用户评价
	public Set<Evaluate> getEvaluates(int shopId);
}
