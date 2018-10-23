package com.ME.service;

import java.util.List;

import com.ME.dao.BaseDao;
import com.ME.orm.Dianyingneirong;

public interface DianyingneirongService extends BaseDao<Dianyingneirong> {
	public List<Dianyingneirong> getDianyinListOrderByPingfen();
	public List<Dianyingneirong> getDianyinListOrderByNewtime(); 
	public List<Dianyingneirong> getDianyinListByKeyword(String keyword); 
	public List<Dianyingneirong> getDianyinPaihangban(int category,int tswk);
	public List<Dianyingneirong> getDianyinListByCategory(String leibie,String guojia,int orderBy);
	public List<Dianyingneirong> getDianyinListByDianyingId(String dianyingid);
	public List<Dianyingneirong> getDianyinListByZonghefengshu();
	public void updateDianyingPingfen();
	public void updateDianyingZonghePaihang();
	public List<Dianyingneirong> getDianyinListByBenzhoukoubei();
	public List<Dianyingneirong> getDianyinLeixingList();
	public List<Dianyingneirong> getDianyinGuojiaList();
	public String getDianyingListCount();
}
