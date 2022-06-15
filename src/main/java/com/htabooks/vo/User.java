package com.htabooks.vo;

import java.util.Date;

public class User {
		private int no;
		private String id;
		private String password;
		private String email;
		private Date birthDate;
		private String gender;
		private Date createdDate;
		private int cash;
		private String admin;
		private String reject;
		private int bookCount;
		
		public User() {}

		public int getNo() {
			return no;
		}

		public void setNo(int no) {
			this.no = no;
		}

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public Date getBirthDate() {
			return birthDate;
		}

		public void setBirthDate(Date birthDate) {
			this.birthDate = birthDate;
		}

		public String getGender() {
			return gender;
		}

		public void setGender(String gender) {
			this.gender = gender;
		}

		public Date getCreatedDate() {
			return createdDate;
		}

		public void setCreatedDate(Date createdDate) {
			this.createdDate = createdDate;
		}

		public int getCash() {
			return cash;
		}

		public void setCash(int cash) {
			this.cash = cash;
		}

		public String getAdmin() {
			return admin;
		}

		public void setAdmin(String admin) {
			this.admin = admin;
		}

		public String getReject() {
			return reject;
		}

		public void setReject(String reject) {
			this.reject = reject;
		}

		public int getBookCount() {
			return bookCount;
		}

		public void setBookCount(int bookCount) {
			this.bookCount = bookCount;
		}
		
		
		
		
}
