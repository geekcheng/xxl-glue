package com.xxl.groovy.example.service.impl;

import java.util.Map;

import com.xxl.groovy.example.service.IDemoHandler;

public class DemoHandlerImpl implements IDemoHandler {

	@Override
	public Object handle(Map<String, Object> params) {
		return "666";
	}
	
}
