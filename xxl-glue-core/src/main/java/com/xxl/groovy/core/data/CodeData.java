package com.xxl.groovy.core.data;

import java.io.Serializable;

public class CodeData implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String name;
	private String source;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	
}
