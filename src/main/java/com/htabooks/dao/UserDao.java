package com.htabooks.dao;

import java.sql.SQLException;

import com.htabooks.helper.DaoHelper;
import com.htabooks.vo.User;

public class UserDao {

	private static UserDao instance = new UserDao();
	private UserDao() {}
	public static UserDao getInstance() {
		return instance;
	}
	
	private DaoHelper helper = DaoHelper.getInstance();
	
	public void insertUser(User user) throws SQLException{
		String sql = "insert into ridi_users"
				+ "(user_no, user_id, user_password, user_name, user_email )"
				+ "values "
				+ "(ridi_users_seq.nextval, ?, ?, ?, ? )";
		helper.insert(sql, user.getId(), user.getPassword(), user.getName(), user.getEmail());
	}
	
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
			user.setBirthDate(rs.getDate("user_birthDate"));
			user.setGender(rs.getString("user_gender"));
			user.setCreatedDate(rs.getDate("user_createdDate"));
			user.setCash(rs.getInt("user_cash"));
			user.setAdmin(rs.getString("user_admin"));
			user.setReject(rs.getString("user_reject"));
			user.setBookCount(rs.getInt("user_bookCount"));
			
			return user;
			
		}, id);
	}
	
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
			user.setBirthDate(rs.getDate("user_birthDate"));
			user.setGender(rs.getString("user_gender"));
			user.setCreatedDate(rs.getDate("user_createdDate"));
			user.setCash(rs.getInt("user_cash"));
			user.setAdmin(rs.getString("user_admin"));
			user.setReject(rs.getString("user_reject"));
			user.setBookCount(rs.getInt("user_bookCount"));
			
			return user;
			
		}, email);
				
	}
	
	
}
