package com.ME.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.ME.orm.Dianyingneirong;
import com.ME.orm.Pinglun;
import com.ME.orm.ShouCang;
import com.ME.orm.User;
import com.opensymphony.xwork2.ActionContext;

public class UserAction extends BaseAction<User> {
	public String loginar() {
		return "loginar";
	}

	public String login() {
		if (userService.userLoginCheck(model.getUsername(), model.getPassword())) {
			User user = userService.getUserBeanByUsername(model.getUsername());
			System.out.println(user.getName()+"登录");
			ActionContext.getContext().getSession().put("loginer", user);
			Cookie cookie = new Cookie("loginer", user.getUsername());
			cookie.setMaxAge(60 * 60 * 24 * 365);
			ServletActionContext.getResponse().addCookie(cookie);
			return "newindex";

		} else {
			return "errorlogin";
		}
	}

	public String regar() {
		return "regar";
	}

	public String reg() {
		model.setCreateTime(new Date());
		model.setAdmin(0);
		userService.save(model);
		return "newindex";
	}
    /**
     * @return
     * @throws IOException
     */
	public String outLine(){
		 ActionContext.getContext().getSession().remove("loginer");
		 Cookie[] cookies = ServletActionContext.getRequest().getCookies();
	        if (cookies != null) {
	            for (Cookie cookie : cookies) {
	                if ("loginer".equals(cookie.getName())) {
	                    cookie.setValue("");
	                    cookie.setMaxAge(0);
	                    ServletActionContext.getResponse().addCookie(cookie);
	                }
	            }
	        }
		return "newindex";
	}
	
	public String yanzhengma() throws IOException {
		String code = (String) ActionContext.getContext().getSession().get("authCode");
		ActionContext.getContext().getSession().put("code", code);
		return null;
	}
	
	public String index(){
		List<Dianyingneirong> dianyingList = dianyingneirongService.getDianyinListOrderByPingfen();
		//ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
		ActionContext.getContext().put("dianyingList", dianyingList);
		ActionContext.getContext().put("pinglunList", pinglunService.getTopTenPinglunList());
		return "index";
	}
	
	
	public String userInfoPage() {
		//HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		//String username = (String) request.getAttribute("username");
		//System.out.println(model.getUsername()+"==========="+username);
		if(model.getUsername() == null || model.getUsername().equals("")) {
			return "loginar";
		}
		User user = userService.getUserBeanByUsername(model.getUsername());
		if(user == null) {
			return "loginar";
		}
		List<ShouCang> shoucangList = shoucangService.getDianyingIdListByUsername(user.getUsername());
		List<Dianyingneirong> dianyingList = new ArrayList<Dianyingneirong>();
		if(shoucangList != null) {
			dianyingList = new ArrayList<Dianyingneirong>();
			for(ShouCang shoucang: shoucangList) {
				List<Dianyingneirong> list = dianyingneirongService.getDianyinListByDianyingId(shoucang.getDianyingid());
				if(list != null) {
					Dianyingneirong dianying = list.get(0);
					if(dianying != null) {
						dianyingList.add(dianying);
					}
				}
			}
		}
		List<Pinglun> pinglunList = pinglunService.getPinglunListByUserName(user.getUsername());
		if(pinglunList != null) {
			ActionContext.getContext().put("pinglunList", pinglunList);
		}
		ActionContext.getContext().put("user", user);
		ActionContext.getContext().put("dianyingList", dianyingList);
		return "userInfo";
	}
	
}
