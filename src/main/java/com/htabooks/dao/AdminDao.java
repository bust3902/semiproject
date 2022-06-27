package com.htabooks.dao;

import java.sql.SQLException;

import com.htabooks.dto.BookDto;
import com.htabooks.helper.DaoHelper;
import com.htabooks.vo.Book;
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
				   + " BOOK_PRICE, BOOK_INTRODUCE, BOOK_PUBLISHER, IMG_FILE_NAME ) "
				   + "values "
				   + "(ridi_books_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ? ) ";
		
		helper.insert(sql,book.getTitle(),book.getCategoryNo(),book.getWriter(),book.getPaperBookPrice(),book.getBookPrice(),book.getIntroduce(),book.getBookPublisher(),book.getImgFileName() );
	}
	// 상품정보 수정 - > updateproductform.jsp ->updateproduct.jsp
	
	/**
	 * 상품정보 수정
	 * @param book 상품정보
	 * @throws SQLException 데이터액세스 작업중 예외가발생하면 이 예외를 던진다.
	 */
	public void updateItem(Book book)throws SQLException{
		String sql = "update ridi_books  "
				   + "set "
				   + "		book_title = ?, "
				   + "		category_no = ?, "
				   + "		book_writer = ?, "
				   + "		paper_book_price = ?, "
				   + "		book_price = ?, "
				   + "		book_introduce = ?, "
				   + "		book_created_date = sysdate, "
				   + "		book_updated_date = sysdate, "
				   + "where book_no = ? ";
		helper.update(sql,book.getTitle(),book.getCategoryNo(),book.getWriter(),book.getPaperBookPrice(),book.getBookPrice(),book.getIntroduce(),book.getNo());
	}
	
	
	
	public User getAdminById(String id) throws SQLException{
		String sql="select * "
				+ "from ridi_users "
				+ "where user_id= ? "
				+ "and admin='y'";
		
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
		String sql = "update ridi_Users "
				   + "set "
				   + "		user_id = ?, "
				   + "		user_password = ?, "
				   + "		user_email = ?, "
				   + "		user_birth_date = ?, "	 
				   + "		user_gender = ?, "
				   + "		user_created_date = ?, " 
				   + "		user_cash = ?, "
				   + "		user_admin = ?, "
				   + "		user_reject = ?, "
				   + "		user_book_count = ?, "	 
				   + "where user_no = ? ";
		
		helper.update(sql,user.getId(),user.getPassword(),user.getEmail(),user.getBirthDate(),user.getGender(),user.getCreatedDate(),user.getCash(),user.getAdmin(),user.getReject(),user.getBookCount(),user.getNo());
				   
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
			book.setCategoryNo(rs.getInt("CATEGORY_NO"));
			book.setCategoryName(rs.getString("CATEGORY_NAME"));
			book.setCategoryGroupNo(rs.getInt("CATEGORY_GROUP_NO"));
			book.setCategoryGroupName(rs.getString("CNAME"));
			return book;
		}, bookNo);
		
	}
	
	public void updateBook(BookDto book) throws SQLException{
		String sql = "update ridi_books "
				   + "set "
				   + "		BOOK_NO = ?, "
				   + "		BOOK_TITLE = ?, "
				   + "		CATEGORY_NO = ?, "
				   + "		BOOK_WRITER = ?, "
				   + "		PAPER_BOOK_PRICE = ?,"
				   + "		BOOK_PRICE = ?, "
				   + "		BOOK_INTRODUCE = ?, "
				   + "		IMG_FILE_NAME = ?"
				   + "where book_no = ? ";
		helper.update(sql, book.getNo(),book.getTitle(),book.getCategoryNo(),book.getWriter(),book.getPaperBookPrice(),book.getBookPrice(),book.getIntroduce(),book.getImgFileName());
				   
	}
	
	
	
	// 알림메세지 보내기
	
	// 총 수익률내기 (책 구매 수익률) 총수익률을 기록할 vo파일 생성/ DB생성
	
	
}
