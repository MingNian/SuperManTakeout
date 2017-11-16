package com.dzp.wm.dao.base;

import java.io.Serializable;
import java.util.List;

public interface IBaseDAO<T> {
	//ͨ�õ�CURD����
	
	//1.��������id����ʵ�����
	T get(Serializable id) ;
	
	//2.����ʵ�����
	Serializable add(T t);
	
	//3.�޸�ʵ�����
	void update(T t);
	
	//4.ɾ��ʵ�����
	void del(T t);
	
	//5.����IDɾ��ʵ�����
	void del(Serializable id);
	
	//6.��������
	List<T> loadAll();
	
}
