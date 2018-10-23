package com.ME.service;

import java.util.List;

import com.ME.dao.BaseDao;
import com.ME.orm.Huifu;

public interface HuifuService extends BaseDao<Huifu> {
	public List<Huifu> getHuifuListByPinglunId(String pinglunid);
}
