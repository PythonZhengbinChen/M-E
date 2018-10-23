package com.ME.action.admin;

import java.util.List;

import com.ME.action.BaseAction;
import com.ME.orm.Dianyingneirong;
import com.ME.orm.Pinglun;
import com.opensymphony.xwork2.ActionContext;

public class DianyingAction extends BaseAction<Dianyingneirong>{
	public String getDianyingListForManage() {
		List<Dianyingneirong> dianyingList = dianyingneirongService.findAll();
		ActionContext.getContext().put("dianyingList", dianyingList);
		return "dianyingManage";
	}
	
	public String dianyingChange() {
		String dianyingid = model.getId();
		ActionContext.getContext().put("dianying", dianyingneirongService.getDianyinListByDianyingId(dianyingid).get(0));
		ActionContext.getContext().put("isChange", 1);
		return "dianyingChange";
	}
	
	public String dianyingAdd() {
		ActionContext.getContext().put("isChange", 0);
		return "dianyingAdd";
	}
	
	public String deleteDianyingInfo() {
		Dianyingneirong dianying = dianyingneirongService.getDianyinListByDianyingId(model.getId()).get(0);
		dianyingneirongService.delete(dianying);
		return "deleteSuccess";
	}
	
	public String updateDianyingInfo() {
		dianyingneirongService.update(model);
		return "updateSuccess";
	}
	
	public String addDianyingInfo() {
		dianyingneirongService.save(model);
		return "updateSuccess";
	}
	
}
