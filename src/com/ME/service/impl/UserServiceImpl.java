package com.ME.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ME.dao.UserDao;
import com.ME.daoImpl.BaseDaoImpl;
import com.ME.orm.User;
import com.ME.service.UserService;

@Service
@Transactional
public class UserServiceImpl extends BaseDaoImpl<User> implements UserService{
	@Resource
	private UserDao userDao;
	
	@Override
	public List<User> getAllUserList() {
		return userDao.getAllUserList();
	}

	@Override
	public boolean userLoginCheck(String username, String password) {
		return userDao.userLoginCheck(username, password);
	}

	@Override
	public boolean adminLoginCheck(String username, String password) {
		return userDao.adminLoginCheck(username, password);
	}

	@Override
	public User getUserBeanByUsername(String username) {
		return userDao.getUserBeanByUsername(username);
	}

	@Override
	public String getUserListCount() {
		return userDao.getUserListCount();
	}

}
