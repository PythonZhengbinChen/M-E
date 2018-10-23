package com.ME.action.admin;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.ME.action.BaseAction;
import com.ME.orm.User;
import com.ME.util.HqlHelper;
import com.opensymphony.xwork2.ActionContext;

public class AdminAction extends BaseAction<User>{
	public String login(){
		return "login";
		
	}
	public String outlogin(){
		ActionContext.getContext().getSession().remove("adminLoginer");
		return "outlogin";
		
	}
	public String adminLogin() {
		List<User> list =userService.getPageBean(
				1,
				1,
				new HqlHelper(User.class, "u").addWhereCondition(
						"u.username=?", model.getUsername()).addWhereCondition(
						"u.password=?", model.getPassword())).getRecordList();
		System.out.println(model.getUsername()+"login!");
		if (userService.adminLoginCheck(model.getUsername(), model.getPassword())) {
			User user=list.get(0);
            ActionContext.getContext().getSession().put("adminLoginer",user);
			return "adminIndex";

		} else {
			return "errorlogin";
		}
	}
	public String list(){
		new HqlHelper(User.class, "u").addWhereCondition("u.Admin=?", false).addOrderByProperty("createTime", false).preparePageBeanForStruts2(0, 1000,userService);;
		return "list";
	}
	public String delete(){
		userService.delete(model);
		return "delete";
	}
	public String info(){
		User user=userService.getById(model.getId());
		ActionContext.getContext().getValueStack().push(user);
		return "info";
	}
	
	public String adminList(){
		return "adminList";
	}
	public String update(){
		 User user=(User) ActionContext.getContext().getSession().get("adminLoginer");
		 user.setName(model.getName());
		 user.setPhone(model.getPhone());
		 userService.update(user);
		return "update";
	}
	public String addAdmin(){
		model.setAdmin(1);;
		model.setCreateTime(new Date());
		userService.save(model);
		return "addAdmin";
	}
	public String updatepas() throws IOException{
		 User user=(User) ActionContext.getContext().getSession().get("adminLoginer");
		HttpServletRequest httpServletRequest= ServletActionContext.getRequest();
		HttpServletResponse httpServletResponse = ServletActionContext.getResponse();
		httpServletResponse.setCharacterEncoding("UTF-8");
		String old=httpServletRequest.getParameter("oldpas");
		if(user.getPassword().equals(old)){
			user.setPassword(httpServletRequest.getParameter("newpas"));
			userService.update(user);
			httpServletResponse.getWriter().print("修改成功，重新登录生效！");
		}else{
			httpServletResponse.getWriter().print("修改失败，原密码不正确！");
		}
		return null;
	}
}
