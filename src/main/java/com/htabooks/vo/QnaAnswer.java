package com.htabooks.vo;

import java.util.Date;

public class QnaAnswer {

	private int no;
	private String name;
	private String contents;
	private String answer;
	private String answerCheck;
	private Date created;
	private int category;
	
	public QnaAnswer() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
	

	public String getAnswerCheck() {
		return answerCheck;
	}

	public void setAnswerCheck(String answerCheck) {
		this.answerCheck = answerCheck;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	
}
