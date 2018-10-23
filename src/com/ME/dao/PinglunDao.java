package com.ME.dao;

import java.util.List;

import com.ME.orm.Pinglun;

public interface PinglunDao {
	public List<Pinglun> getHotPinglunListOrderBy(int isTopTen);
	public List<Pinglun> getPinglunListByDianyinId(String dianyingId);
	public List<Pinglun> getPinglunListByUserName(String userName);
	public Pinglun getPinglunByPinglunid(String pinglunid);
	public String getPinglunListCount();
}
