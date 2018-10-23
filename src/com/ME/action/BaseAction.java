package com.ME.action;

import java.lang.reflect.ParameterizedType;

import javax.annotation.Resource;

import com.ME.service.DianyingneirongService;
import com.ME.service.HuifuService;
import com.ME.service.PinglunService;
import com.ME.service.ShouCangService;
import com.ME.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public abstract class BaseAction<T> extends ActionSupport implements ModelDriven<T>{
	protected T model;
	public BaseAction(){
		try{
			ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
			Class<T> clazz = (Class<T>) pt.getActualTypeArguments()[0];
			model = clazz.newInstance();
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}
	//获取模型驱动
	public T getModel(){
		return model;
	}
	/**
	 * 注入所有的service
	 */
	//-----会员======//
	@Resource
	protected UserService userService;
	@Resource
	protected DianyingneirongService dianyingneirongService;
	@Resource
	protected PinglunService pinglunService;
	@Resource
	protected HuifuService huifuService;
	@Resource
	protected ShouCangService shoucangService;
}
