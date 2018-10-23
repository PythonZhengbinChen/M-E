package com.ME.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.ME.orm.Dianyingneirong;
import com.ME.orm.Huifu;
import com.ME.orm.Pinglun;
import com.ME.util.DateUtil;
import com.opensymphony.xwork2.ActionContext;

public class PinglunAction extends BaseAction<Pinglun> {
	private String dianyignid;
	public String getDianyignid() {
		return dianyignid;
	}
	public void setDianyignid(String dianyignid) {
		this.dianyignid = dianyignid;
	}
	
	public String getPinglunList() {
		List<Dianyingneirong> benzhouDianyingList =dianyingneirongService .getDianyinListByBenzhoukoubei();
		ActionContext.getContext().put("benzhouDianyingList", benzhouDianyingList);
		List<Pinglun> pinglunList = pinglunService.getAllPinglunList();
		ServletActionContext.getContext().put("pinglun", pinglunList);
		return "pinglunList";
	}
	
	public String getPinglunInfo() {
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		String pinglunid =(String) request.getAttribute("pinglunid");
		Pinglun pinglunBean = pinglunService.getPinglunByPinglunid(pinglunid);
		List<Dianyingneirong> dianying = dianyingneirongService.getDianyinListByDianyingId(pinglunBean.getDianyingid());
		if(dianying == null) {
			pinglunBean.setDianyingName("");
		} else {
			pinglunBean.setDianyingName(dianying.get(0).getName());
		}
		List<Huifu> huifuList = huifuService.getHuifuListByPinglunId(pinglunid);
		ServletActionContext.getContext().put("pinglunBean", pinglunBean);
		ServletActionContext.getContext().put("huifu", huifuList);
		return "pinglunInfo";
	}
	
	public String setPinglunInfo() {
		String pinglunid = model.getDianyingid()+new DateUtil().getDateStr();
		model.setPinglunid(pinglunid);
		model.setCretime(new Date());
		pinglunService.save(model);
		this.setDianyignid(model.getDianyingid());
		return "pinglunSuccess";
	}
}
