package com.xxl.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xxl.controller.annotation.PermessionLimit;
import com.xxl.core.model.CodeInfo;
import com.xxl.core.result.ReturnT;
import com.xxl.dao.ICodeInfoDao;

@Controller
@RequestMapping("/code")
public class CodeController {
	private static Logger logger = LoggerFactory.getLogger(CodeController.class);
	
	@Resource
	private ICodeInfoDao codeInfoDao;
	
	@RequestMapping
	@PermessionLimit
	public String index(){
		return "code/index";
	}
	
	@RequestMapping("/pageList")
	@ResponseBody
	@PermessionLimit
	public Map<String, Object> pageList(@RequestParam(required = false, defaultValue = "0") int start,  
			@RequestParam(required = false, defaultValue = "10") int length, String name){
		
		List<CodeInfo> list = codeInfoDao.pageList(start, length, name);
		int list_count = codeInfoDao.pageListCount(start, length, name);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("recordsTotal", list_count);		// 总记录数
		map.put("recordsFiltered", list_count);		// 过滤后的总记录数
	    map.put("data", list);  					// 分页列表
		return map;
	}
	
	@RequestMapping("/delCode")
	@ResponseBody
	@PermessionLimit
	public ReturnT<String> delCode(int id){
		int ret = codeInfoDao.delete(id);
		if (ret < 1) {
			return new ReturnT<String>(500, "删除失败");
		}
		return ReturnT.SUCCESS;
	}
	
	@RequestMapping("/codeEditor")
	@PermessionLimit
	public String codeEditor(Model model, int id){
		CodeInfo codeInfo = codeInfoDao.loadCode(id);
		
		model.addAttribute("codeInfo", codeInfo);
		return "code/code.editor";
	}
	
	@PermessionLimit
	@RequestMapping("/saveCode")
	@ResponseBody
	public ReturnT<String> saveCode(CodeInfo codeInfo){
		int ret = codeInfoDao.save(codeInfo);
		if (ret < 1) {
			return new ReturnT<String>(500, "新增失败");
		}
		return ReturnT.SUCCESS;
	}
	
	@PermessionLimit
	@RequestMapping("/updateCode")
	@ResponseBody
	public ReturnT<String> updateCode(HttpServletRequest request, CodeInfo codeInfo){
		int ret = codeInfoDao.update(codeInfo);
		logger.info("code update:{}", codeInfo);
		if (ret < 1) {
			return new ReturnT<String>(500, "更新失败");
		}
		return ReturnT.SUCCESS;
	}
	
	/*@RequestMapping("/demoEditor")
	@PermessionLimit
	public String demoEditor(HttpServletRequest request){
		return "code/demo.editor";
	}*/
}
