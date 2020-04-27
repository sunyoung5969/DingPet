package com.dingpet.customers.p001.vo;

import lombok.Data;
import oracle.sql.BLOB;

@Data
public class Customers_P001_VO {
	
	private String member_id;
	private String member_type;
	private String member_pwd;
	private String member_name;
	private String member_nickname;
	private String member_email;
	private String member_contact;
	private String member_photo;
	private byte sex;
	private String date_of_birth;
	private String address;
	private String profession;
	private String active_hours;
//	private String question1;
	private String answer1;
//	private String question2;
	private String answer2;
//	private String question3;
	private String answer3;
	
	private String dog_id;
	private String dog_type;
	private String dog_name;
	private String dog_sex;
	private String dog_breed;
	private String activity_level;
	private String dog_size;
	private String dog_note;
	private String dog_photo;

}
