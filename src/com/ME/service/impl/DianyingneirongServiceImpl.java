package com.ME.service.impl;

import java.text.DateFormat;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ME.dao.DianyingneirongDao;
import com.ME.daoImpl.BaseDaoImpl;
import com.ME.orm.Dianyingneirong;
import com.ME.service.DianyingneirongService;
import com.ME.util.DateUtil;

@Service
@Transactional
public class DianyingneirongServiceImpl extends BaseDaoImpl<Dianyingneirong> implements DianyingneirongService {
	@Resource
	private DianyingneirongDao dianyingnerrongdao;
	
	/**
	 * 获取评分前十的电影内容
	 */
	@Override
	public List<Dianyingneirong> getDianyinListOrderByPingfen() {
		String hql="From Dianyingneirong as d ORDER BY d.fenshu DESC LIMIT 0, 10";
		return dianyingnerrongdao.getDianyinListOrderByPingfen(hql);
	}

	/**
	 * 获取上映时间前一周评分在最前的电影内容，没有数据则调用getDianyinListOrderByPingfen
	 */
	@Override
	public List<Dianyingneirong> getDianyinListOrderByNewtime() {
		String date = new DateUtil().getZhouDate();
		String hql="From Dianyingneirong as d where d.shanyinshijian > '"+date+"' ORDER BY d.fenshu DESC LIMIT 0, 10";
		List<Dianyingneirong> dianyingList = dianyingnerrongdao.getDianyinListOrderByPingfen(hql);
		if(dianyingList.size() == 0) {
			return this.getDianyinListOrderByPingfen();
		}
		return dianyingList;
	}

	@Override
	public List<Dianyingneirong> getDianyinListByCategory(String leibie, String guojia, int orderBy) {
		String hql = "From Dianyingneirong as d where 1 = 1";
		if(!leibie.equals("全部类型")) {
			hql += " and d.leixing = '" + leibie + "' "; 
		}
		if(!guojia.equals("全部地区")) {
			hql += " and d.guojia = '" + guojia + "' "; 
		}
		
		if(orderBy == 0) {
			hql += " ORDER BY shoucangrenshu desc"; 
		}else if(orderBy == 1) {
			hql += " ORDER BY shanyingshijian desc"; 
		}else {
			hql += " ORDER BY fenshu desc";
		}
		System.out.println(hql);
		return dianyingnerrongdao.getDianyinListOrderByPingfen(hql);
	}

	@Override
	public List<Dianyingneirong> getDianyinPaihangban(int category, int tswk) {
		String hql = "From Dianyingneirong as d where 1 = 1";
		if(category == 0 && tswk == 0) {
			hql += " ORDER BY shoucangrenshu desc";
		}else if(category == 0 && tswk == 1) {
			hql += " ORDER BY d.fenshu DESC LIMIT 0, 20";
		}else if(category == 1 && tswk == 0) {
			hql += " and d.leixing = " + category + " ORDER BY d.fenshu DESC LIMIT 0, 20";
		}
		return dianyingnerrongdao.getDianyinListOrderByPingfen(hql);
	}

	@Override
	public List<Dianyingneirong> getDianyinListByKeyword(String keyword) {
		return dianyingnerrongdao.getDianyinListByKeyword(keyword);
	}

	@Override
	public List<Dianyingneirong> getDianyinListByDianyingId(String dianyingid) {
		return dianyingnerrongdao.getDianyinListByDianyingId(dianyingid);
	}

	@Override
	public void updateDianyingPingfen() {
		dianyingnerrongdao.updateDianyingPingfen();
	}

	@Override
	public void updateDianyingZonghePaihang() {
		dianyingnerrongdao.updateDianyingZonghePaihang();
	}

	@Override
	public List<Dianyingneirong> getDianyinListByZonghefengshu() {
		return dianyingnerrongdao.getDianyinListByZonghefengshu();
	}

	@Override
	public List<Dianyingneirong> getDianyinListByBenzhoukoubei() {
		return dianyingnerrongdao.getDianyinListByBenzhoukoubei();
	}

	@Override
	public List<Dianyingneirong> getDianyinLeixingList() {
		return dianyingnerrongdao.getDianyinCategoryList(0);
	}

	@Override
	public List<Dianyingneirong> getDianyinGuojiaList() {
		return dianyingnerrongdao.getDianyinCategoryList(1);
	}

	@Override
	public String getDianyingListCount() {
		return dianyingnerrongdao.getDianyingListCount();
	}

}
