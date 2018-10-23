package com.ME.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ME.dao.PinglunDao;
import com.ME.daoImpl.BaseDaoImpl;
import com.ME.orm.Pinglun;
import com.ME.service.PinglunService;

@Service
@Transactional
public class PinglunServiceImpl extends BaseDaoImpl<Pinglun>  implements PinglunService {
	@Resource
	private PinglunDao pinglunDao;
	
	@Override
	public List<Pinglun> getTopTenPinglunList() {
		return pinglunDao.getHotPinglunListOrderBy(1);
	}

	@Override
	public List<Pinglun> getAllPinglunList() {
		return pinglunDao.getHotPinglunListOrderBy(0);
	}

	@Override
	public List<Pinglun> getPinglunListByDianyinId(String dianyingId) {
		return pinglunDao.getPinglunListByDianyinId(dianyingId);
	}

	@Override
	public List<Pinglun> getPinglunListByUserName(String userName) {
		return pinglunDao.getPinglunListByUserName(userName);
	}

	@Override
	public Pinglun getPinglunByPinglunid(String pinglunid) {
		return pinglunDao.getPinglunByPinglunid(pinglunid);
	}

	@Override
	public String getPinglunListCount() {
		return pinglunDao.getPinglunListCount();
	}

}
