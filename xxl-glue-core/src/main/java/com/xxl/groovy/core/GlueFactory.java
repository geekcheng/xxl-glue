package com.xxl.groovy.core;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.xxl.groovy.core.cache.LocalCache;
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
	
	// load class, 
	public Class<?> loadClass(String name){
		if (name==null || name.trim().length()==0) {
			return null;
		}
		String cacheClassKey = name+"_class";
		Object cacheClass = LocalCache.getInstance().get(cacheClassKey);
		if (cacheClass != null) {
			return (Class<?>) cacheClass;
		}
		String codeSource = glueLoader.load(name);
		if (codeSource!=null && codeSource.trim().length()>0) {
			try {
				Class<?> clazz = groovyClassLoader.parseClass(codeSource);
				if (clazz!=null) {
					LocalCache.getInstance().set(cacheClassKey, clazz);
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
		String cacheInstanceKey = name + "_instance";
		Object cacheClass = LocalCache.getInstance().get(cacheInstanceKey);
		if (cacheClass!=null) {
			return cacheClass;
		}
		Object instance = loadNewInstance(name);
		if (instance!=null) {
			LocalCache.getInstance().set(cacheInstanceKey, instance);
			logger.info(">>>>>>>>>>>> xxl-glue, fresh instance, name:{}", name);
			return instance;
		}
		return null;
	}
	
}
