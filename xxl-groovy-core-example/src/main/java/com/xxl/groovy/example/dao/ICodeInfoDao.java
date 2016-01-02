package com.xxl.groovy.example.dao;

import com.xxl.groovy.example.core.model.CodeInfo;

public interface ICodeInfoDao {
	
	public CodeInfo loadCodeByName(String name);
	
}
