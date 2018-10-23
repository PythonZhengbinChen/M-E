package com.ME.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	public String getZhouDate() {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.add(Calendar.DATE, -7);
		Date d = calendar.getTime();
		String date = dateFormat.format(d);
		return date;
	}
	
	public String getDateStr() {
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		return dateFormat.format(new Date());
	}
	
	public String getDate() {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return dateFormat.format(new Date());
	}
	
	public String getRandomStr() {
		String chars = "ABCDEFGHIJKLMNOPQRTSUVWSYZ";
		char c1 = chars.charAt((int)(Math.random() * 26));
		char c2 = chars.charAt((int)(Math.random() * 26));
		char c3 = chars.charAt((int)(Math.random() * 26));
		char c4 = chars.charAt((int)(Math.random() * 26));
		String str = String.valueOf(c1) + String.valueOf(c2) + String.valueOf(c3) + String.valueOf(c4);
		return str;
	}
	
	public static void main(String[] args) {
		
	}
}
