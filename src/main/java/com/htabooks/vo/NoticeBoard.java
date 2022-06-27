package com.htabooks.vo;

import java.util.Date;

public class NoticeBoard {

	private int no;
	private String title;
	private String contents;
	private String deletedDate;
	private Date createdDate;
	
	public NoticeBoard() {}

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

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getDeletedDate() {
		return deletedDate;
	}

	public void setDeletedDate(String deletedDate) {
		this.deletedDate = deletedDate;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDateDate) {
		this.createdDate = createdDate;
	}
	
	
}
