package com.ME.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ME.dao.ShoucangDao;
import com.ME.daoImpl.BaseDaoImpl;
import com.ME.orm.ShouCang;
import com.ME.service.ShouCangService;

@Service
@Transactional
public class ShouCangServiceImpl extends BaseDaoImpl<ShouCang> implements ShouCangService {
	@Resource
	private ShoucangDao shoucangDao;
	
	@Override
	public List<ShouCang> getDianyingIdListByUsername(String username) {
		return shoucangDao.getDianyingIdListByUsername(username);
	}

	@Override
	public List<ShouCang> getDianyingIdListByUserAndDianying(String username, String dianyingid) {
		return shoucangDao.getDianyingIdListByUserAndDianying(username, dianyingid);
	}

}
