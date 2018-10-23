package com.ME.action;

import java.util.Date;

import com.ME.orm.Huifu;

public class HuifuAction extends BaseAction<Huifu> {
	private String pinglunid;
	public String getPinglunid() {
		return pinglunid;
	}
	public void setPinglunid(String pinglunid) {
		this.pinglunid = pinglunid;
	}
	
	public String setHuifuInfo() {
		model.setCretime(new Date());
		huifuService.save(model);
		return "huifuSuccess";
	}
	
	
}
