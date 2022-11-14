package com.company.vo;

public class TeacherVO {
	private String teacher_code;
	private String teacher_name;
	private String class_name;
	private String class_price; //to_char로 형변환이 된 함수는 문자형으로 인식하므로 String으로 처리한다.
	private String teacher_regist_date;
	public String getTeacher_code() {
		return teacher_code;
	}
	public void setTeacher_code(String teacher_code) {
		this.teacher_code = teacher_code;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getClass_price() {
		return class_price;
	}
	public void setClass_price(String class_price) {
		this.class_price = class_price;
	}
	public String getTeacher_regist_date() {
		return teacher_regist_date;
	}
	public void setTeacher_regist_date(String teacher_regist_date) {
		this.teacher_regist_date = teacher_regist_date;
	}
	
	
	
}
