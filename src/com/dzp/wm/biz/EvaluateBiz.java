package com.dzp.wm.biz;

import java.util.Set;

import com.dzp.wm.pojo.Evaluate;

public interface EvaluateBiz {
	
	//得到特定商铺所对应的用户评价
	public Set<Evaluate> getEvaluates(int shopId);
	
	//得到一条特定的用户评价
	public Evaluate getEvaluate(int evaluateId);
}
