package com.ME.orm;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class ShouCang {
	private Integer id;
	private String dianyingid;
	private String username;
	private Date createtime;
	@Id  
	@Column(name = "id", unique = true, nullable = false)  
	@GeneratedValue(strategy = GenerationType.AUTO) 
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDianyingid() {
		return dianyingid;
	}
	public void setDianyingid(String dianyingid) {
		this.dianyingid = dianyingid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
}
