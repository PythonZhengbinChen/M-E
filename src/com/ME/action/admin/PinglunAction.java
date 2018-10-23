package com.ME.action.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.ME.action.BaseAction;
import com.ME.orm.Dianyingneirong;
import com.ME.orm.Huifu;
import com.ME.orm.Pinglun;
import com.opensymphony.xwork2.ActionContext;

public class PinglunAction extends BaseAction<Pinglun> {
	public String getPinglunList() {
		ActionContext.getContext().put("pinglunLists", pinglunService.getAllPinglunList());
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
	
	public String deletePinglunInfo() {
		Pinglun pinglun = pinglunService.getPinglunByPinglunid(model.getPinglunid());
		pinglunService.delete(pinglun);
		return "deleteSuccess";
	}
}
