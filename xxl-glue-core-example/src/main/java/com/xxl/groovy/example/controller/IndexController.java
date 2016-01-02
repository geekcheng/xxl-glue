package com.xxl.groovy.example.controller;

import java.text.MessageFormat;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xxl.groovy.example.core.model.CodeInfo;
import com.xxl.groovy.example.dao.ICodeInfoDao;

@Controller
public class IndexController {
	
	@Resource
	private ICodeInfoDao codeInfoDao;

	@RequestMapping
	@ResponseBody
	public Map<String, Object> index() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tim", System.currentTimeMillis());
		return map;
	}
	
	@RequestMapping("/code/{name}")
	@ResponseBody
	public String code(@PathVariable String name) {
		String source = null;
		CodeInfo codeInfo = codeInfoDao.loadCodeByName(name);
		if (codeInfo!=null) {
			source = codeInfo.getSource();
		}
		return MessageFormat.format("code name : {0}<hr>{1}", name, source);
	}
}