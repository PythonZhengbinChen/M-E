package com.ME.daoImpl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ME.dao.BaseDao;
import com.ME.dao.DianyingneirongDao;
import com.ME.dao.PinglunDao;
import com.ME.dao.UserDao;
import com.ME.orm.Dianyingneirong;
import com.ME.orm.Pinglun;
import com.ME.util.DateUtil;

@Service
@Transactional
public class DianyingneirongDaoImpl implements DianyingneirongDao {
	@Resource
	private SessionFactory sessionFactory;
	@Resource
	private BaseDao<Dianyingneirong> baseDao;
	@Resource
	private UserDao userDao;
	@Resource
	private PinglunDao pinglunDao;

	/**
	 * 获取当前可用的Session
	 * 
	 * @return
	 */
	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	
	@Override
	public List<Dianyingneirong> getDianyinListOrderByPingfen(String hql) {
		//String hql="From Dianyingneirong as d where d.shanyinshijian >  ORDER BY d.fenshu DESC LIMIT 0, 10";
		Query query = this.getSession().createQuery(hql);
	    List<Dianyingneirong> dianyinList = query.list();
	    if(dianyinList.size() == 0)
			return null;
		return dianyinList;
	}


	@Override
	public List<Dianyingneirong> getDianyinCategoryList(int isCategory) {
		String hql="";
		if(isCategory == 0) {
			hql="From Dianyingneirong as d GROUP BY d.leixing";
		} else {
			hql="From Dianyingneirong as d GROUP BY d.guojia";
		}
		Query query = this.getSession().createQuery(hql);
		List<Dianyingneirong> dianyinList = query.list();
		if(dianyinList.size() == 0)
			return null;
		return dianyinList;
	}

	
	@Override
	public List<Dianyingneirong> getDianyinListByKeyword(String keyword) {
		String hql="From Dianyingneirong as d WHERE INSTR(d.name,'"+keyword+"') > 0 OR INSTR(d.daoyan,'"
				+keyword+"') > 0 OR INSTR(d.zhuyan,'"+keyword+"') >0";
		Query query = this.getSession().createQuery(hql);
		List<Dianyingneirong> dianyinList = query.list();
		if(dianyinList.size() == 0)
			return null;
		return dianyinList;
	}


	@Override
	public List<Dianyingneirong> getDianyinListByDianyingId(String dianyingid) {
		String hql = "from Dianyingneirong as d where d.id = '" + dianyingid + "'";
		Query query = this.getSession().createQuery(hql);
		List<Dianyingneirong> list = query.list();
		if(list.size() != 0) {
			return list;
		}
		return null;
	}

	/*
	 * (non-Javadoc) 
	 * @see com.ME.dao.DianyingneirongDao#updateDianyingPingfen()
	 * 更新电影评分 根据用户的评论数量来考虑用户的评分权重
	 */
	@Override
	public void updateDianyingPingfen() {
		String hqlDianying = "from Dianyingneirong";
		Query query = this.getSession().createQuery(hqlDianying);
		List<Dianyingneirong> dianyingList = query.list();
		for(Dianyingneirong dianying: dianyingList) {
			//String hqlPinglun = "from Pinglun as p where p.dianyingid = '" + dianying.getId() + "'";
			//query = this.getSession().createQuery(hqlPinglun);
			List<Pinglun> pinglunList = pinglunDao.getPinglunListByDianyinId(dianying.getId());
			if(pinglunList == null) {
				dianying.setFenshu(0f);
			} else {
				int pinglunListCount = pinglunList.size();
				float fengshuCount = 0f;
				for(Pinglun pinglun:pinglunList) {
					int userPinglunCount = userDao.getUserPinglunCountByUsername(pinglun.getUsername());
					double fengshu = 0;
					if(userPinglunCount >= 50) {
						fengshu = pinglun.getPingfen() * 2;
					} else {
						fengshu = pinglun.getPingfen() * 1.8;
					}
					fengshuCount = (float) (fengshuCount + fengshu);
				}
				dianying.setFenshu(fengshuCount/pinglunListCount);
			}
			baseDao.update(dianying);
		}
	}


	/**
	 * 更新电影的综合分数： 综合分数 = 电影评分*评论数
	 */
	@Override
	public void updateDianyingZonghePaihang() {
		String hqlDianying = "from Dianyingneirong";
		Query query = this.getSession().createQuery(hqlDianying);
		List<Dianyingneirong> dianyingList = query.list();
		int defaultM = 100;
		for(Dianyingneirong dianying: dianyingList) {
			List<Pinglun> pinglunList = pinglunDao.getPinglunListByDianyinId(dianying.getId());
			Float avgFenshu = dianying.getFenshu();
			int pinglunListCount = 0;
			if(pinglunList != null) {
				pinglunListCount = pinglunList.size();
			}
			
			BigDecimal v = BigDecimal.valueOf(pinglunListCount);
			BigDecimal m = BigDecimal.valueOf(defaultM);
			BigDecimal R = BigDecimal.valueOf(avgFenshu);
			BigDecimal C = BigDecimal.valueOf(this.getAllDianyingPingfenAvg());
			
			BigDecimal vm = v.add(m);
			BigDecimal vR = v.multiply(R);
			BigDecimal mC = m.multiply(C);
			
			BigDecimal vRvm = vR.divide(vm,4,BigDecimal.ROUND_HALF_UP);
			BigDecimal mCvm = mC.divide(vm,4,BigDecimal.ROUND_HALF_UP);
			
			double WR = vRvm.add(mCvm).doubleValue();
			
			System.out.println(vm+"------"+vR+"---"+mC+"----"+vRvm+"======"+mCvm);
			System.out.println(WR+"-------------");
			dianying.setShoucangrenshu(String.valueOf(WR));
			baseDao.update(dianying);
		}
	}


	@Override
	public List<Dianyingneirong> getDianyinListByZonghefengshu() {
		String hqlDianying = "from Dianyingneirong order by shoucangrenshu desc";
		Query query = this.getSession().createQuery(hqlDianying);
		List<Dianyingneirong> dianyingList = query.list();
		if(dianyingList.size() == 0)
			return null;
		return dianyingList;
	}


	@Override
	public List<Dianyingneirong> getDianyinListByBenzhoukoubei() {
		String date = new DateUtil().getZhouDate();
		String hql = "from Pinglun as p WHERE cretime > '"+date+"' GROUP BY p.dianyingid";
		Query query = this.getSession().createQuery(hql);
		List<Pinglun> pinglunList = query.list();
		if(pinglunList == null)
			return null;
		List<Dianyingneirong> dianyingList = new ArrayList<Dianyingneirong>();
		for(Pinglun pinglun: pinglunList) {
			List<Dianyingneirong> list = this.getDianyinListByDianyingId(pinglun.getDianyingid());
			if(list == null) {
				continue;
			}
			dianyingList.add(list.get(0));
		}
		return dianyingList;
	}


	@Override
	public String getDianyingListCount() {
		String sql = "select count(*) from dianyingneirong";
		Query query = this.getSession().createSQLQuery(sql);
		return query.list().get(0).toString();
	}
	
	
	public float getAllDianyingPingfenAvg() {
		String sql = "select fenshu from dianyingneirong";
		Query query = this.getSession().createSQLQuery(sql);
		List<Float> fenshuList = query.list();
		float allFenshu = 0f;
		int dianyingCount = Integer.valueOf(this.getDianyingListCount());
		for(Float fenshu : fenshuList) {
			allFenshu = allFenshu + fenshu;
		}
		return allFenshu / dianyingCount;
	}

}
