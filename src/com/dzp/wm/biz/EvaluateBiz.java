package com.dzp.wm.biz;

import java.util.Set;

import com.dzp.wm.pojo.Evaluate;

public interface EvaluateBiz {
	
	//�õ��ض���������Ӧ���û�����
	public Set<Evaluate> getEvaluates(int shopId);
	
	//�õ�һ���ض����û�����
	public Evaluate getEvaluate(int evaluateId);
}
