package com.ME.dao;

import java.util.List;

import com.ME.orm.ShouCang;

public interface ShoucangDao {
	public List<ShouCang> getDianyingIdListByUsername(String username);
	public List<ShouCang> getDianyingIdListByUserAndDianying(String username,String dianyingid);
	
}
