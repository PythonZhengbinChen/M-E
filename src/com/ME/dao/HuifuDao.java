package com.ME.dao;

import java.util.List;

import com.ME.orm.Huifu;

public interface HuifuDao {
	public List<Huifu> getHuifuListByPinglunId(String pinglunid);
	public int getHuifuCountByPinglunId(String pinglunid);
}
