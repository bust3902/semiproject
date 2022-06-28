package com.htabooks.dao;

import java.sql.SQLException;
import java.util.List;

import com.htabooks.dto.UserDto;
import com.htabooks.helper.DaoHelper;
import com.htabooks.vo.User;

public class UserDao {

	private static UserDao instance = new UserDao();
	private UserDao() {}
	public static UserDao getInstance() {
		return instance;
	}
	
	private DaoHelper helper = DaoHelper.getInstance();
	
	// 유저 등록
	public void insertUser(User user) throws SQLException{
		String sql = "insert into ridi_users"
				+ "(user_no, user_id, user_password, user_name, user_email, user_birth_date, user_gender )"
				+ "values "
				+ "(ridi_users_seq.nextval, ?, ?, ?, ?, ?, ? )";
		helper.insert(sql, user.getId(), user.getPassword(), user.getName(), user.getEmail(), user.getBirthDate(), user.getGender());
	}
	
	// 유저 Id로 찾기 
	public User getUserById(String id) throws SQLException{
		String sql="select * "
				+ "from ridi_users "
				+ "where user_id= ? ";
		
		return helper.selectOne(sql, rs -> {
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
			
		}, id);
	}
	
	// 유저 Email로 찾기
	public User getUserByEmail(String email) throws SQLException {
		String sql = "select * "
				+ "from ridi_users "
				+ "where user_email = ? ";
		
		return helper.selectOne(sql, rs -> {
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
			
		}, email);
				
	}
	
	//유저 정보 업데이트
		public void updateUser(User user) throws SQLException{
			String sql = "update ridi_users "
					+ "set "
					+ "user_cash = ?, "
					+ "user_admin = ?, "
					+ "user_reject = ?, "
					+ "user_book_count = ? ,"
					+ "user_updated_date = sysdate "
					+ "where user_no = ? ";
			
			helper.update(sql, user.getCash(), user.getAdmin(), user.getReject(), user.getBookCount(), user.getNo());
		}
	
		
		public int getTotalRowsCount() throws SQLException {
			String sql = "SELECT COUNT(*) AS CNT FROM RIDI_USERS ";
			
			return helper.selectOne(sql, rs -> {
				return rs.getInt("CNT");
			});
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
		
		/**
		 * 사용자의 번호를 받아 사용자의 이름, 책 번호, 책 이미지 파일명을 반환. 내 서재에 사용.
		 * @param userNo 사용자 번호.
		 * @return 사용자의 책 번호, 책 이미지 파일명 반환.
		 * @throws SQLException
		 */
		public List<UserDto> getUserBooks(int userNo, int beginIndex, int endIndex)throws SQLException{
			String sql = "SELECT BOOK_NO, IMG_FILE_NAME "
					   + "FROM (SELECT ROW_NUMBER() OVER (ORDER BY I.ORDER_NO DESC) ROW_NUMBER, I.BOOK_NO, I.ORDER_NO, B.IMG_FILE_NAME "
					   + "      FROM RIDI_USERS U, RIDI_ORDERS O, RIDI_ORDER_ITEMS I, RIDI_BOOKS B "
					   + "      WHERE U.USER_NO = O.USER_NO "
					   + "      AND O.ORDER_NO = I.ORDER_NO "
					   + "      AND I.BOOK_NO = B.BOOK_NO "
					   + "      AND U.USER_NO = ?) "
					   + "WHERE ROW_NUMBER >= ? AND ROW_NUMBER <= ? ";
			
			return helper.selectList(sql, rs -> {
				UserDto user = new UserDto();
				user.setBookNo(rs.getInt("BOOK_NO"));
				user.setImgFileName(rs.getString("IMG_FILE_NAME"));
				
				return user;
			}, userNo, beginIndex, endIndex);
		}
		/**
		 * getUserBooks 페이징기능 카운트.
		 * @param userNo 사용자 번호.
		 * @return BOOK_NO를 반환시키고 size()로 카운트.
		 * @throws SQLException
		 */
		public List<UserDto> getUserBooksCnt(int userNo)throws SQLException{
			String sql = "SELECT I.BOOK_NO "
					   + "FROM RIDI_USERS U, RIDI_ORDERS O, RIDI_ORDER_ITEMS I, RIDI_BOOKS B "
					   + "WHERE U.USER_NO = O.USER_NO "
					   + "AND O.ORDER_NO = I.ORDER_NO "
					   + "AND I.BOOK_NO = B.BOOK_NO "
					   + "AND U.USER_NO = ? ";
			
			return helper.selectList(sql, rs -> {
				UserDto user = new UserDto();
				user.setBookNo(rs.getInt("BOOK_NO"));
				
				return user;
			}, userNo);
		}
		

		
		/**
		 * 사용자의 번호를 받아 사용자의 이름, 책 번호, 책 이미지 파일명을 반환. 내 서재에 사용.
		 * @param userNo 사용자 번호.
		 * @return 사용자의 책 번호, 책 이미지 파일명 반환.
		 * @throws SQLException
		 */
		public List<UserDto> getSearchUserBooks(int userNo, String keyword, int beginIndex, int endIndex)throws SQLException{
			String sql = "SELECT BOOK_NO, IMG_FILE_NAME "
					   + "FROM (SELECT ROW_NUMBER() OVER (ORDER BY I.ORDER_NO DESC) ROW_NUMBER, I.BOOK_NO, I.ORDER_NO, B.IMG_FILE_NAME, B.BOOK_WRITER, B.BOOK_PUBLISHER "
					   + "      FROM RIDI_USERS U, RIDI_ORDERS O, RIDI_ORDER_ITEMS I, RIDI_BOOKS B "
					   + "      WHERE U.USER_NO = O.USER_NO "
					   + "      AND O.ORDER_NO = I.ORDER_NO "
					   + "      AND I.BOOK_NO = B.BOOK_NO "
					   + "      AND U.USER_NO = ? "
					   + "      AND (B.BOOK_TITLE || B.BOOK_WRITER || B.BOOK_PUBLISHER) LIKE ('%' || ? || '%')) "
					   + "WHERE ROW_NUMBER >= ? AND ROW_NUMBER <= ? ";
			
			return helper.selectList(sql, rs -> {
				UserDto user = new UserDto();
				user.setBookNo(rs.getInt("BOOK_NO"));
				user.setImgFileName(rs.getString("IMG_FILE_NAME"));
				
				return user;
			}, userNo, keyword, beginIndex, endIndex);
		}
		/**
		 * getUserBooks 페이징기능 카운트.
		 * @param userNo 사용자 번호.
		 * @return BOOK_NO를 반환시키고 size()로 카운트.
		 * @throws SQLException
		 */
		public List<UserDto> getUserBooksSearchCnt(int userNo, String keyword)throws SQLException{
			String sql = "SELECT I.BOOK_NO "
					+ "FROM RIDI_USERS U, RIDI_ORDERS O, RIDI_ORDER_ITEMS I, RIDI_BOOKS B "
					+ "WHERE U.USER_NO = O.USER_NO "
					+ "AND O.ORDER_NO = I.ORDER_NO "
					+ "AND I.BOOK_NO = B.BOOK_NO "
					+ "AND U.USER_NO = ? "
					+ "AND (I.BOOK_NO || B.BOOK_WRITER || B.BOOK_PUBLISHER) LIKE ('%' || ? || '%')";
			
			return helper.selectList(sql, rs -> {
				UserDto user = new UserDto();
				user.setBookNo(rs.getInt("BOOK_NO"));
				
				return user;
			}, userNo, keyword);
		}
}
	