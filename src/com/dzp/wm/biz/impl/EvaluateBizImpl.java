package com.dzp.wm.biz.impl;

import java.util.Set;

import com.dzp.wm.biz.EvaluateBiz;
import com.dzp.wm.dao.EvaluateDAO;
import com.dzp.wm.pojo.Evaluate;

public class EvaluateBizImpl implements EvaluateBiz {

	private EvaluateDAO evaluateDAO=null;
	
	@Override
	public Set<Evaluate> getEvaluates(int shopId) {
		return evaluateDAO.getEvaluates(shopId);
	}
	
	@Override
	public Evaluate getEvaluate(int evaluateId) {
		return evaluateDAO.get(evaluateId);
	}
	
	public EvaluateDAO getEvaluateDAO() {
		return evaluateDAO;
	}
	public void setEvaluateDAO(EvaluateDAO evaluateDAO) {
		this.evaluateDAO = evaluateDAO;
	}
}
