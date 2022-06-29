package com.htabooks.dao;

import java.sql.SQLException;
import java.util.List;

import com.htabooks.dto.BookDto;
import com.htabooks.helper.DaoHelper;
import com.htabooks.vo.User;

public class AdminDao {

	private static AdminDao instance = new AdminDao();
	private AdminDao() {}
	public static AdminDao getInstance() {
		return instance;
	}
	
	private com.htabooks.helper.DaoHelper helper = DaoHelper.getInstance();
	
	/**
	 * 상품정보를 상품테이블에 저장한다.
	 * @param book 상품
	 * @throws SQLException 데이터액세스 작업중 오류가 발생하면 이 예외를 던진다.
	 */
	public void insertBook(BookDto book) throws SQLException{
		String sql = "INSERT INTO RIDI_BOOKS "
				   + "(BOOK_NO, BOOK_TITLE, CATEGORY_NO, BOOK_WRITER, PAPER_BOOK_PRICE, "
				   + " BOOK_PRICE, BOOK_INTRODUCE, BOOK_PUBLISHER, IMG_FILE_NAME, BOOK_SALES_RATE ) "
				   + "values "
				   + "(ridi_books_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, 0 ) ";
		
		helper.insert(sql,book.getTitle(),book.getCategoryNo(),book.getWriter(),book.getPaperBookPrice(),book.getBookPrice(),book.getIntroduce(),book.getBookPublisher(),book.getImgFileName() );
	}
	
	
	
	
	public User getAdminById(String id) throws SQLException{
		String sql="select * "
				+ "from ridi_users "
				+ "where user_id= ? "
				+ "and user_admin='y'";
		
		return helper.selectOne(sql, rs -> {
			User user = new User();
			user.setNo(rs.getInt("user_no"));
			user.setId(rs.getString("user_id"));
			user.setPassword(rs.getString("user_password"));
			user.setEmail(rs.getString("user_email"));
			user.setBirthDate(rs.getString("user_birthDate"));
			user.setGender(rs.getString("user_gender"));
			user.setCreatedDate(rs.getDate("user_createdDate"));
			user.setCash(rs.getInt("user_cash"));
			user.setAdmin(rs.getString("user_admin"));
			user.setReject(rs.getString("user_reject"));
			user.setBookCount(rs.getInt("user_bookCount"));
			
			return user;
			
		}, id);
	}	
	

	// 회원정보 수정 
	/**
	 * 필수기능 (운영진 설정) (회원 블록먹이기)
	 * 
	 * 회원정보 수정 (운영진(user_admin ="y") 설정 / 회원블록(user_reject="y")정보 등을 수정할 수 있음.
	 * 
	 * 관리자가 회원정보를 수정하게해도 되는가에 대한 의문 / 회원정보수정이 아닌, 단순한 권한 수정쪽으로 방향을 잡아야하는가
	 * 아이디같은경우 부적절한 아이디를 사용할 수 있기때문에 아이디변경도 고려해볼만하기 때문에...
	 * 
	 * 아이디/ 권한/ 회원블록만 수정?
	 * 
	 * 밑의 코드는 전체 사용자정보 수정
	 * 
	 * @param user 사용자정보
	 * @throws SQLException 데이터액세스 작업중 예외가 발생하면 이 예외를 던진다.
	 */
	public void updateUser(User user)throws SQLException{
		String sql = "update RIDI_USERS "
				   + "set "
				   + "		USER_ID = ?, "
				   + "		USER_EMAIL = ?, "
				   + "		USER_CASH = ?, "
				   + "		USER_ADMIN = ?, "
				   + "		USER_REJECT = ? "
				   + "where USER_ID = ? ";
		
		helper.update(sql,user.getId(),
						user.getEmail(),
						user.getCash(),
						user.getAdmin(),
						user.getReject(),
						user.getId()
						);
		}

	public BookDto getBookbyNo(int bookNo) throws SQLException{
		String sql	= "select * "
					+ "from ridi_books "
					+ "where book_no = ? ";
		
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
			book.setCategoryGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			return book;
		}, bookNo);
		
	}
	
	public void updateBook(BookDto book) throws SQLException{
		String sql = "update ridi_books "
				   + "set "
				   + "		BOOK_TITLE = ?, "
				   + "		CATEGORY_NO = ?, "
				   + "		BOOK_WRITER = ?, "
				   + "		PAPER_BOOK_PRICE = ?,"
				   + "		BOOK_PRICE = ?, "
				   + "		BOOK_INTRODUCE = ?, "
				   + "		IMG_FILE_NAME = ? "
				   + "where book_no = ? ";
		helper.update(sql, book.getTitle(), 
				          book.getCategoryNo(), 
				          book.getWriter(),
				          book.getPaperBookPrice(),
				          book.getBookPrice(), 
				          book.getIntroduce(), 
				          book.getImgFileName(), 
				          book.getNo());
				   
	}
	
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
	public List<User> getAllUsers(int beginIndex, int endIndex)throws SQLException{
		String sql	= "SELECT 	USER_NO, USER_ID, USER_PASSWORD, USER_EMAIL, USER_BIRTH_DATE, USER_GENDER, "
					+ "			USER_CREATED_DATE,USER_CASH,USER_ADMIN,USER_REJECT,USER_BOOK_COUNT,USER_NAME,USER_UPDATED_DATE "
					+ "FROM (SELECT ROW_NUMBER() OVER (ORDER BY USER_NO ASC) ROW_NUMBER, "
					+ "			USER_NO, USER_ID, USER_PASSWORD, USER_EMAIL, USER_BIRTH_DATE, USER_GENDER,"
					+ "			USER_CREATED_DATE, USER_CASH, USER_ADMIN, USER_REJECT, USER_BOOK_COUNT, USER_NAME, USER_UPDATED_DATE "
					+ "		FROM RIDI_USERS ) "
					+ "WHERE ROW_NUMBER >= ? AND ROW_NUMBER <= ? ";
		
		return helper.selectList(sql, rs -> {
			User user = new User();
			user.setNo(rs.getInt("USER_NO"));
			user.setId(rs.getString("USER_ID"));
			user.setPassword(rs.getString("USER_PASSWORD"));
			user.setEmail(rs.getString("user_email"));
			user.setBirthDate(rs.getString("USER_BIRTH_DATE"));
			user.setGender(rs.getString("USER_GENDER"));
			user.setCreatedDate(rs.getDate("USER_CREATED_DATE"));
			user.setCash(rs.getInt("USER_CASH"));
			user.setAdmin(rs.getString("USER_ADMIN"));
			user.setReject(rs.getString("USER_REJECT"));
			user.setBookCount(rs.getInt("USER_BOOK_COUNT"));
			user.setName(rs.getString("USER_NAME"));
			
			return user;
			
		},beginIndex,endIndex);
	}
	public List<User> getAllUsers(int beginIndex, int endIndex, String keyword)throws SQLException{
		String sql	= "SELECT 	USER_NO, USER_ID, USER_PASSWORD, USER_EMAIL, USER_BIRTH_DATE, USER_GENDER, USER_CREATED_DATE, USER_CASH, USER_ADMIN,"
					+ "			USER_REJECT, USER_BOOK_COUNT, USER_NAME, USER_UPDATED_DATE "
					+ "FROM (SELECT ROW_NUMBER() OVER(ORDER BY USER_NO ASC) ROW_NUMBER, "
					+ "				USER_NO, USER_ID, USER_PASSWORD, USER_EMAIL, USER_BIRTH_DATE, USER_GENDER, "
					+ "				USER_CREATED_DATE, USER_CASH, USER_ADMIN, USER_REJECT, USER_BOOK_COUNT, USER_NAME, USER_UPDATED_DATE  "
					+ "		FROM RIDI_USERS ) "
					+ "WHERE ROW_NUMBER >= ? AND ROW_NUMBER <= ? "
					+ "AND USER_NAME LIKE '%' || ? || '%' ";
		
		return helper.selectList(sql, rs -> {
			User user = new User();
			user.setNo(rs.getInt("user_no"));
			user.setId(rs.getString("user_id"));
			user.setPassword(rs.getString("user_password"));
			user.setName(rs.getString("user_name"));
			user.setEmail(rs.getString("user_email"));
			
			user.setBirthDate(rs.getString("user_birth_date"));
			user.setGender(rs.getString("user_gender"));
			user.setCreatedDate(rs.getDate("user_created_date"));
			user.setCash(rs.getInt("user_cash"));
			user.setAdmin(rs.getString("user_admin"));
			user.setReject(rs.getString("user_reject"));
			user.setBookCount(rs.getInt("user_book_count"));
			
			return user;
			
		},beginIndex, endIndex, keyword);
	}
	
	public void deletebook(BookDto book) throws SQLException{
		String sql	= "DELETE FROM RIDI_BOOKS"
					+ "WHERE BOOK_NO = ? ";
		helper.delete(sql,book.getNo());
	}
	
	// 알림메세지 보내기
	
	// 총 수익률내기 (책 구매 수익률) 총수익률을 기록할 vo파일 생성/ DB생성
	
	
}
