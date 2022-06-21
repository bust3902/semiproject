package com.htabooks.dto;

import java.util.Date;

public class BookDto {

	private int no;
	private String title;
	private int categoryNo;
	private String writer;
	private int paperBookPrice;
	private int bookPrice;
	private String introduce;
	private Date createdDate;
	private Date updatedDate;
	private int discountRate;
	private String imgFileName;
	private int bookSalesRate;
	private String bookPublisher;
	private String categoryName;
	private int categoryGroupNo;
	private String categoryGroupName;
	
	public BookDto() {}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public int getCategoryNo() {
		return categoryNo;
	}


	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
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


	public String getIntroduce() {
		return introduce;
	}


	public void setIntroduce(String introduce) {
		this.introduce = introduce;
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


	public int getDiscountRate() {
		return discountRate;
	}


	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}


	public String getImgFileName() {
		return imgFileName;
	}


	public void setImgFileName(String imgFileName) {
		this.imgFileName = imgFileName;
	}


	public int getBookSalesRate() {
		return bookSalesRate;
	}


	public void setBookSalesRate(int bookSalesRate) {
		this.bookSalesRate = bookSalesRate;
	}
	
	public String getBookPublisher() {
		return bookPublisher;
	}
	
	public void setBookPublisher(String bookPublisher) {
		this.bookPublisher = bookPublisher;
	}
	
	public String getCategoryName() {
		return categoryName;
	}
	
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	public int getCategoryGroupNo() {
		return categoryGroupNo;
	}
	
	public void setCategoryGroupNo(int categoryGroupNo) {
		this.categoryGroupNo = categoryGroupNo;
	}
	
	public String getCategoryGroupName() {
		return categoryGroupName;
	}
	
	public void setCategoryGroupName(String categoryGroupName) {
		this.categoryGroupName = categoryGroupName;
	}
	

}
