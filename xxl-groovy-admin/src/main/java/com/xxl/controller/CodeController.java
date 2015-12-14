package com.xxl.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xxl.controller.annotation.PermessionLimit;
import com.xxl.core.result.ReturnT;

@Controller
@RequestMapping("/code")
public class CodeController {
	private static Logger logger = LoggerFactory.getLogger(CodeController.class);
	
	@RequestMapping("/codeEditor")
	@PermessionLimit
	public String codeEditor(HttpServletRequest request){
		return "code/code.editor";
	}
	
	private static String code;
	
	@PermessionLimit
	@RequestMapping("/pullCode")
	@ResponseBody
	public ReturnT<String> pullCode(HttpServletRequest request, String moduleName){
		return new ReturnT<String>(CodeController.code);
	}
	
	@PermessionLimit
	@RequestMapping("/pushCode")
	@ResponseBody
	public ReturnT<String> pushCode(HttpServletRequest request, String moduleName, String code){
		logger.info("********* push code : moduleName");
		logger.info(code);
		CodeController.code = code;
		return ReturnT.SUCCESS;
	}
	
}
