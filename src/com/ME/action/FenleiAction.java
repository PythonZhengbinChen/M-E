package com.ME.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.ME.orm.Dianyingneirong;
import com.opensymphony.xwork2.ActionContext;

public class FenleiAction extends BaseAction<Dianyingneirong>{
	public String getDefaultDianyingList() {
		dianyingneirongService.updateDianyingPingfen();
		dianyingneirongService.updateDianyingZonghePaihang();
		List<Dianyingneirong> dianyingList = dianyingneirongService.getDianyinListByZonghefengshu();
		List<Dianyingneirong> benzhouDianyingList =dianyingneirongService .getDianyinListByBenzhoukoubei();
		List<Dianyingneirong> leixingList = dianyingneirongService.getDianyinLeixingList();
		List<Dianyingneirong> guojiaList = dianyingneirongService.getDianyinGuojiaList();
		ActionContext.getContext().put("dianyingList", dianyingList);
		ActionContext.getContext().put("benzhouDianyingList", benzhouDianyingList);
		ActionContext.getContext().put("leixingList", leixingList);
		ActionContext.getContext().put("guojiaList", guojiaList);
		ActionContext.getContext().put("leixingFlag", "全部类型");
		ActionContext.getContext().put("guojiaFlag", "全部地区");
		return "fenleiList";
	}
	
	public String getLeixingfDianyingList() {
		ActionContext ctx = ActionContext.getContext();       
		HttpServletRequest request = (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
		String leixing = request.getParameter("leixing");
		String guojia = request.getParameter("guojia");
		List<Dianyingneirong> dianyingList = dianyingneirongService.getDianyinListByCategory(leixing, guojia, 2);
		List<Dianyingneirong> benzhouDianyingList =dianyingneirongService .getDianyinListByBenzhoukoubei();
		List<Dianyingneirong> leixingList = dianyingneirongService.getDianyinLeixingList();
		List<Dianyingneirong> guojiaList = dianyingneirongService.getDianyinGuojiaList();
		ActionContext.getContext().put("dianyingList", dianyingList);
		ActionContext.getContext().put("benzhouDianyingList", benzhouDianyingList);
		ActionContext.getContext().put("leixingList", leixingList);
		ActionContext.getContext().put("guojiaList", guojiaList);
		ActionContext.getContext().put("leixingFlag", leixing);
		ActionContext.getContext().put("guojiaFlag", guojia);
		return "fenleiList";
	}
}
