package com.dzp.wm.dao;

import java.util.Set;

import com.dzp.wm.dao.base.IBaseDAO;
import com.dzp.wm.pojo.Evaluate;

public interface EvaluateDAO extends IBaseDAO<Evaluate>  {
	
	//�õ��ض���������Ӧ���û�����
	public Set<Evaluate> getEvaluates(int shopId);
}
