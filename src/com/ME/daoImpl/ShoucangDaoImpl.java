package com.ME.daoImpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ME.dao.ShoucangDao;
import com.ME.orm.ShouCang;

@Service
@Transactional
public class ShoucangDaoImpl implements ShoucangDao {
	@Resource
	private SessionFactory sessionFactory;
	/**
	 * 获取当前可用的Session
	 * @return
	 */
	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public List<ShouCang> getDianyingIdListByUsername(String username) {
		String hql = "from ShouCang as s where s.username = '" + username +"'";
		Query query = this.getSession().createQuery(hql);
		List<ShouCang> list = query.list();
		if(list.size() != 0) {
			return list;
		}
		return null;
	}

	@Override
	public List<ShouCang> getDianyingIdListByUserAndDianying(String username, String dianyingid) {
		String hql = "from ShouCang as s where s.username = '" + username +"' and s.dianyingid = '" + dianyingid +"'";
		Query query = this.getSession().createQuery(hql);
		List<ShouCang> list = query.list();
		if(list.size() != 0) {
			return list;
		}
		return null;
	}

}
