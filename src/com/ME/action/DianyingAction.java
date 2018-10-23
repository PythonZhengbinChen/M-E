package com.ME.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.ME.orm.Dianyingneirong;
import com.ME.orm.Pinglun;
import com.ME.orm.ShouCang;
import com.ME.orm.User;
import com.opensymphony.xwork2.ActionContext;

public class DianyingAction extends BaseAction<Dianyingneirong> {
	private String dianyingid;
	private String searchKey;
	private String isShoucang;
	
	public String getDianyingid() {
		return dianyingid;
	}
	public void setDianyingid(String dianyingid) {
		this.dianyingid = dianyingid;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getIsShoucang() {
		return isShoucang;
	}
	public void setIsShoucang(String isShoucang) {
		this.isShoucang = isShoucang;
	}
	
	public String getDianyingInfoById() {
		Dianyingneirong dianyingBean = dianyingneirongService.getDianyinListByDianyingId(dianyingid).get(0);
		ActionContext.getContext().put("dianyingBean", dianyingBean);
		List<Pinglun> pinglunList = pinglunService.getPinglunListByDianyinId(dianyingid);
		ActionContext.getContext().put("pinglunList", pinglunList);
		if(pinglunList != null ) {
			int pinglunCount = pinglunList.size();
			ActionContext.getContext().put("pinglunCount", pinglunCount);
			int star_1 = 0;
			int star_2 = 0;
			int star_3 = 0;
			int star_4 = 0;
			int star_5 = 0;
			for(Pinglun pinglun : pinglunList) {
				if(pinglun.getPingfen() == 1) {
					star_1 ++;
				}else if(pinglun.getPingfen() == 2) {
					star_2 ++;
				}else if(pinglun.getPingfen() == 3) {
					star_3 ++;
				}else if(pinglun.getPingfen() == 4) {
					star_4 ++;
				}else {
					star_5 ++;
				}
			}
			ActionContext.getContext().put("star1", (star_1 * 100)/pinglunCount);
			ActionContext.getContext().put("star2", (star_2 * 100)/pinglunCount);
			ActionContext.getContext().put("star3", (star_3 * 100)/pinglunCount);
			ActionContext.getContext().put("star4", (star_4 * 100)/pinglunCount);
			ActionContext.getContext().put("star5", (star_5 * 100)/pinglunCount);
		}else {
			ActionContext.getContext().put("pinglunCount", 0);
			ActionContext.getContext().put("star1", 0);
			ActionContext.getContext().put("star2", 0);
			ActionContext.getContext().put("star3", 0);
			ActionContext.getContext().put("star4", 0);
			ActionContext.getContext().put("star5", 0);
		}
		if(this.getIsShoucang() == null || this.getIsShoucang().equals("")) {
			User user = (User)ActionContext.getContext().getSession().get("loginer");
			if(user == null) {
				ActionContext.getContext().put("isShoucang", 0);
			}else {
				List<ShouCang> shoucangList = shoucangService.getDianyingIdListByUserAndDianying(user.getUsername(), this.getDianyingid());
				if(shoucangList != null&&shoucangList.size() != 0) {
					ActionContext.getContext().put("isShoucang", 1);
				}else {
					ActionContext.getContext().put("isShoucang", 0);
				}
			}
		}else {
			ActionContext.getContext().put("isShoucang", 1);
		}
		
		return "dianyingInfo";
	}
	
	public String search() {
		ActionContext.getContext().put("searchKey", this.getSearchKey());
		if(this.getSearchKey() == null || this.getSearchKey().equals("")) {
			ActionContext.getContext().put("dianyingListCount", 0);
			return "searchReturn";
		}
		List<Dianyingneirong> dianyingList = dianyingneirongService.getDianyinListByKeyword(this.getSearchKey());
		if(dianyingList != null) {
			ActionContext.getContext().put("dianyingList", dianyingList);
			ActionContext.getContext().put("dianyingListCount", dianyingList.size());
		}else {
			ActionContext.getContext().put("dianyingListCount", 0);
		}
		return "searchReturn";
	}
	
	
	
}
