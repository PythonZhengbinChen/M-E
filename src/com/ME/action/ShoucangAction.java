package com.ME.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.ME.orm.Dianyingneirong;
import com.ME.orm.ShouCang;
import com.opensymphony.xwork2.ActionContext;

public class ShoucangAction extends BaseAction<ShouCang> {
	private String dianyingid;
	private String isShoucang;
	private String username;
	public String getDianyingid() {
		return dianyingid;
	}
	public void setDianyingid(String dianyingid) {
		this.dianyingid = dianyingid;
	}
	public String getIsShoucang() {
		return isShoucang;
	}
	public void setIsShoucang(String isShoucang) {
		this.isShoucang = isShoucang;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}


	public String setDianyingShoucang() {
		model.setCreatetime(new Date());
		shoucangService.save(model);
		this.setDianyingid(model.getDianyingid());
		this.setIsShoucang("1");
		return "setShoucang";
	}
	
	public String quxiaoShoucang() {
		System.out.println(model.getDianyingid()+"====="+model.getUsername());
		this.setUsername(model.getUsername());
		ShouCang shoucang = shoucangService.getDianyingIdListByUserAndDianying(model.getUsername(), model.getDianyingid()).get(0);
		shoucangService.delete(shoucang);
		return "quxiaoSuccess";
	}
}
