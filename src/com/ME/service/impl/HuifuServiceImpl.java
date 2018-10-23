package com.ME.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ME.dao.HuifuDao;
import com.ME.daoImpl.BaseDaoImpl;
import com.ME.orm.Huifu;
import com.ME.service.HuifuService;

@Service
@Transactional
public class HuifuServiceImpl extends BaseDaoImpl<Huifu> implements HuifuService {
	@Resource
	private HuifuDao huifuDao;
	
	@Override
	public List<Huifu> getHuifuListByPinglunId(String pinglunid) {
		return huifuDao.getHuifuListByPinglunId(pinglunid);
	}

}
