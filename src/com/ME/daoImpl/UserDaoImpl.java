package com.ME.daoImpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ME.dao.UserDao;
import com.ME.orm.User;

@Service
@Transactional
public class UserDaoImpl implements UserDao {
	@Resource
	private SessionFactory sessionFactory;
	
	/**
	 * 获取当前可用的Session
	 * 
	 * @return
	 */
	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	
	@Override
	public List<User> getAllUserList() {
		String hql = "from User as u where u.admin = '0'";
		Query query = this.getSession().createQuery(hql);
		return (List<User>)query.list();
	}

	@Override
	public boolean userLoginCheck(String username, String password) {
		String hql = "from User as u where u.admin = 0 and u.username = '" + username + "' and u.password = '" + password+ "' ";
		Query query = this.getSession().createQuery(hql);
		
		if(query.list().size() == 0) {
			return false;
		}
		return true;
	}

	@Override
	public boolean adminLoginCheck(String username, String password) {
		String hql = "from User as u where u.admin = 1 and u.username = '" + username + "' and u.password = '" + password+ "' ";
		Query query = this.getSession().createQuery(hql);
		if(query.list().size() == 0) {
			return false;
		}
		return true;
	}


	@Override
	public User getUserBeanByUsername(String username) {
		String hql = "from User as u where u.admin = 0 and u.username = '" + username + "'";
		Query query = this.getSession().createQuery(hql);
		return (User)query.list().get(0);
	}


	@Override
	public int getUserPinglunCountByUsername(String username) {
		String hql = "from Pinglun as p where  p.username = '" + username + "'";
		Query query = this.getSession().createQuery(hql);
		return query.list().size();
	}


	@Override
	public String getUserListCount() {
		String sql = "select count(*) from user as u where u.Admin = 0";
		Query query = this.getSession().createSQLQuery(sql);
		return query.list().get(0).toString();
	}

}
