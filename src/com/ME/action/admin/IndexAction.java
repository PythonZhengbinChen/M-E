package com.ME.action.admin;

import com.ME.action.BaseAction;
import com.ME.orm.Dianyingneirong;
import com.ME.orm.User;
import com.ME.service.DianyingneirongService;
import com.opensymphony.xwork2.ActionContext;

public class IndexAction extends BaseAction<User>{
	public String head(){
		User user=userService.getById(1);
		ActionContext.getContext().getSession().put("adminUser", user);
		return "head";
		
	}
	public String top(){
		return "top";
		
	}
	public String left(){
		User user = (User) ActionContext.getContext().getSession().get("adminUser");
		System.out.println(model.getUsername());
		ActionContext.getContext().getSession().put("adminUser", user);
		return "left";
		
	}
	public String main(){
		ActionContext.getContext().put("dianyingListCount", dianyingneirongService.getDianyingListCount());
		ActionContext.getContext().put("pinglunListCount", pinglunService.getPinglunListCount());
		ActionContext.getContext().put("userListCount", userService.getUserListCount());
		return "main";
		
	}
	public String index(){
		return "index";
		
	}
}
