package com.ME.service;

import java.util.List;

import com.ME.dao.BaseDao;
import com.ME.orm.ShouCang;

public interface ShouCangService extends BaseDao<ShouCang> {
	public List<ShouCang> getDianyingIdListByUsername(String username);
	public List<ShouCang> getDianyingIdListByUserAndDianying(String username,String dianyingid);
}
