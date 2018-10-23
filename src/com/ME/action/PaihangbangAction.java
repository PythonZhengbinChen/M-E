package com.ME.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.ME.orm.Dianyingneirong;
import com.ME.orm.User;
import com.opensymphony.xwork2.ActionContext;

public class PaihangbangAction extends BaseAction<Dianyingneirong>{
	
	public String getDianyingPaihangbangList() {
		dianyingneirongService.updateDianyingPingfen();
		dianyingneirongService.updateDianyingZonghePaihang();
		List<Dianyingneirong> dianyingList = dianyingneirongService.getDianyinListByZonghefengshu();
		List<Dianyingneirong> benzhouDianyingList = dianyingneirongService.getDianyinListByBenzhoukoubei();
		ActionContext.getContext().put("dianyingList", dianyingList);
		ActionContext.getContext().put("benzhouDianyingList", benzhouDianyingList);
//		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
//		HttpSession session = request.getSession();
//		String username = (String) session.getAttribute("username");
//		User user = (User) session.getAttribute("loginer");
//		System.out.println(username + "=======" + user.toString());
		return "paihangbangList";
	}
	
	
}
