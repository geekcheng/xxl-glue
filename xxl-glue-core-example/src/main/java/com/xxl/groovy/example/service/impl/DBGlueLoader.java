package com.xxl.groovy.example.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.xxl.groovy.core.GlueLoader;
import com.xxl.groovy.example.core.model.CodeInfo;
import com.xxl.groovy.example.dao.ICodeInfoDao;

@Repository("dbGlueLoader")
public class DBGlueLoader implements GlueLoader {

	@Resource
	private ICodeInfoDao codeInfoDao;
	
	@Override
	public String load(String name) {
		CodeInfo codeInfo = codeInfoDao.loadCodeByName(name);
		if (codeInfo!=null) {
			return codeInfo.getSource();
		}
		return null;
	}
	
}
