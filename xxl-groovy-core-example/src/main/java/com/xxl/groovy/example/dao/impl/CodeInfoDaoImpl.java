package com.xxl.groovy.example.dao.impl;


import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.xxl.groovy.example.core.model.CodeInfo;
import com.xxl.groovy.example.dao.ICodeInfoDao;

@Repository
public class CodeInfoDaoImpl implements ICodeInfoDao {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public CodeInfo loadCodeByName(String name) {
		return sqlSessionTemplate.selectOne("CodeInfoMapper.loadByName", name);
	}

}
