package com.ME.service;

import java.util.List;

import com.ME.dao.BaseDao;
import com.ME.orm.Pinglun;

public interface PinglunService extends BaseDao<Pinglun> {
	public List<Pinglun> getTopTenPinglunList();
	public List<Pinglun> getAllPinglunList();
	public List<Pinglun> getPinglunListByDianyinId(String dianyingId);
	public List<Pinglun> getPinglunListByUserName(String userName);
	public Pinglun getPinglunByPinglunid(String pinglunid);
	public String getPinglunListCount();;
}
