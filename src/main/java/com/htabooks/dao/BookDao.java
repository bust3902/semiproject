package com.htabooks.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.htabooks.vo.Book;

public class BookDao {

	private static BookDao instance = new BookDao();
	private BookDao() {}
	public static BookDao getInstance() {
		return instance;
	}

	/**
	 * 책 번호로 책 데이터를 검색
	 * @return 책 데이터
	 */
	public Book getBookByNo() throws SQLException{
		Book book = new Book();
		
		return book;
	}
	
	/**
	 * 모든 책의 데이터를 반환
	 * @return 모든 책의 데이터
	 */
	public List<Book> getAllBooks() throws SQLException{
		List<Book> bookList = new ArrayList<Book>();
		
		return bookList;
	}
	
	
}
