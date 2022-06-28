package com.htabooks.vo;

import java.util.Date;
import java.util.Objects;

public class CartItem {
	private int no;
	private int userNo;
	private int bookNo;
	private String title;
	private String writer;
	private int paperBookPrice;
	private int bookPrice;
	private int discountRate;
	private Date createdDate;

	public CartItem(){}
	public CartItem(int no) {
		this.no = no;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getPaperBookPrice() {
		return paperBookPrice;
	}
	public void setPaperBookPrice(int paperBookPrice) {
		this.paperBookPrice = paperBookPrice;
	}
	public int getBookPrice() {
		return bookPrice;
	}
	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}
	public int getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}

	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Override
	public int hashCode() {
		return Objects.hash(bookNo);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CartItem other = (CartItem) obj;
		return bookNo == other.bookNo;
	}
}
