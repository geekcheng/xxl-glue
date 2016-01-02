package com.xxl.groovy.core.support;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

import javax.annotation.Resource;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.core.annotation.AnnotationUtils;

/**
 * support spring
 * @author xuxueli 2016-1-2 22:01:23
 */
public class SpringSupport implements ApplicationContextAware {

	private ApplicationContext applicationContext;
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext = applicationContext;
	}
	
	public void fillBeanField(Object instance){
		if (instance==null) {
			return;
		}
	    
		Field[] fields = instance.getClass().getDeclaredFields();
		for (Field field : fields) {
			if (Modifier.isStatic(field.getModifiers())) {
				continue;
			}
			
			Object fieldBean = null;
			
			
			if (AnnotationUtils.getAnnotation(field, Resource.class) != null) {
				//CommonAnnotationBeanPostProcessor // AutowiredAnnotationBeanPostProcessor
				fieldBean = applicationContext.getBean(field.getName());		// 暂时只支持，通过 “@Resource”注解注入，根据属性名获取Bean
				if (fieldBean==null ) {
					//fieldBean = applicationContext.getBean(field.getType());	// 不稳定
				}
			} else if (AnnotationUtils.getAnnotation(field, Autowired.class) != null) {
				if (fieldBean==null ) {
					//fieldBean = applicationContext.getBean(field.getType());	// 不稳定
				}
			}
			
			if (fieldBean!=null) {
				field.setAccessible(true);
				try {
					field.set(instance, fieldBean);
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				}
			}
		}
	}

}
