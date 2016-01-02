package com.xxl.groovy.example.controller;

import java.text.MessageFormat;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class IndexController {

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
		return MessageFormat.format("code name : {0}<hr>{1}", name, "code...");
	}
}
