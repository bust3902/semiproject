package com.htabooks.dao;

import java.sql.SQLException;
import java.util.List;

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
}
	