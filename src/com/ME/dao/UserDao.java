package com.ME.dao;

import java.util.List;

import com.ME.orm.User;

public interface UserDao {
	public List<User> getAllUserList();
	public boolean userLoginCheck(String username,String password);
	public boolean adminLoginCheck(String username,String password);
	public User getUserBeanByUsername(String username);
	public int getUserPinglunCountByUsername(String username);
	public String getUserListCount();
}	
