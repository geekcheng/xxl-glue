package com.xxl.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xxl.core.model.CodeInfo;
import com.xxl.core.result.ReturnT;
import com.xxl.dao.ICodeInfoDao;
import com.xxl.service.ICodeService;

@Service
public class CodeServiceImpl implements ICodeService {
	
	@Autowired
	private ICodeInfoDao codeInfoDao;

	@Override
	public Map<String, Object> pageList(int offset, int pagesize, String name) {
		List<CodeInfo> list = codeInfoDao.pageList(offset, pagesize, name);
		int list_count = codeInfoDao.pageListCount(offset, pagesize, name);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("recordsTotal", list_count);		// 总记录数
		map.put("recordsFiltered", list_count);		// 过滤后的总记录数
	    map.put("data", list);  					// 数据
	    
		return map;
	}

	@Override
	public ReturnT<String> delete(int id) {
		int ret = codeInfoDao.delete(id);
		if (ret < 1) {
			return new ReturnT<String>(500, "删除失败");
		}
		return ReturnT.SUCCESS;
	}

	@Override
	public ReturnT<String> saveCodeInfo(CodeInfo codeInfo) {
		CodeInfo codeInfo2 = codeInfoDao.loadCodeByName(codeInfo.getName());
		if (codeInfo2!=null) {
			return new ReturnT<String>(500, "“Code名称”已存在");
		}
		int ret = codeInfoDao.save(codeInfo);
		if (ret < 1) {
			return new ReturnT<String>(500, "新增失败");
		}
		return ReturnT.SUCCESS;
	}

	@Override
	public ReturnT<String> updateCodeSource(CodeInfo codeInfo) {
		int ret = codeInfoDao.update(codeInfo);
		if (ret < 1) {
			return new ReturnT<String>(500, "更新失败");
		}
		
		return ReturnT.SUCCESS;
	}

	@Override
	public CodeInfo loadCode(int id) {
		return codeInfoDao.loadCode(id);
	}

}
