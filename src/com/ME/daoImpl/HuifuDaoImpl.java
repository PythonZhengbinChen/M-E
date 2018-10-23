package com.ME.daoImpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ME.dao.HuifuDao;
import com.ME.orm.Huifu;

@Service
@Transactional
public class HuifuDaoImpl implements HuifuDao {
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
	
	/**
	 * 获取某条评论下面所有的回复信息
	 */
	@Override
	public List<Huifu> getHuifuListByPinglunId(String pinglunid) {
		String hql = "from Huifu as h where h.pinglunid = '" + pinglunid +"'";
		Query query = this.getSession().createQuery(hql);
		return (List<Huifu>)query.list();
	}

	/**
	 * 获取某一个影评下对应的回复数量和影评一起显示
	 */
	@Override
	public int getHuifuCountByPinglunId(String pinglunid) {
		String hql = "from Huifu as h where h.pinglunid = '" + pinglunid +"'";
		Query query = this.getSession().createQuery(hql);
		return query.list().size();
	}

}
