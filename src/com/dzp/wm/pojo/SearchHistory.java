package com.dzp.wm.pojo;

public class SearchHistory implements Comparable<SearchHistory>{
	
	private int id;
	private String keyWord;
	
	private User user;
	
	public SearchHistory(){}
	
	public SearchHistory(User user){
		this.user = user;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Override
	public int compareTo(SearchHistory arg0) {
		return this.id < arg0.id ? 1 : -1;
	}


}
