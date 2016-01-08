import com.xxl.service.IGroovyService;

import groovy.lang.GroovyClassLoader;

public class TestGroovy {
	
	@SuppressWarnings({ "unchecked", "resource" })
	public static void main(String[] args) throws InstantiationException, IllegalAccessException {
		
		String classCode = "package com.xxl.service.impl;"+
				"import java.util.Map; "+
				"import com.xxl.service.IGroovyService;"+
				"class GroovyServiceImpl2 implements IGroovyService{"+
				"	@Override"+
				"	public Object execute(Map<String, Object> param) {"+
				"		return 1656565;"+
				"	}"+
				"}"+
				";";
		
		GroovyClassLoader groovyClassLoader = new GroovyClassLoader();
		Class<IGroovyService> clazz = groovyClassLoader.parseClass(classCode);
		IGroovyService service = clazz.newInstance();
		System.out.println(service.execute(null));
		
	}
}
