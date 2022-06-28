package com.htabooks.dao;

import java.sql.SQLException;
import java.util.List;

import com.htabooks.dto.BookDto;
import com.htabooks.helper.DaoHelper;
import com.htabooks.vo.BookCategories;

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
	public BookDto getBookByNo(int bookNo) throws SQLException{
		String sql = "SELECT B.BOOK_NO, B.BOOK_TITLE, B.CATEGORY_NO, B.BOOK_WRITER, "
				   + "       B.PAPER_BOOK_PRICE, B.BOOK_PRICE, B.BOOK_INTRODUCE, B.BOOK_CREATED_DATE, "
				   + "       B.BOOK_UPDATED_DATE, B.DISCOUNT_RATE, B.IMG_FILE_NAME, B.BOOK_SALES_RATE, "
				   + "       B.BOOK_PUBLISHER, C.CATEGORY_NAME, C.CATEGORY_GROUP_NO, CT.CNAME "
				   + "FROM (SELECT C.CATEGORY_NO CNO, C.CATEGORY_NAME CNAME "
				   + "      FROM RIDI_BOOKS B, RIDI_BOOK_CATEGORIES C "
				   + "      WHERE B.CATEGORY_GROUP_NO = C.CATEGORY_NO "
				   + "      AND B.BOOK_NO = 1) CT, RIDI_BOOKS B, RIDI_BOOK_CATEGORIES C, RIDI_BOOK_CATEGORIES C1 "
				   + "WHERE B.CATEGORY_NO = C.CATEGORY_NO "
				   + "AND C1.CATEGORY_NO = CT.CNO "
				   + "AND B.BOOK_NO = ? ";
		
		return helper.selectOne(sql, rs -> {
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
			book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
			book.setCategoryNo(rs.getInt("CATEGORY_NO"));
			book.setCategoryName(rs.getString("CATEGORY_NAME"));
			book.setCategoryGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			book.setCategoryGroupName(rs.getString("CNAME"));
			return book;
		}, bookNo);
		
	}
	
	/**
	 * home.jsp 의 베스트셀러에 출력될 9권
	 * @return 판매량 높은 책 9권
	 * @throws SQLException
	 */
	public List<BookDto> getHomeBest() throws SQLException{
		String sql = "SELECT  BOOK_NO, BOOK_TITLE, BOOK_WRITER, IMG_FILE_NAME, BOOK_PUBLISHER "
				   + "FROM (SELECT BOOK_NO, BOOK_TITLE, BOOK_WRITER, IMG_FILE_NAME, BOOK_PUBLISHER "
				   + "      FROM RIDI_BOOKS "
				   + "      ORDER BY BOOK_SALES_RATE DESC) "
				   + "WHERE ROWNUM <= 9 ";
		
		return helper.selectList(sql, rs -> {
			BookDto book = new BookDto();
			book.setNo(rs.getInt("BOOK_NO"));
			book.setTitle(rs.getString("BOOK_TITLE"));
			book.setWriter(rs.getString("BOOK_WRITER"));
			book.setImgFileName(rs.getString("IMG_FILE_NAME"));
			book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
			return book;
		} );
		
	}
	
	/**
	 * home.jsp 의 화제의 신간에 출력될 9권
	 * @return 전체 서적중 created_date기준 최근 9권
	 * @throws SQLException
	 */
	public List<BookDto> getHomeNew() throws SQLException{
		String sql = "SELECT  BOOK_NO, BOOK_TITLE, BOOK_WRITER, IMG_FILE_NAME, BOOK_PUBLISHER "
				+ "FROM (SELECT BOOK_NO, BOOK_TITLE, BOOK_WRITER, IMG_FILE_NAME, BOOK_PUBLISHER, BOOK_SALES_RATE "
				+ "      FROM RIDI_BOOKS "
				+ "      ORDER BY BOOK_CREATED_DATE DESC) "
				+ "WHERE ROWNUM <=9 "
				+ "ORDER BY BOOK_SALES_RATE DESC";
		
		return helper.selectList(sql, rs -> {
			BookDto book = new BookDto();
			book.setNo(rs.getInt("BOOK_NO"));
			book.setTitle(rs.getString("BOOK_TITLE"));
			book.setWriter(rs.getString("BOOK_WRITER"));
			book.setImgFileName(rs.getString("IMG_FILE_NAME"));
			book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
			return book;
		} );
		
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
				   + "WHERE R.CATEGORY_NO = C.CATEGORY_NO "
				   + "AND CATEGORY_GROUP_NO = ? "
				   + "AND R.CATEGORY_NO = ? "
				   + "AND ROWNUM <= 10 ";
		
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
	 * 카테고리 그룹 번호를 받아 카테고리별 한주간 판매량이 높은 책의 데이터를 출력
	 * @param categoryGroupNo 카테고리 그룹 번호
	 * @return 한주간 판매량이 높은 책의 데이터
	 * @throws SQLException
	 */
	public List<BookDto> getWeekBestSeller(int categoryGroupNo) throws SQLException{
		String sql = "SELECT B.BOOK_NO, B.BOOK_TITLE, B.CATEGORY_NO, B.BOOK_WRITER, "
				   + "       B.PAPER_BOOK_PRICE, B.BOOK_PRICE, B.BOOK_INTRODUCE, B.BOOK_CREATED_DATE, "
				   + "       B.BOOK_UPDATED_DATE, B.DISCOUNT_RATE, B.IMG_FILE_NAME, B.BOOK_SALES_RATE, "
				   + "       B.BOOK_PUBLISHER, C.CATEGORY_NAME, C.CATEGORY_GROUP_NO "
				   + "FROM (SELECT BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, "
				   + "             BOOK_PRICE, BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, "
				   + "             IMG_FILE_NAME, BOOK_SALES_RATE, BOOK_PUBLISHER, CATEGORY_GROUP_NO "
				   + "             FROM RIDI_BOOKS) B, RIDI_BOOK_CATEGORIES C "
				   + "WHERE B.CATEGORY_NO = C.CATEGORY_NO "
				   + "AND B.CATEGORY_GROUP_NO = ? "
				   + "AND B.BOOK_CREATED_DATE BETWEEN TRUNC(SYSDATE) - 7 AND TRUNC(SYSDATE) "
				   + "ORDER BY B.BOOK_SALES_RATE DESC ";
		
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
	 * 카테고리 그룹 번호를 받아 카테고리별 한주간 판매량이 높은 책의 데이터를 출력
	 * @param categoryGroupNo 카테고리 그룹 번호
	 * @param beginIndex 사용자가 보는 페이지의 첫번째 문서
	 * @param endIndex 사용자가 보는 페이지의 마지막 문서
	 * @return 한주간 판매량이 높은 책의 데이터의 첫번째 ~ 마지막 데이터
	 * @throws SQLException
	 */
	public List<BookDto> getWeekBestSeller(int categoryGroupNo, int beginIndex, int endIndex) throws SQLException{
		String sql = "SELECT B.BOOK_NO, B.BOOK_TITLE, B.CATEGORY_NO, B.BOOK_WRITER, "
				   + "       B.PAPER_BOOK_PRICE, B.BOOK_PRICE, B.BOOK_INTRODUCE, B.BOOK_CREATED_DATE, "
				   + "       B.BOOK_UPDATED_DATE, B.DISCOUNT_RATE, B.IMG_FILE_NAME, B.BOOK_SALES_RATE, "
				   + "       B.BOOK_PUBLISHER, C.CATEGORY_NAME, C.CATEGORY_GROUP_NO "
				   + "FROM (SELECT ROW_NUMBER() OVER (ORDER BY BOOK_SALES_RATE DESC) ROW_NUMBER, "
				   + "			   BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, "
				   + "             BOOK_PRICE, BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, "
				   + "             IMG_FILE_NAME, BOOK_SALES_RATE, BOOK_PUBLISHER, CATEGORY_GROUP_NO "
				   + "      FROM RIDI_BOOKS "
				   + "		WHERE CATEGORY_GROUP_NO = ? "
				   + "		AND BOOK_CREATED_DATE BETWEEN TRUNC(SYSDATE) - 7 AND TRUNC(SYSDATE)) B, RIDI_BOOK_CATEGORIES C "
				   + "WHERE B.CATEGORY_NO = C.CATEGORY_NO "
				   + "AND ROW_NUMBER >= ? AND ROW_NUMBER <= ? ";
		
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
			book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
			book.setCategoryName(rs.getString("CATEGORY_NAME"));
			book.setCategoryGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			return book;
		}, categoryGroupNo, beginIndex, endIndex);
		
	}	
	/**
	 * 페이징처리 길이 체크용
	 * @param categoryGroupNo 카테고리 그룹 번호
	 * @return 한주간 판매량이 높은 책의 데이터
	 * @throws SQLException
	 */
	public List<BookDto> getWeekBestSellerCnt(int categoryGroupNo) throws SQLException{
		String sql = "SELECT B.BOOK_NO "
				   + "FROM (SELECT ROW_NUMBER() OVER (ORDER BY BOOK_SALES_RATE DESC) ROW_NUMBER, "
				   + "			   BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, "
				   + "             BOOK_PRICE, BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, "
				   + "             IMG_FILE_NAME, BOOK_SALES_RATE, BOOK_PUBLISHER, CATEGORY_GROUP_NO "
				   + "      FROM RIDI_BOOKS "
				   + "		WHERE CATEGORY_GROUP_NO = ? "
				   + "		AND BOOK_CREATED_DATE BETWEEN TRUNC(SYSDATE) - 7 AND TRUNC(SYSDATE)) B, RIDI_BOOK_CATEGORIES C "
				   + "WHERE B.CATEGORY_NO = C.CATEGORY_NO ";
		
		return helper.selectList(sql, rs -> {
			BookDto book = new BookDto();
			book.setNo(rs.getInt("BOOK_NO"));
			return book;
		}, categoryGroupNo);
		
	}
	
	/**
	 * 카테고리 그룹 번호를 받아 카테고리별 한달간 판매량이 높은 책의 데이터를 출력
	 * @param categoryGroupNo 카테고리 그룹 번호
	 * @param beginIndex 사용자가 보는 페이지의 첫번째 문서
	 * @param endIndex 사용자가 보는 페이지의 마지막 문서
	 * @return 한달간 판매량이 높은 책의 데이터
	 * @throws SQLException
	 */
	public List<BookDto> getMonthBestSeller(int categoryGroupNo, int beginIndex, int endIndex) throws SQLException{
		String sql = "SELECT B.BOOK_NO, B.BOOK_TITLE, B.CATEGORY_NO, B.BOOK_WRITER, "
				   + "       B.PAPER_BOOK_PRICE, B.BOOK_PRICE, B.BOOK_INTRODUCE, B.BOOK_CREATED_DATE, "
				   + "       B.BOOK_UPDATED_DATE, B.DISCOUNT_RATE, B.IMG_FILE_NAME, B.BOOK_SALES_RATE, "
				   + "       B.BOOK_PUBLISHER, C.CATEGORY_NAME, C.CATEGORY_GROUP_NO "
				   + "FROM (SELECT ROW_NUMBER() OVER (ORDER BY BOOK_SALES_RATE DESC) ROW_NUMBER, "
				   + "			   BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, "
				   + "             BOOK_PRICE, BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, "
				   + "             IMG_FILE_NAME, BOOK_SALES_RATE, BOOK_PUBLISHER, CATEGORY_GROUP_NO "
				   + "      FROM RIDI_BOOKS "
				   + "		WHERE CATEGORY_GROUP_NO = ? "
				   + "		AND BOOK_CREATED_DATE BETWEEN TRUNC(SYSDATE) - 30 AND TRUNC(SYSDATE)) B, RIDI_BOOK_CATEGORIES C "
				   + "WHERE B.CATEGORY_NO = C.CATEGORY_NO "
				   + "AND ROW_NUMBER >= ? AND ROW_NUMBER <= ? ";
		
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
			book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
			book.setCategoryName(rs.getString("CATEGORY_NAME"));
			book.setCategoryGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			return book;
		}, categoryGroupNo, beginIndex, endIndex);
		
	}
	/**
	 * 페이징처리 길이 체크용
	 * @param categoryGroupNo 카테고리 그룹 번호
	 * @return 한달간 판매량이 높은 책의 데이터
	 * @throws SQLException
	 */
	public List<BookDto> getMonthBestSellerCnt(int categoryGroupNo) throws SQLException{
		String sql = "SELECT B.BOOK_NO "
				   + "FROM (SELECT ROW_NUMBER() OVER (ORDER BY BOOK_SALES_RATE DESC) ROW_NUMBER, "
				   + "			   BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, "
				   + "             BOOK_PRICE, BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, "
				   + "             IMG_FILE_NAME, BOOK_SALES_RATE, BOOK_PUBLISHER, CATEGORY_GROUP_NO "
				   + "      FROM RIDI_BOOKS "
				   + "		WHERE BOOK_CREATED_DATE BETWEEN TRUNC(SYSDATE) - 30 AND TRUNC(SYSDATE)"
				   + "		AND CATEGORY_GROUP_NO = ?) B, RIDI_BOOK_CATEGORIES C "
				   + "WHERE B.CATEGORY_NO = C.CATEGORY_NO ";
		
		return helper.selectList(sql, rs -> {
			BookDto book = new BookDto();
			book.setNo(rs.getInt("BOOK_NO"));
			return book;
		}, categoryGroupNo);
		
	}
	
	/**
	 * 카테고리 그룹 번호를 받아 카테고리별 판매량이 천권 이상인 책의 데이터를 출력
	 * @param categoryGroupNo 카테고리 그룹 번호
	 * @param beginIndex 사용자가 보는 페이지의 첫번째 문서
	 * @param endIndex 사용자가 보는 페이지의 마지막 문서
	 * @return 한달간 판매량이 높은 책의 데이터
	 * @throws SQLException
	 */
	public List<BookDto> getSteadySeller(int categoryGroupNo, int beginIndex, int endIndex) throws SQLException{
		String sql = "SELECT B.BOOK_NO, B.BOOK_TITLE, B.CATEGORY_NO, B.BOOK_WRITER, "
				   + "       B.PAPER_BOOK_PRICE, B.BOOK_PRICE, B.BOOK_INTRODUCE, B.BOOK_CREATED_DATE, "
				   + "       B.BOOK_UPDATED_DATE, B.DISCOUNT_RATE, B.IMG_FILE_NAME, B.BOOK_SALES_RATE, "
				   + "       B.BOOK_PUBLISHER, C.CATEGORY_NAME, C.CATEGORY_GROUP_NO "
				   + "FROM (SELECT ROW_NUMBER() OVER (ORDER BY BOOK_SALES_RATE DESC) ROW_NUMBER, "
				   + "		       BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, "
				   + "             BOOK_PRICE, BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, "
				   + "             IMG_FILE_NAME, BOOK_SALES_RATE, BOOK_PUBLISHER, CATEGORY_GROUP_NO "
				   + "      FROM RIDI_BOOKS "
				   + "		WHERE CATEGORY_GROUP_NO = ? "
				   + "		AND BOOK_SALES_RATE > 1000) B, RIDI_BOOK_CATEGORIES C "
				   + "WHERE B.CATEGORY_NO = C.CATEGORY_NO "
				   + "AND ROW_NUMBER >= ? AND ROW_NUMBER <= ? ";
		
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
			book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
			book.setCategoryName(rs.getString("CATEGORY_NAME"));
			book.setCategoryGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			return book;
		}, categoryGroupNo, beginIndex, endIndex);
		
	}
	/**
	 * getSteadySeller 페이징처리 길이 체크용
	 * @param categoryGroupNo 카테고리 그룹 번호
	 * @return 기간에 상관없이 판매량이 높은 책
	 * @throws SQLException
	 */
	public List<BookDto> getSteadySellerCnt(int categoryGroupNo) throws SQLException{
		String sql = "SELECT BOOK_NO "
				   + "FROM RIDI_BOOKS "
				   + "WHERE CATEGORY_GROUP_NO = ? "
				   + "AND BOOK_SALES_RATE > 1000 ";
		
		return helper.selectList(sql, rs -> {
			BookDto book = new BookDto();
			book.setNo(rs.getInt("BOOK_NO"));
			return book;
		}, categoryGroupNo);
		
	}
	
	/**
	 * 카테고리 그룹 번호를 받아 신간 10권의 데이터를 출력
	 * @param categoryGroupNo 카테고리 그룹 번호
	 * @return 신간 10권의 데이터
	 * @throws SQLException
	 */
	public List<BookDto> getNewBooks(int categoryGroupNo) throws SQLException{
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
	 * 카테고리 그룹 번호를 받아 신간 10권의 데이터를 출력
	 * @param categoryGroupNo 카테고리 그룹 번호
	 * @return 신간 10권의 데이터
	 * @throws SQLException
	 */
	public List<BookDto> getNewBestBooks(int categoryGroupNo) throws SQLException{
		String sql = "SELECT R.BOOK_NO, R.BOOK_TITLE, R.CATEGORY_NO, R.BOOK_WRITER, R.PAPER_BOOK_PRICE, "
				+ "		 R.BOOK_PRICE, R.BOOK_INTRODUCE, R.BOOK_CREATED_DATE, R.BOOK_UPDATED_DATE, R.DISCOUNT_RATE, "
				+ "		 R.IMG_FILE_NAME, R.BOOK_SALES_RATE, R.BOOK_PUBLISHER, C.CATEGORY_NAME, C.CATEGORY_GROUP_NO "
				+ "FROM (SELECT BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, BOOK_PRICE, "
				+ "			   BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, IMG_FILE_NAME, BOOK_SALES_RATE, BOOK_PUBLISHER "
				+ "      FROM RIDI_BOOKS "
				+ "      ORDER BY BOOK_CREATED_DATE DESC) R, RIDI_BOOK_CATEGORIES C "
				+ "WHERE ROWNUM <= 10 "
				+ "AND R.CATEGORY_NO = C.CATEGORY_NO "
				+ "AND CATEGORY_GROUP_NO = ? "
				+ "ORDER BY BOOK_SALES_RATE DESC";
		
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
			book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
			book.setCategoryName(rs.getString("CATEGORY_NAME"));
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
	 * 카테고리 그룹 번호, 카테고리 번호를 받아 신간 10권의 데이터를 출력
	 * @param categoryGroupNo 카테고리 그룹 번호
	 * @param categoryNo 카테고리 번호
	 * @return 신간 10권의 데이터
	 * @throws SQLException
	 */
	public List<BookDto> getNewBooks(int categoryGroupNo, int categoryNo) throws SQLException{
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
	
	/**
	 * 책의 총 권수를 반환(페이징 기능용).
	 * @return RIDI_BOOKS 테이블의 책 권수.
	 * @throws SQLException
	 */
	public int getTotalRowsCount() throws SQLException {
		String sql = "SELECT COUNT(*) AS CNT FROM RIDI_BOOKS ";
		
		return helper.selectOne(sql, rs -> {
			return rs.getInt("CNT");
		});
	}
	
	/**
	 * 책 전체 리스트 판매량순 출력. 페이징기능 추가.
	 * @param beginIndex 사용자가 보는 페이지의 첫번째 문서.
	 * @param endIndex 사용자가 보는 페이지의 마지막 문서.
	 * @return 페이지에 표기되는 첫번째 ~ 마지막 데이터.
	 * @throws SQLException
	 */
	public List<BookDto> getSortBestAllBooks(int categoryGroupNo, int beginIndex, int endIndex) throws SQLException {
		String sql = "SELECT B.BOOK_NO, B.BOOK_TITLE, B.CATEGORY_NO, B.BOOK_WRITER, "
				   + "       B.PAPER_BOOK_PRICE, B.BOOK_PRICE, B.BOOK_INTRODUCE, B.BOOK_CREATED_DATE, "
				   + "       B.BOOK_UPDATED_DATE, B.DISCOUNT_RATE, B.IMG_FILE_NAME, B.BOOK_SALES_RATE, "
				   + "       B.BOOK_PUBLISHER, C.CATEGORY_NAME, C.CATEGORY_GROUP_NO "
				   + "FROM (SELECT ROW_NUMBER() OVER (ORDER BY BOOK_SALES_RATE DESC) ROW_NUMBER, "
				   + "      BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, "
				   + "      BOOK_PRICE, BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, "
				   + "      IMG_FILE_NAME, BOOK_SALES_RATE, BOOK_PUBLISHER, CATEGORY_GROUP_NO "
				   + "      FROM RIDI_BOOKS) B, RIDI_BOOK_CATEGORIES C "
				   + "WHERE C.CATEGORY_GROUP_NO = ? "
				   + "AND B.CATEGORY_NO = C.CATEGORY_NO "
				   + "AND ROW_NUMBER >= ? AND ROW_NUMBER <= ? ";
		
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
			book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
			book.setCategoryName(rs.getString("CATEGORY_NAME"));
			book.setCategoryGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			return book;
		}, categoryGroupNo, beginIndex, endIndex);
		
	}
	
	/**
	 * 책 전체 리스트 최신입고순 출력. 페이징기능 추가.
	 * @param beginIndex 책 전체 리스트의 첫번째 문서.
	 * @param endIndex 책 전체 리스트의 마지막 문서.
	 * @return 최신 입고순의 책 전체 리스트.
	 * @throws SQLException
	 */
	public List<BookDto> getSortInsertAllBooks(int categoryGroupNo, int beginIndex, int endIndex) throws SQLException {
		String sql = "SELECT B.BOOK_NO, B.BOOK_TITLE, B.CATEGORY_NO, B.BOOK_WRITER, "
				+ "       B.PAPER_BOOK_PRICE, B.BOOK_PRICE, B.BOOK_INTRODUCE, B.BOOK_CREATED_DATE, "
				+ "       B.BOOK_UPDATED_DATE, B.DISCOUNT_RATE, B.IMG_FILE_NAME, B.BOOK_SALES_RATE, "
				+ "       B.BOOK_PUBLISHER, C.CATEGORY_NAME, C.CATEGORY_GROUP_NO "
				+ "FROM (SELECT ROW_NUMBER() OVER (ORDER BY BOOK_CREATED_DATE DESC) ROW_NUMBER, "
				+ "      BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, "
				+ "      BOOK_PRICE, BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, "
				+ "      IMG_FILE_NAME, BOOK_SALES_RATE, BOOK_PUBLISHER, CATEGORY_GROUP_NO "
				+ "      FROM RIDI_BOOKS) B, RIDI_BOOK_CATEGORIES C "
				+ "WHERE C.CATEGORY_GROUP_NO = ? "
				+ "AND B.CATEGORY_NO = C.CATEGORY_NO "
				+ "AND ROW_NUMBER >= ? AND ROW_NUMBER <= ? ";
		
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
			book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
			book.setCategoryName(rs.getString("CATEGORY_NAME"));
			book.setCategoryGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			return book;
		}, categoryGroupNo, beginIndex, endIndex);
		
	}
	/**
	 * 책 전체리스트 도서번호순으로 출력 페이징기능
	 * @param beginIndex
	 * @param endIndex
	 * @return
	 * @throws SQLException
	 */
	public List<BookDto> getAllBooks(int beginIndex, int endIndex)throws SQLException{
		
		String sql = "SELECT B.BOOK_NO, B.BOOK_TITLE, B.CATEGORY_NO, B.BOOK_WRITER, "
				+ "       B.PAPER_BOOK_PRICE, B.BOOK_PRICE, B.BOOK_INTRODUCE, B.BOOK_CREATED_DATE, "
				+ "       B.BOOK_UPDATED_DATE, B.DISCOUNT_RATE, B.IMG_FILE_NAME, B.BOOK_SALES_RATE, "
				+ "       B.BOOK_PUBLISHER, C.CATEGORY_NAME, C.CATEGORY_GROUP_NO "
				+ "FROM (SELECT ROW_NUMBER() OVER (ORDER BY BOOK_NO ASC) ROW_NUMBER, "
				+ "      BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, "
				+ "      BOOK_PRICE, BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, "
				+ "      IMG_FILE_NAME, BOOK_SALES_RATE, BOOK_PUBLISHER, CATEGORY_GROUP_NO "
				+ "      FROM RIDI_BOOKS) B, RIDI_BOOK_CATEGORIES C "
				+ "WHERE B.CATEGORY_NO = C.CATEGORY_NO "
				+ "AND ROW_NUMBER >= ? AND ROW_NUMBER <= ? "
				+ "ORDER BY BOOK_NO ASC ";			   
		
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
			book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
			book.setCategoryGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			return book;
		}, beginIndex,endIndex);
	}
	public List<BookDto> getAllBooks(int beginIndex, int endIndex, String keyword)throws SQLException{
		
		String sql = "SELECT B.BOOK_NO, B.BOOK_TITLE, B.CATEGORY_NO, B.BOOK_WRITER, "
				+ "       B.PAPER_BOOK_PRICE, B.BOOK_PRICE, B.BOOK_INTRODUCE, B.BOOK_CREATED_DATE, "
				+ "       B.BOOK_UPDATED_DATE, B.DISCOUNT_RATE, B.IMG_FILE_NAME, B.BOOK_SALES_RATE, "
				+ "       B.BOOK_PUBLISHER, C.CATEGORY_NAME, C.CATEGORY_GROUP_NO "
				+ "FROM (SELECT ROW_NUMBER() OVER (ORDER BY BOOK_NO ASC) ROW_NUMBER, "
				+ "      BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, "
				+ "      BOOK_PRICE, BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, "
				+ "      IMG_FILE_NAME, BOOK_SALES_RATE, BOOK_PUBLISHER, CATEGORY_GROUP_NO "
				+ "      FROM RIDI_BOOKS) B, RIDI_BOOK_CATEGORIES C "
				+ "WHERE BOOK_TITLE LIKE '%' || ? || '%' "
				+ "AND B.CATEGORY_NO = C.CATEGORY_NO "
				+ "AND ROW_NUMBER >= ? AND ROW_NUMBER <= ? "
				+ "ORDER BY BOOK_NO ASC ";
		
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
			book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
			book.setCategoryGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			return book;
		}, keyword, beginIndex, endIndex);
	}
	
	/**
	 * 키워드를 입력받아 책 데이터를 검색.
	 * @param keyword 사용자가 입력한 키워드.
	 * @param beginIndex 검색된 문서의 첫 페이지.
	 * @param endIndex 검색된 문서의 마지막 페이지.
	 * @return 키워드에 맞는 검색된 데이터를 판매량순으로 출력.
	 * @throws SQLException
	 */
	public List<BookDto> getSearchKeywordPopularity(String keyword, int beginIndex, int endIndex) throws SQLException {
		String sql = "SELECT B.BOOK_NO, B.BOOK_TITLE, B.CATEGORY_NO, B.BOOK_WRITER, "
				   + "       B.PAPER_BOOK_PRICE, B.BOOK_PRICE, B.BOOK_INTRODUCE, B.BOOK_CREATED_DATE, "
				   + "       B.BOOK_UPDATED_DATE, B.DISCOUNT_RATE, B.IMG_FILE_NAME, B.BOOK_SALES_RATE, "
				   + "       B.BOOK_PUBLISHER, C.CATEGORY_NAME, C.CATEGORY_GROUP_NO "
				   + "FROM (SELECT ROW_NUMBER() OVER (ORDER BY BOOK_SALES_RATE DESC) ROW_NUMBER, "
				   + "		       BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, "
				   + "             BOOK_PRICE, BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, "
				   + "             IMG_FILE_NAME, BOOK_SALES_RATE, BOOK_PUBLISHER, CATEGORY_GROUP_NO "
				   + "             FROM RIDI_BOOKS "
				   + "             WHERE (BOOK_TITLE || BOOK_WRITER || BOOK_PUBLISHER) LIKE ('%' || ? || '%')) B, RIDI_BOOK_CATEGORIES C "
				   + "WHERE B.CATEGORY_NO = C.CATEGORY_NO "
				   + "AND ROW_NUMBER >= ? AND ROW_NUMBER <= ? ";
		
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
			book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
			book.setCategoryName(rs.getString("CATEGORY_NAME"));
			book.setCategoryGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			return book;
		}, keyword, beginIndex, endIndex);
		
	}
	
	/**
	 * 키워드를 입력받아 책 데이터를 검색.
	 * @param keyword 사용자가 입력한 키워드.
	 * @param beginIndex 검색된 문서의 첫 페이지.
	 * @param endIndex 검색된 문서의 마지막 페이지.
	 * @return 키워드에 맞는 검색된 데이터를 입고날짜 순으로 출력.
	 * @throws SQLException
	 */
	public List<BookDto> getSearchKeywordNew(String keyword, int beginIndex, int endIndex) throws SQLException {
		String sql = "SELECT B.BOOK_NO, B.BOOK_TITLE, B.CATEGORY_NO, B.BOOK_WRITER, "
				   + "       B.PAPER_BOOK_PRICE, B.BOOK_PRICE, B.BOOK_INTRODUCE, B.BOOK_CREATED_DATE, "
				   + "       B.BOOK_UPDATED_DATE, B.DISCOUNT_RATE, B.IMG_FILE_NAME, B.BOOK_SALES_RATE, "
				   + "       B.BOOK_PUBLISHER, C.CATEGORY_NAME, C.CATEGORY_GROUP_NO "
				   + "FROM (SELECT ROW_NUMBER() OVER (ORDER BY BOOK_CREATED_DATE DESC) ROW_NUMBER, "
				   + "		        BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, "
				   + "              BOOK_PRICE, BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, "
				   + "              IMG_FILE_NAME, BOOK_SALES_RATE, BOOK_PUBLISHER, CATEGORY_GROUP_NO "
				   + "      FROM RIDI_BOOKS "
				   + "		WHERE (BOOK_TITLE || BOOK_WRITER || BOOK_PUBLISHER) LIKE ('%' || ? || '%')) B, RIDI_BOOK_CATEGORIES C "
				   + "WHERE B.CATEGORY_NO = C.CATEGORY_NO "
				   + "AND ROW_NUMBER >= ? AND ROW_NUMBER <= ? ";
		
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
			book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
			book.setCategoryName(rs.getString("CATEGORY_NAME"));
			book.setCategoryGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			return book;
		}, keyword, beginIndex, endIndex);
		
	}
	
	/**
	 * 키워드를 입력받아 책 데이터를 검색.
	 * @param keyword 사용자가 입력한 키워드.
	 * @param beginIndex 검색된 문서의 첫 페이지.
	 * @param endIndex 검색된 문서의 마지막 페이지.
	 * @return 키워드에 맞는 검색된 데이터를 낮은가격 순으로 출력.
	 * @throws SQLException
	 */
	public List<BookDto> getSearchKeywordRowPrice(String keyword, int beginIndex, int endIndex) throws SQLException {
		String sql = "SELECT B.BOOK_NO, B.BOOK_TITLE, B.CATEGORY_NO, B.BOOK_WRITER, "
				+ "       B.PAPER_BOOK_PRICE, B.BOOK_PRICE, B.BOOK_INTRODUCE, B.BOOK_CREATED_DATE, "
				+ "       B.BOOK_UPDATED_DATE, B.DISCOUNT_RATE, B.IMG_FILE_NAME, B.BOOK_SALES_RATE, "
				+ "       B.BOOK_PUBLISHER, C.CATEGORY_NAME, C.CATEGORY_GROUP_NO "
				+ "FROM (SELECT ROW_NUMBER() OVER (ORDER BY BOOK_PRICE ASC) ROW_NUMBER, "
				+ "		        BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, "
				+ "             BOOK_PRICE, BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, "
				+ "             IMG_FILE_NAME, BOOK_SALES_RATE, BOOK_PUBLISHER, CATEGORY_GROUP_NO "
				+ "             FROM RIDI_BOOKS "
				+ "				WHERE (BOOK_TITLE || BOOK_WRITER || BOOK_PUBLISHER) LIKE ('%' || ? || '%')) B, RIDI_BOOK_CATEGORIES C "
				+ "WHERE B.CATEGORY_NO = C.CATEGORY_NO "
				+ "AND ROW_NUMBER >= ? AND ROW_NUMBER <= ? ";
		
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
			book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
			book.setCategoryName(rs.getString("CATEGORY_NAME"));
			book.setCategoryGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			return book;
		}, keyword, beginIndex, endIndex);
		
	}
	
	/**
	 * 검색페이지 페이징용 데이터 갯수 체크용.
	 * @param keyword 사용자가 입력한 키워드.
	 * @return 키워드에 맞는 검색된 데이터.
	 * @throws SQLException
	 */
	public List<BookDto> getSearchKeywordCnt(String keyword) throws SQLException {
		String sql = "SELECT BOOK_NO "
				   + "FROM RIDI_BOOKS "
				   + "WHERE (BOOK_TITLE || BOOK_WRITER || BOOK_PUBLISHER) LIKE ('%' || ? || '%') ";
		
		return helper.selectList(sql, rs -> {
			BookDto book = new BookDto();
			book.setNo(rs.getInt("BOOK_NO"));
			return book;
		}, keyword);
		
	}

	// 서브페이지 
	
	/**
	 * 서브카테고리 상품페이지 카테고리명 출력용.
	 * @param categoryNo 카테고리 번호
	 * @return 카테고리명.
	 * @throws SQLException
	 */
	public BookCategories getCategoryName(int categoryNo) throws SQLException {
		String sql = "SELECT CATEGORY_NO, CATEGORY_NAME, CATEGORY_GROUP_NO "
				   + "FROM RIDI_BOOK_CATEGORIES "
				   + "WHERE CATEGORY_NO = ? ";
		
		return helper.selectOne(sql, rs -> {
			BookCategories category = new BookCategories();
			category.setNo(rs.getInt("CATEGORY_NO"));
			category.setName(rs.getString("CATEGORY_NAME"));
			category.setGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			return category;
		}, categoryNo);
		
	}
		
	/**
	 * 카테고리 번호를 받아 서브카테고리 신간 10권의 데이터를 출력
	 * @param categoryNo 카테고리 번호
	 * @return 서브카테고리 신간 10권의 데이터
	 * @throws SQLException
	 */
	public List<BookDto> getSubNewBooks(int categoryNo) throws SQLException{
		String sql = "SELECT R.BOOK_NO, R.BOOK_TITLE, R.CATEGORY_NO, R.BOOK_WRITER, R.PAPER_BOOK_PRICE, "
				+ "		 R.BOOK_PRICE, R.BOOK_INTRODUCE, R.BOOK_CREATED_DATE, R.BOOK_UPDATED_DATE, R.DISCOUNT_RATE, "
				+ "		 R.IMG_FILE_NAME, R.BOOK_SALES_RATE, C.CATEGORY_GROUP_NO "
				+ "FROM (SELECT BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, BOOK_PRICE, "
				+ "			   BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, IMG_FILE_NAME, BOOK_SALES_RATE "
				+ "      FROM RIDI_BOOKS "
				+ "      ORDER BY BOOK_CREATED_DATE DESC) R, RIDI_BOOK_CATEGORIES C "
				+ "WHERE ROWNUM <= 10 "
				+ "AND R.CATEGORY_NO = C.CATEGORY_NO "
				+ "AND R.CATEGORY_NO = ?";
		
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
		}, categoryNo);
		
	}
	
	/**
	 * 카테고리 번호를 받아 서브카테고리별 판매량이 높은 책 10권의 데이터를 출력
	 * @param categoryNo 카테고리 번호
	 * @return 서브카테고리의 판매량이 높은 책 10권의 데이터
	 * @throws SQLException
	 */
	public List<BookDto> getSubBestSellerBooks(int categoryNo) throws SQLException{
		String sql = "SELECT R.BOOK_NO, R.BOOK_TITLE, R.CATEGORY_NO, R.BOOK_WRITER, R.PAPER_BOOK_PRICE, "
				   + "		 R.BOOK_PRICE, R.BOOK_INTRODUCE, R.BOOK_CREATED_DATE, R.BOOK_UPDATED_DATE, R.DISCOUNT_RATE, "
				   + "		 R.IMG_FILE_NAME, R.BOOK_SALES_RATE, C.CATEGORY_GROUP_NO "
				   + "FROM (SELECT BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, BOOK_PRICE, "
				   + "			   BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, IMG_FILE_NAME, BOOK_SALES_RATE "
				   + "      FROM RIDI_BOOKS "
				   + "      ORDER BY BOOK_SALES_RATE DESC) R, RIDI_BOOK_CATEGORIES C "
				   + "WHERE ROWNUM <= 10 "
				   + "AND R.CATEGORY_NO = C.CATEGORY_NO "
				   + "AND R.CATEGORY_NO = ? ";
		
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
		}, categoryNo);
		
	}
	
	/**
	 * 카테고리 번호를 받아 신간 10권의 데이터를 판매량 순으로 출력
	 * @param categoryNo 카테고리 번호
	 * @return 신간 10권의 데이터(판매량 순으로 정렬)
	 * @throws SQLException
	 */
	public List<BookDto> getSubNewBestBooks(int categoryNo) throws SQLException{
		String sql = "SELECT R.BOOK_NO, R.BOOK_TITLE, R.CATEGORY_NO, R.BOOK_WRITER, R.PAPER_BOOK_PRICE, "
				+ "		 R.BOOK_PRICE, R.BOOK_INTRODUCE, R.BOOK_CREATED_DATE, R.BOOK_UPDATED_DATE, R.DISCOUNT_RATE, "
				+ "		 R.IMG_FILE_NAME, R.BOOK_SALES_RATE, R.BOOK_PUBLISHER, C.CATEGORY_NAME, C.CATEGORY_GROUP_NO "
				+ "FROM (SELECT BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, BOOK_PRICE, "
				+ "			   BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, IMG_FILE_NAME, BOOK_SALES_RATE, BOOK_PUBLISHER "
				+ "      FROM RIDI_BOOKS "
				+ "      ORDER BY BOOK_CREATED_DATE DESC) R, RIDI_BOOK_CATEGORIES C "
				+ "WHERE ROWNUM <= 10 "
				+ "AND R.CATEGORY_NO = C.CATEGORY_NO "
				+ "AND R.CATEGORY_NO = ? "
				+ "ORDER BY BOOK_SALES_RATE DESC";
		
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
			book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
			book.setCategoryName(rs.getString("CATEGORY_NAME"));
			book.setCategoryGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			return book;
		}, categoryNo);
		
	}
	
	/**
	 * getSubWeekBestSeller 페이징처리 길이 체크용
	 * @param categoryNo 카테고리 번호
	 * @return 카테고리별 한주간 판매량이 높은 책의 데이터
	 * @throws SQLException
	 */
	public List<BookDto> getSubWeekBestSellerCnt(int categoryNo) throws SQLException{
		String sql = "SELECT BOOK_NO "
				   + "FROM (SELECT BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, "
				   + "             BOOK_PRICE, BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, "
				   + "             IMG_FILE_NAME, BOOK_SALES_RATE, BOOK_PUBLISHER, CATEGORY_GROUP_NO "
				   + "      FROM RIDI_BOOKS "
				   + "		WHERE CATEGORY_NO = ? "
				   + "		AND BOOK_CREATED_DATE BETWEEN TRUNC(SYSDATE) - 7 AND TRUNC(SYSDATE)) B, RIDI_BOOK_CATEGORIES C "
				   + "WHERE B.CATEGORY_NO = C.CATEGORY_NO ";
		
		return helper.selectList(sql, rs -> {
			BookDto book = new BookDto();
			book.setNo(rs.getInt("BOOK_NO"));
			return book;
		}, categoryNo);
		
	}
	/**
	 * getSubMonthBestSeller 페이징처리 길이 체크용
	 * @param categoryNo 카테고리 번호
	 * @return 카테고리별 한달간 판매량이 높은 책의 데이터
	 * @throws SQLException
	 */
	public List<BookDto> getSubMonthBestSellerCnt(int categoryNo) throws SQLException{
		String sql = "SELECT B.BOOK_NO "
				   + "FROM (SELECT ROW_NUMBER() OVER (ORDER BY BOOK_SALES_RATE DESC) ROW_NUMBER, "
				   + "			   BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, "
				   + "             BOOK_PRICE, BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, "
				   + "             IMG_FILE_NAME, BOOK_SALES_RATE, BOOK_PUBLISHER, CATEGORY_GROUP_NO "
				   + "      FROM RIDI_BOOKS "
				   + "		WHERE CATEGORY_NO = ? "
				   + "		AND BOOK_CREATED_DATE BETWEEN TRUNC(SYSDATE) - 30 AND TRUNC(SYSDATE)) B, RIDI_BOOK_CATEGORIES C "
				   + "WHERE B.CATEGORY_NO = C.CATEGORY_NO ";
		
		return helper.selectList(sql, rs -> {
			BookDto book = new BookDto();
			book.setNo(rs.getInt("BOOK_NO"));
			return book;
		}, categoryNo);
		
	}
	/**
	 * getSubSteadySeller 페이징처리 길이 체크용
	 * @param categoryNo 카테고리 번호
	 * @return 카테고리별 기간에 상관없이 판매량이 높은 책
	 * @throws SQLException
	 */
	public List<BookDto> getSubSteadySellerCnt(int categoryNo) throws SQLException{
		String sql = "SELECT BOOK_NO "
				   + "FROM (SELECT BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, "
				   + "             BOOK_PRICE, BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, "
				   + "             IMG_FILE_NAME, BOOK_SALES_RATE, BOOK_PUBLISHER, CATEGORY_GROUP_NO "
				   + "      FROM RIDI_BOOKS "
				   + "      WHERE CATEGORY_NO = ? "
				   + "      AND BOOK_SALES_RATE > 1000) B, RIDI_BOOK_CATEGORIES C "
				   + "WHERE B.CATEGORY_NO = C.CATEGORY_NO ";
		
		return helper.selectList(sql, rs -> {
			BookDto book = new BookDto();
			book.setNo(rs.getInt("BOOK_NO"));
			return book;
		}, categoryNo);
		
	}
	
	/**
	 * 카테고리 번호를 받아 카테고리별 한주간 판매량이 높은 책의 데이터를 출력
	 * @param categoryNo 카테고리 번호
	 * @param beginIndex 사용자가 보는 페이지의 첫번째 문서
	 * @param endIndex 사용자가 보는 페이지의 마지막 문서
	 * @return 카테고리별 한주간 판매량이 높은 책의 데이터의 첫번째 ~ 마지막 데이터
	 * @throws SQLException
	 */
	public List<BookDto> getSubWeekBestSeller(int categoryNo, int beginIndex, int endIndex) throws SQLException{
		String sql = "SELECT B.BOOK_NO, B.BOOK_TITLE, B.CATEGORY_NO, B.BOOK_WRITER, "
				   + "       B.PAPER_BOOK_PRICE, B.BOOK_PRICE, B.BOOK_INTRODUCE, B.BOOK_CREATED_DATE, "
				   + "       B.BOOK_UPDATED_DATE, B.DISCOUNT_RATE, B.IMG_FILE_NAME, B.BOOK_SALES_RATE, "
				   + "       B.BOOK_PUBLISHER, C.CATEGORY_NAME, C.CATEGORY_GROUP_NO "
				   + "FROM (SELECT ROW_NUMBER() OVER (ORDER BY BOOK_SALES_RATE DESC) ROW_NUMBER, "
				   + "			   BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, "
				   + "             BOOK_PRICE, BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, "
				   + "             IMG_FILE_NAME, BOOK_SALES_RATE, BOOK_PUBLISHER, CATEGORY_GROUP_NO "
				   + "             FROM RIDI_BOOKS "
				   + "			   WHERE CATEGORY_NO = ? "
				   + "			   AND BOOK_CREATED_DATE BETWEEN TRUNC(SYSDATE) - 7 AND TRUNC(SYSDATE)) B, RIDI_BOOK_CATEGORIES C "
				   + "WHERE B.CATEGORY_NO = C.CATEGORY_NO "
				   + "AND ROW_NUMBER >= ? AND ROW_NUMBER <= ? ";
		
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
			book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
			book.setCategoryName(rs.getString("CATEGORY_NAME"));
			book.setCategoryGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			return book;
		}, categoryNo, beginIndex, endIndex);
		
	}	
	
	/**
	 * 카테고리 번호를 받아 카테고리별 한달간 판매량이 높은 책의 데이터를 출력
	 * @param categoryNo 카테고리 번호
	 * @param beginIndex 사용자가 보는 페이지의 첫번째 문서
	 * @param endIndex 사용자가 보는 페이지의 마지막 문서
	 * @return 카테고리별 한달간 판매량이 높은 책의 데이터
	 * @throws SQLException
	 */
	public List<BookDto> getSubMonthBestSeller(int categoryNo, int beginIndex, int endIndex) throws SQLException{
		String sql = "SELECT B.BOOK_NO, B.BOOK_TITLE, B.CATEGORY_NO, B.BOOK_WRITER, "
				   + "       B.PAPER_BOOK_PRICE, B.BOOK_PRICE, B.BOOK_INTRODUCE, B.BOOK_CREATED_DATE, "
				   + "       B.BOOK_UPDATED_DATE, B.DISCOUNT_RATE, B.IMG_FILE_NAME, B.BOOK_SALES_RATE, "
				   + "       B.BOOK_PUBLISHER, C.CATEGORY_NAME, C.CATEGORY_GROUP_NO "
				   + "FROM (SELECT ROW_NUMBER() OVER (ORDER BY BOOK_SALES_RATE DESC) ROW_NUMBER, "
				   + "			   BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, "
				   + "             BOOK_PRICE, BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, "
				   + "             IMG_FILE_NAME, BOOK_SALES_RATE, BOOK_PUBLISHER, CATEGORY_GROUP_NO "
				   + "      FROM RIDI_BOOKS "
				   + "		WHERE CATEGORY_NO = ? "
				   + "		AND BOOK_CREATED_DATE BETWEEN TRUNC(SYSDATE) - 30 AND TRUNC(SYSDATE)) B, RIDI_BOOK_CATEGORIES C "
				   + "WHERE B.CATEGORY_NO = C.CATEGORY_NO "
				   + "AND ROW_NUMBER >= ? AND ROW_NUMBER <= ? ";
		
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
			book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
			book.setCategoryName(rs.getString("CATEGORY_NAME"));
			book.setCategoryGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			return book;
		}, categoryNo, beginIndex, endIndex);
		
	}
	
	/**
	 * 카테고리 번호를 받아 카테고리별 판매량이 천권 이상인 책의 데이터를 출력
	 * @param categoryNo 카테고리 번호
	 * @param beginIndex 사용자가 보는 페이지의 첫번째 문서
	 * @param endIndex 사용자가 보는 페이지의 마지막 문서
	 * @return 판매량이 천권이 넘는 책의 데이터
	 * @throws SQLException
	 */
	public List<BookDto> getSubSteadySeller(int categoryNo, int beginIndex, int endIndex) throws SQLException{
		String sql = "SELECT B.BOOK_NO, B.BOOK_TITLE, B.CATEGORY_NO, B.BOOK_WRITER, "
				   + "       B.PAPER_BOOK_PRICE, B.BOOK_PRICE, B.BOOK_INTRODUCE, B.BOOK_CREATED_DATE, "
				   + "       B.BOOK_UPDATED_DATE, B.DISCOUNT_RATE, B.IMG_FILE_NAME, B.BOOK_SALES_RATE, "
				   + "       B.BOOK_PUBLISHER, C.CATEGORY_NAME, C.CATEGORY_GROUP_NO "
				   + "FROM (SELECT ROW_NUMBER() OVER (ORDER BY BOOK_SALES_RATE DESC) ROW_NUMBER, "
				   + "		       BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, "
				   + "             BOOK_PRICE, BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, "
				   + "             IMG_FILE_NAME, BOOK_SALES_RATE, BOOK_PUBLISHER, CATEGORY_GROUP_NO "
				   + "      FROM RIDI_BOOKS "
				   + "		WHERE CATEGORY_NO = ? "
				   + "		AND BOOK_SALES_RATE > 1000) B, RIDI_BOOK_CATEGORIES C "
				   + "WHERE B.CATEGORY_NO = C.CATEGORY_NO "
				   + "AND ROW_NUMBER >= ? AND ROW_NUMBER <= ? ";
		
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
			book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
			book.setCategoryName(rs.getString("CATEGORY_NAME"));
			book.setCategoryGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			return book;
		}, categoryNo, beginIndex, endIndex);
		
	}	
	/**
	 * 카테고리별 책 전체 리스트 판매량순 출력. 페이징기능 추가.
	 * @param categoryNo 카테고리 번호.
	 * @param beginIndex 사용자가 보는 페이지의 첫번째 문서.
	 * @param endIndex 사용자가 보는 페이지의 마지막 문서.
	 * @return 페이지에 표기되는 첫번째 ~ 마지막 데이터.
	 * @throws SQLException
	 */
	public List<BookDto> getSubSortBestAllBooks(int categoryNo, int beginIndex, int endIndex) throws SQLException {
		String sql = "SELECT B.BOOK_NO, B.BOOK_TITLE, B.CATEGORY_NO, B.BOOK_WRITER, "
				   + "       B.PAPER_BOOK_PRICE, B.BOOK_PRICE, B.BOOK_INTRODUCE, B.BOOK_CREATED_DATE, "
				   + "       B.BOOK_UPDATED_DATE, B.DISCOUNT_RATE, B.IMG_FILE_NAME, B.BOOK_SALES_RATE, "
				   + "       B.BOOK_PUBLISHER, C.CATEGORY_NAME, C.CATEGORY_GROUP_NO "
				   + "FROM (SELECT ROW_NUMBER() OVER (ORDER BY BOOK_SALES_RATE DESC) ROW_NUMBER, "
				   + "      	   BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, "
				   + "      	   BOOK_PRICE, BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, "
				   + "      	   IMG_FILE_NAME, BOOK_SALES_RATE, BOOK_PUBLISHER, CATEGORY_GROUP_NO "
				   + "      FROM RIDI_BOOKS "
				   + "		WHERE CATEGORY_NO = ?) B, RIDI_BOOK_CATEGORIES C "
				   + "WHERE B.CATEGORY_NO = C.CATEGORY_NO "
				   + "AND ROW_NUMBER >= ? AND ROW_NUMBER <= ? ";
		
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
			book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
			book.setCategoryName(rs.getString("CATEGORY_NAME"));
			book.setCategoryGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			return book;
		}, categoryNo, beginIndex, endIndex);
		
	}
	
	/**
	 * 카테고리별 책 전체 리스트 최신입고순 출력. 페이징기능 추가.
	 * @param categoryNo 카테고리 번호.
	 * @param beginIndex 책 전체 리스트의 첫번째 문서.
	 * @param endIndex 책 전체 리스트의 마지막 문서.
	 * @return 최신 입고순의 책 전체 리스트.
	 * @throws SQLException
	 */
	public List<BookDto> getSubSortInsertAllBooks(int categoryNo, int beginIndex, int endIndex) throws SQLException {
		String sql = "SELECT B.BOOK_NO, B.BOOK_TITLE, B.CATEGORY_NO, B.BOOK_WRITER, "
				   + "       B.PAPER_BOOK_PRICE, B.BOOK_PRICE, B.BOOK_INTRODUCE, B.BOOK_CREATED_DATE, "
				   + "       B.BOOK_UPDATED_DATE, B.DISCOUNT_RATE, B.IMG_FILE_NAME, B.BOOK_SALES_RATE, "
				   + "       B.BOOK_PUBLISHER, C.CATEGORY_NAME, C.CATEGORY_GROUP_NO "
				   + "FROM (SELECT ROW_NUMBER() OVER (ORDER BY BOOK_CREATED_DATE DESC) ROW_NUMBER, "
				   + "      		BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, "
				   + "      		BOOK_PRICE, BOOK_INTRODUCE, BOOK_CREATED_DATE, BOOK_UPDATED_DATE, DISCOUNT_RATE, "
				   + "      		IMG_FILE_NAME, BOOK_SALES_RATE, BOOK_PUBLISHER, CATEGORY_GROUP_NO "
				   + "      FROM RIDI_BOOKS "
				   + "		WHERE CATEGORY_NO = ?) B, RIDI_BOOK_CATEGORIES C "
				   + "WHERE B.CATEGORY_NO = C.CATEGORY_NO "
				   + "AND ROW_NUMBER >= ? AND ROW_NUMBER <= ? ";
		
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
			book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
			book.setCategoryName(rs.getString("CATEGORY_NAME"));
			book.setCategoryGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			return book;
		}, categoryNo, beginIndex, endIndex);
		
	}
	
	/**
	 * 카테고리별 책의 총 권수를 반환(페이징 기능용).
	 * @param categoryNo 카테고리 번호.
	 * @return RIDI_BOOKS 테이블의 책 권수.
	 * @throws SQLException
	 */
	public int getSubTotalRowsCount(int categoryNo) throws SQLException {
		String sql = "SELECT COUNT(*) AS CNT FROM RIDI_BOOKS WHERE CATEGORY_NO = ? ";
		
		return helper.selectOne(sql, rs -> {
			return rs.getInt("CNT");
		}, categoryNo);
	}
	
}
