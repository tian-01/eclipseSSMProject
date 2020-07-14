package com.tian.crud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tian.crud.bean.Admin;
import com.tian.crud.dao.AdminMapper;

@Service
public class AdminService {
	
	@Autowired
	AdminMapper adminMapper;

	public boolean check(Admin admin) {
		// TODO Auto-generated method stub
		int i = adminMapper.queryByAdmin(admin); 
		if(i>0) {
			return true;
		}else {
			return false;
		}
	}
	
}
