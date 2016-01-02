package com.xxl.groovy.core;

import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.xxl.groovy.core.support.SpringSupport;

import groovy.lang.GroovyClassLoader;

/**
 * glue factory, product class/object by name
 * @author xuxueli 2016-1-2 20:02:27
 */
public class GlueFactory {
	private static Logger logger = LoggerFactory.getLogger(GlueFactory.class);
	
	// groovy class loader
	private GroovyClassLoader groovyClassLoader = new GroovyClassLoader();
	
	// code source loader
	private GlueLoader glueLoader;
	public void setGlueLoader(GlueLoader glueLoader) {
		this.glueLoader = glueLoader;
	}
	public GlueLoader getGlueLoader() {
		return glueLoader;
	}
	
	// spring support
	private SpringSupport springSupport;
	public void setSpringSupport(SpringSupport springSupport) {
		this.springSupport = springSupport;
	}
	public SpringSupport getSpringSupport() {
		return springSupport;
	}
	public void fillBeanField(Object instance){
		if (springSupport!=null) {
			springSupport.fillBeanField(instance);
		}
	}
	
	// cache class/object with beat
	private ConcurrentHashMap<String, Long> classBeatMap = new ConcurrentHashMap<String,Long>();
	private ConcurrentHashMap<String, Class<?>> classMap = new ConcurrentHashMap<String, Class<?>>();
	private ConcurrentHashMap<String, Object> instanceMap = new ConcurrentHashMap<String, Object>();
	
	// class(source) Map beat check
	private boolean isBeating(String name){
		if (classBeatMap.containsKey(name)) {
			Long beat = classBeatMap.get(name);
			if (beat!=null && System.currentTimeMillis() - beat < 5 * 1000) {
				return true;
			}
		}
		return false;
	}
	private void beat(String name){
		classBeatMap.put(name, System.currentTimeMillis());
	}
	
	// load class, 
	public Class<?> loadClass(String name){
		if (name==null || name.trim().length()==0) {
			return null;
		}
		if (classMap.containsKey(name) && this.isBeating(name)) {
			return classMap.get(name);
		}
		String codeSource = glueLoader.load(name);
		if (codeSource!=null && codeSource.trim().length()>0) {
			try {
				Class<?> clazz = groovyClassLoader.parseClass(codeSource);
				if (clazz!=null) {
					classMap.put(name, clazz);
					beat(name);
					logger.info(">>>>>>>>>>>> xxl-glue, fresh class, name:{}", name);
					return clazz;
				}
			} catch (Exception e) {
				logger.info(">>>>>>>>>>>> xxl-glue, parse class error, name:{}", name);
				logger.info(">>>>>>>>>>>> xxl-glue, parse class error, e:{}", e);
			}
		}
		return null;
	}
	
	// load new instance, prototype
	public Object loadNewInstance(String name){
		if (name==null || name.trim().length()==0) {
			return null;
		}
		Class<?> clazz = loadClass(name);
		if (clazz!=null) {
			try {
				Object instance = clazz.newInstance();
				if (instance!=null) {
					this.fillBeanField(instance);
					instanceMap.put(name, instance);
					return instance;
				}
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	// // load instance, singleton
	public Object loadInstance(String name){
		if (name==null || name.trim().length()==0) {
			return null;
		}
		if (instanceMap.containsKey(name) && this.isBeating(name)) {
			return instanceMap.get(name);
		}
		Object instance = loadNewInstance(name);
		if (instance!=null) {
			logger.info(">>>>>>>>>>>> xxl-glue, fresh instance, name:{}", name);
			instanceMap.put(name, instance);
			return instance;
		}
		return null;
	}
	
}
