package com.ME.daoImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ME.dao.HuifuDao;
import com.ME.dao.PinglunDao;
import com.ME.orm.Dianyingneirong;
import com.ME.orm.Huifu;
import com.ME.orm.Pinglun;
import com.ME.service.DianyingneirongService;

@Service
@Transactional
public class PinglunDaoImpl implements PinglunDao {
	@Resource
	private SessionFactory sessionFactory;
	@Resource
	private HuifuDao huifuDao;
	@Resource
	private DianyingneirongService dianyingService;
	/**
	 * 获取当前可用的Session
	 * 
	 * @return
	 */
	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	/**
	 * 获取影评列表如果为1则是首页重要的前十条影评，否则放回默认的所有
	 */
	@Override
	public List<Pinglun> getHotPinglunListOrderBy(int isTopTen) {
		String hql = "";
		if(isTopTen == 1) {
			hql = "FROM Huifu GROUP BY pinglunid ORDER BY COUNT(pinglunid) DESC  LIMIT 0,10 ";
			Query query = this.getSession().createQuery(hql);
		    List<Huifu> huifuList = query.list();
		    List<Pinglun> pinglunList = new ArrayList<Pinglun>();
		    for(Huifu huifu: huifuList) {
		    	Pinglun pinglun = (Pinglun)this.getSession().get(Pinglun.class, huifu.getPinglunid());
		    	pinglun.setDianyingName(dianyingService.getDianyinListByDianyingId(pinglun.getDianyingid()).get(0).getName());
		    	pinglun.setLeixing(String.valueOf(huifuDao.getHuifuCountByPinglunId(pinglun.getPinglunid())));
		    	pinglunList.add(pinglun);
		    }
		    return pinglunList;
		}else {
			hql = "FROM Pinglun ";
			Query query = this.getSession().createQuery(hql);
		    List<Pinglun> PinglunList = query.list();
		    for(int i = 0;i < PinglunList.size();i ++) {
		    	if(dianyingService.getDianyinListByDianyingId(PinglunList.get(i).getDianyingid()) == null)
		    		continue;
		    	Dianyingneirong dianying = dianyingService.getDianyinListByDianyingId(PinglunList.get(i).getDianyingid()).get(0);
		    	PinglunList.get(i).setDianyingName(dianying.getName());
		    	PinglunList.get(i).setLeixing(String.valueOf(huifuDao.getHuifuCountByPinglunId(PinglunList.get(i).getPinglunid())));;
		    }
		    return PinglunList;
		}
		
	}

	/**
	 * 获取电影id下所有的电影评论
	 */
	@Override
	public List<Pinglun> getPinglunListByDianyinId(String dianyingId) {
		String hql = "from Pinglun as p where p.dianyingid = '" + dianyingId +"'";
		Query query = this.getSession().createQuery(hql);
		if(query.list().size() == 0) 
			return null;
		return (List<Pinglun>)query.list();
	}

	/**
	 * 获取用户的所有评论
	 */
	@Override
	public List<Pinglun> getPinglunListByUserName(String userName) {
		String hql = "from Pinglun as p where p.username = '" + userName +"'";
		Query query = this.getSession().createQuery(hql);
		return (List<Pinglun>)query.list();
	}

	@Override
	public Pinglun getPinglunByPinglunid(String pinglunid) {
		String hql = "from Pinglun as p where p.pinglunid = '" + pinglunid +"'";
		System.out.println(hql);
		Query query = this.getSession().createQuery(hql);
		if(query.list() != null && query.list().size() != 0)
			return (Pinglun) query.list().get(0);
		return null;
	}

	@Override
	public String getPinglunListCount() {
		String sql = "select count(*) from pinglun";
		Query query = this.getSession().createSQLQuery(sql);
		return query.list().get(0).toString();
	}

}
