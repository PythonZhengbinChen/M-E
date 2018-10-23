package com.ME.service;

import java.util.List;

import com.ME.dao.BaseDao;
import com.ME.orm.User;

public interface UserService extends BaseDao<User>{
	public List<User> getAllUserList();
	public boolean userLoginCheck(String username,String password);
	public boolean adminLoginCheck(String username,String password);
	public User getUserBeanByUsername(String username);
	public String getUserListCount();
}
