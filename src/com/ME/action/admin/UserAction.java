package com.ME.action.admin;

import com.ME.action.BaseAction;
import com.ME.orm.User;
import com.ME.service.UserService;
import com.opensymphony.xwork2.ActionContext;

public class UserAction extends BaseAction<User> {
	public String getUserList() {
		ActionContext.getContext().put("userLists", userService.getAllUserList());
		return "userList";
	}
	
	public String cancelUserInfo() {
		User user = userService.getUserBeanByUsername(model.getUsername());
		user.setAdmin(2);
		userService.update(user);
		return "cancelSuccess";
	}
}
