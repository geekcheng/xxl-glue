package com.xxl.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xxl.controller.annotation.PermessionLimit;

@Controller
@RequestMapping("/code")
public class CodeController {
	
	@RequestMapping("/codeEditor")
	@PermessionLimit
	public String codeEditor(HttpServletRequest request){
		return "code/code.editor";
	}
	
	@RequestMapping("/demoEditor")
	@PermessionLimit
	public String demoEditor(HttpServletRequest request){
		return "code/demo.editor";
	}
	
}
