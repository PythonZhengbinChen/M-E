package com.ME.dao;

import java.util.List;

import com.ME.orm.Dianyingneirong;

public interface DianyingneirongDao {
	public List<Dianyingneirong> getDianyinListOrderByPingfen(String hql);
	public List<Dianyingneirong> getDianyinListByKeyword(String keyword); 
	public List<Dianyingneirong> getDianyinCategoryList(int isCategory);
	public List<Dianyingneirong> getDianyinListByDianyingId(String dianyingid);
	public List<Dianyingneirong> getDianyinListByZonghefengshu();
	public void updateDianyingPingfen();
	public void updateDianyingZonghePaihang();
	public List<Dianyingneirong> getDianyinListByBenzhoukoubei();
	public String getDianyingListCount();
}
