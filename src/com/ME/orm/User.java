package com.ME.orm;

import java.util.Date;

/**
 * 系统管理员表
 * @author 
 *
 */
public class User implements  java.io.Serializable{
	private Integer id;
	private String username;//账号
	private String password;//密码
	private Integer Admin;//是否是管理员
	private String name;
	private String phone;
	private Date createTime;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getAdmin() {
		return Admin;
	}
	public void setAdmin(Integer admin) {
		Admin = admin;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	
}
