package com.htabooks.vo;

import java.util.Date;

public class CashHistory {

	private int no;
	private User user;
	private String reason;
	private int amount;
	private int currentAmount;
	private Date createdDate;
	private Date updatedDate;
	
	public CashHistory() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getCurrentAmount() {
		return currentAmount;
	}
	public void setCurrentAmount(int currentAmount) {
		this.currentAmount = currentAmount;
	}
	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	
	
}
