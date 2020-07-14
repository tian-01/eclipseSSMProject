package com.tian.crud.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tian.crud.bean.Admin;
import com.tian.crud.bean.Msg;
import com.tian.crud.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	/**
	 * 管理员登录
	 * @param admin
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/admin",method = RequestMethod.GET)
	public Msg checkAdmin(Admin admin) {
		boolean b =  adminService.check(admin);
		if(b) {
			return Msg.success().add("adminName", admin.getAdminName());
		}else {
			return Msg.fail().add("error", "用户名或密码错误");
		}
	}
	
	@RequestMapping(value="/success/{msg}")
	public String success(@PathVariable("msg")String msg,Model model) {
		model.addAttribute("adminName", msg);
		return "index";
	}
	
}
