package com.htabooks.dao;

import java.sql.SQLException;
import java.util.List;

import com.htabooks.dto.BookDto;
import com.htabooks.helper.DaoHelper;
import com.htabooks.vo.Book;

public class BookDao {
	
	/**
	 * 싱글턴 패턴
	 */
	private static BookDao instance = new BookDao();
	private BookDao() {}
	public static BookDao getInstance() {
		return instance;
	}
	
	/**
	 * Dao 헬퍼 클래스
	 */
	private DaoHelper helper = DaoHelper.getInstance();

	/**
	 * 책 번호로 책 데이터를 검색
	 * @return 책 데이터
	 */
	public Book getBookByNo(int bookNo) throws SQLException{
		String sql = "SELECT BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, BOOK_PRICE, "
				+ "BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, IMG_FILE_NAME, BOOK_SALES_RATE "
				+ "FROM RIDI_BOOKS "
				+ "WHERE BOOK_NO = ? ";
		
		return helper.selectOne(sql, rs -> {
			Book book = new Book();
			book.setNo(rs.getInt("BOOK_NO"));
			book.setTitle(rs.getString("BOOK_TITLE"));
			book.setCategoryNo(rs.getInt("CATEGORY_NO"));
			book.setWriter(rs.getString("BOOK_WRITER"));
			book.setPaperBookPrice(rs.getInt("PAPER_BOOK_PRICE"));
			book.setBookPrice(rs.getInt("BOOK_PRICE"));
			book.setIntroduce(rs.getString("BOOK_INTRODUCE"));
			book.setCreatedDate(rs.getDate("BOOK_CREATED_DATE"));
			book.setUpdatedDate(rs.getDate("BOOK_UPDATED_DATE"));
			book.setDiscountRate(rs.getInt("DISCOUNT_RATE"));
			book.setImgFileName(rs.getString("IMG_FILE_NAME"));
			book.setBookSalesRate(rs.getInt("BOOK_SALES_RATE"));
			return book;
		}, bookNo);
		
	}
	
	/**
	 * 모든 책의 데이터를 반환
	 * @return 모든 책의 데이터
	 */
	public List<Book> getAllBooks() throws SQLException{
		String sql = "SELECT R.BOOK_NO, R.BOOK_TITLE, R.CATEGORY_NO, R.BOOK_WRITER, R.PAPER_BOOK_PRICE, R.BOOK_PRICE, "
				   + "		 R.BOOK_INTRODUCE, R.BOOK_CREATED_DATE, R.BOOK_UPDATED_DATE, R.DISCOUNT_RATE, R.IMG_FILE_NAME, "
				   + "		 R.BOOK_SALES_RATE "
				   + "FROM RIDI_BOOKS R ";

		return helper.selectList(sql, rs -> {
			Book book = new Book();
			book.setNo(rs.getInt("BOOK_NO"));
			book.setTitle(rs.getString("BOOK_TITLE"));
			book.setCategoryNo(rs.getInt("CATEGORY_NO"));
			book.setWriter(rs.getString("BOOK_WRITER"));
			book.setPaperBookPrice(rs.getInt("PAPER_BOOK_PRICE"));
			book.setBookPrice(rs.getInt("BOOK_PRICE"));
			book.setIntroduce(rs.getString("BOOK_INTRODUCE"));
			book.setCreatedDate(rs.getDate("BOOK_CREATED_DATE"));
			book.setUpdatedDate(rs.getDate("BOOK_UPDATED_DATE"));
			book.setDiscountRate(rs.getInt("DISCOUNT_RATE"));
			book.setImgFileName(rs.getString("IMG_FILE_NAME"));
			book.setBookSalesRate(rs.getInt("BOOK_SALES_RATE"));
			return book;
		});
		
	}
	/**
	 * 카테고리 번호(대분류)를 받아 해당하는 모든 책의 데이터를 반환
	 * @param categoryGroupNo 카테고리 그룹 번호
	 * @return 카테고리에 해당하는 모든 책의 데이터
	 * @throws SQLException
	 */
	public List<BookDto> getAllBooks(int categoryGroupNo) throws SQLException{
		String sql = "SELECT R.BOOK_NO, R.BOOK_TITLE, R.CATEGORY_NO, R.BOOK_WRITER, R.PAPER_BOOK_PRICE, "
				   + "R.BOOK_PRICE, R.BOOK_INTRODUCE, R.BOOK_CREATED_DATE, R.BOOK_UPDATED_DATE, R.DISCOUNT_RATE, "
				   + "R.IMG_FILE_NAME, R.BOOK_SALES_RATE, C.CATEGORY_GROUP_NO "
				   + "FROM RIDI_BOOKS R, RIDI_BOOK_CATEGORIES C "
				   + "WHERE C.CATEGORY_GROUP_NO = ? ";

		return helper.selectList(sql, rs -> {
			BookDto book = new BookDto();
			book.setNo(rs.getInt("BOOK_NO"));
			book.setTitle(rs.getString("BOOK_TITLE"));
			book.setCategoryNo(rs.getInt("CATEGORY_NO"));
			book.setWriter(rs.getString("BOOK_WRITER"));
			book.setPaperBookPrice(rs.getInt("PAPER_BOOK_PRICE"));
			book.setBookPrice(rs.getInt("BOOK_PRICE"));
			book.setIntroduce(rs.getString("BOOK_INTRODUCE"));
			book.setCreatedDate(rs.getDate("BOOK_CREATED_DATE"));
			book.setUpdatedDate(rs.getDate("BOOK_UPDATED_DATE"));
			book.setDiscountRate(rs.getInt("DISCOUNT_RATE"));
			book.setImgFileName(rs.getString("IMG_FILE_NAME"));
			book.setBookSalesRate(rs.getInt("BOOK_SALES_RATE"));
			book.setCategoryGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			return book;
		}, categoryGroupNo);
		
	}
	
	/**
	 * 카테고리 그룹 번호를 받아 카테고리별 판매량이 높은 책 10권의 데이터를 출력
	 * @param categoryGroupNo 카테고리 그룹 번호
	 * @return 판매량이 높은 책 10권의 데이터
	 * @throws SQLException
	 */
	public List<BookDto> getBestSellerBooks(int categoryGroupNo) throws SQLException{
		String sql = "SELECT R.BOOK_NO, R.BOOK_TITLE, R.CATEGORY_NO, R.BOOK_WRITER, R.PAPER_BOOK_PRICE, "
				+ "		 R.BOOK_PRICE, R.BOOK_INTRODUCE, R.BOOK_CREATED_DATE, R.BOOK_UPDATED_DATE, R.DISCOUNT_RATE, "
				+ "		 R.IMG_FILE_NAME, R.BOOK_SALES_RATE, C.CATEGORY_GROUP_NO "
				+ "FROM (SELECT BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, BOOK_PRICE, "
				+ "			   BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, IMG_FILE_NAME, BOOK_SALES_RATE "
				+ "      FROM RIDI_BOOKS "
				+ "      ORDER BY BOOK_SALES_RATE DESC) R, RIDI_BOOK_CATEGORIES C "
				+ "WHERE ROWNUM <= 10 "
				+ "AND CATEGORY_GROUP_NO = ? ";
		
		return helper.selectList(sql, rs -> {
			BookDto book = new BookDto();
			book.setNo(rs.getInt("BOOK_NO"));
			book.setTitle(rs.getString("BOOK_TITLE"));
			book.setCategoryNo(rs.getInt("CATEGORY_NO"));
			book.setWriter(rs.getString("BOOK_WRITER"));
			book.setPaperBookPrice(rs.getInt("PAPER_BOOK_PRICE"));
			book.setBookPrice(rs.getInt("BOOK_PRICE"));
			book.setIntroduce(rs.getString("BOOK_INTRODUCE"));
			book.setCreatedDate(rs.getDate("BOOK_CREATED_DATE"));
			book.setUpdatedDate(rs.getDate("BOOK_UPDATED_DATE"));
			book.setDiscountRate(rs.getInt("DISCOUNT_RATE"));
			book.setImgFileName(rs.getString("IMG_FILE_NAME"));
			book.setBookSalesRate(rs.getInt("BOOK_SALES_RATE"));
			book.setCategoryGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			return book;
		}, categoryGroupNo);
		
	}
	
	/**
	 * 카테고리 그룹 번호, 카테고리 번호를 받아 카테고리별 판매량이 높은 책 10권의 데이터를 출력
	 * @param categoryGroupNo 카테고리 그룹 번호
	 * @param categoryNo 카테고리 번호
	 * @return 판매량이 높은 책 10권의 데이터
	 * @throws SQLException
	 */
	public List<BookDto> getBestSellerBooks(int categoryGroupNo, int categoryNo) throws SQLException{
		String sql = "SELECT R.BOOK_NO, R.BOOK_TITLE, R.CATEGORY_NO, R.BOOK_WRITER, R.PAPER_BOOK_PRICE, "
				   + "		 R.BOOK_PRICE, R.BOOK_INTRODUCE, R.BOOK_CREATED_DATE, R.BOOK_UPDATED_DATE, R.DISCOUNT_RATE, "
				   + "		 R.IMG_FILE_NAME, R.BOOK_SALES_RATE, C.CATEGORY_GROUP_NO "
				   + "FROM (SELECT BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, BOOK_PRICE, "
				   + "			   BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, IMG_FILE_NAME, BOOK_SALES_RATE "
				   + "      FROM RIDI_BOOKS "
				   + "      ORDER BY BOOK_SALES_RATE DESC) R, RIDI_BOOK_CATEGORIES C "
				   + "WHERE ROWNUM <= 10 "
				   + "AND CATEGORY_GROUP_NO = ? "
				   + "AND CATEGORY_NO = ? ";
		
		return helper.selectList(sql, rs -> {
			BookDto book = new BookDto();
			book.setNo(rs.getInt("BOOK_NO"));
			book.setTitle(rs.getString("BOOK_TITLE"));
			book.setCategoryNo(rs.getInt("CATEGORY_NO"));
			book.setWriter(rs.getString("BOOK_WRITER"));
			book.setPaperBookPrice(rs.getInt("PAPER_BOOK_PRICE"));
			book.setBookPrice(rs.getInt("BOOK_PRICE"));
			book.setIntroduce(rs.getString("BOOK_INTRODUCE"));
			book.setCreatedDate(rs.getDate("BOOK_CREATED_DATE"));
			book.setUpdatedDate(rs.getDate("BOOK_UPDATED_DATE"));
			book.setDiscountRate(rs.getInt("DISCOUNT_RATE"));
			book.setImgFileName(rs.getString("IMG_FILE_NAME"));
			book.setBookSalesRate(rs.getInt("BOOK_SALES_RATE"));
			book.setCategoryGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			return book;
		}, categoryGroupNo, categoryNo);
		
	}
		
	/**
	 * 카테고리 그룹 번호를 받아 신간 10권의 데이터를 출력
	 * @param categoryGroupNo 카테고리 그룹 번호
	 * @return 신간 10권의 데이터
	 * @throws SQLException
	 */
	public List<BookDto> getBestNewBooks(int categoryGroupNo) throws SQLException{
		String sql = "SELECT R.BOOK_NO, R.BOOK_TITLE, R.CATEGORY_NO, R.BOOK_WRITER, R.PAPER_BOOK_PRICE, "
				   + "		 R.BOOK_PRICE, R.BOOK_INTRODUCE, R.BOOK_CREATED_DATE, R.BOOK_UPDATED_DATE, R.DISCOUNT_RATE, "
				   + "		 R.IMG_FILE_NAME, R.BOOK_SALES_RATE, C.CATEGORY_GROUP_NO "
				   + "FROM (SELECT BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, BOOK_PRICE, "
				   + "			   BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, IMG_FILE_NAME, BOOK_SALES_RATE "
				   + "      FROM RIDI_BOOKS "
				   + "      ORDER BY BOOK_CREATED_DATE DESC) R, RIDI_BOOK_CATEGORIES C "
				   + "WHERE ROWNUM <= 10 "
				   + "AND CATEGORY_GROUP_NO = ?";
		
		return helper.selectList(sql, rs -> {
			BookDto book = new BookDto();
			book.setNo(rs.getInt("BOOK_NO"));
			book.setTitle(rs.getString("BOOK_TITLE"));
			book.setCategoryNo(rs.getInt("CATEGORY_NO"));
			book.setWriter(rs.getString("BOOK_WRITER"));
			book.setPaperBookPrice(rs.getInt("PAPER_BOOK_PRICE"));
			book.setBookPrice(rs.getInt("BOOK_PRICE"));
			book.setIntroduce(rs.getString("BOOK_INTRODUCE"));
			book.setCreatedDate(rs.getDate("BOOK_CREATED_DATE"));
			book.setUpdatedDate(rs.getDate("BOOK_UPDATED_DATE"));
			book.setDiscountRate(rs.getInt("DISCOUNT_RATE"));
			book.setImgFileName(rs.getString("IMG_FILE_NAME"));
			book.setBookSalesRate(rs.getInt("BOOK_SALES_RATE"));
			book.setCategoryGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			return book;
		}, categoryGroupNo);
		
	}
	
	/**
	 * 카테고리 그룹 번호, 카테고리 번호를 받아 신간 10권의 데이터를 출력
	 * @param categoryGroupNo 카테고리 그룹 번호
	 * @param categoryNo 카테고리 번호
	 * @return 신간 10권의 데이터
	 * @throws SQLException
	 */
	public List<BookDto> getBestNewBooks(int categoryGroupNo, int categoryNo) throws SQLException{
		String sql = "SELECT R.BOOK_NO, R.BOOK_TITLE, R.CATEGORY_NO, R.BOOK_WRITER, R.PAPER_BOOK_PRICE, "
				+ "		 R.BOOK_PRICE, R.BOOK_INTRODUCE, R.BOOK_CREATED_DATE, R.BOOK_UPDATED_DATE, R.DISCOUNT_RATE, "
				+ "		 R.IMG_FILE_NAME, R.BOOK_SALES_RATE, C.CATEGORY_GROUP_NO "
				+ "FROM (SELECT BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, BOOK_PRICE, "
				+ "			   BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, IMG_FILE_NAME, BOOK_SALES_RATE "
				+ "      FROM RIDI_BOOKS "
				+ "      ORDER BY BOOK_CREATED_DATE DESC) R, RIDI_BOOK_CATEGORIES C "
				+ "WHERE ROWNUM <= 10 "
				+ "AND CATEGORY_GROUP_NO = ?"
				+ "AND CATEGORY_NO = ?";
		
		return helper.selectList(sql, rs -> {
			BookDto book = new BookDto();
			book.setNo(rs.getInt("BOOK_NO"));
			book.setTitle(rs.getString("BOOK_TITLE"));
			book.setCategoryNo(rs.getInt("CATEGORY_NO"));
			book.setWriter(rs.getString("BOOK_WRITER"));
			book.setPaperBookPrice(rs.getInt("PAPER_BOOK_PRICE"));
			book.setBookPrice(rs.getInt("BOOK_PRICE"));
			book.setIntroduce(rs.getString("BOOK_INTRODUCE"));
			book.setCreatedDate(rs.getDate("BOOK_CREATED_DATE"));
			book.setUpdatedDate(rs.getDate("BOOK_UPDATED_DATE"));
			book.setDiscountRate(rs.getInt("DISCOUNT_RATE"));
			book.setImgFileName(rs.getString("IMG_FILE_NAME"));
			book.setBookSalesRate(rs.getInt("BOOK_SALES_RATE"));
			book.setCategoryGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			return book;
		}, categoryGroupNo, categoryNo);
		
	}
	
	
}
