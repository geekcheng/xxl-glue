package com.xxl.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xxl.controller.annotation.PermessionLimit;

@Controller
@RequestMapping("/code")
public class CodeController {
	
	@RequestMapping("/editor")
	@PermessionLimit
	public String loginPage(HttpServletRequest request){
		return "code/editor";
	}
	
}
