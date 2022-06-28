package com.htabooks.dao;

import java.sql.SQLException;
import java.util.List;

import com.htabooks.helper.DaoHelper;
import com.htabooks.vo.NoticeBoard;
import com.htabooks.vo.OftenQuestions;

public class QnaCategoriesDao {

	private static QnaCategoriesDao instance = new QnaCategoriesDao();
	private QnaCategoriesDao() {}
	public static QnaCategoriesDao getInstance() {
		return instance;
	}
	
	private DaoHelper helper = DaoHelper.getInstance();
	
	// 자주 묻는 질문 가져오기
	public List<OftenQuestions> getOftenQuestions() throws SQLException {
		String sql = "select OFTEN_NO, OFTEN_TITLE, OFTEN_CONTENTS, OFTEN_CREATED, OFTEN_DELETED "
				   + "from RIDI_OFTEN_QUESTIONS ";
	
		return helper.selectList(sql, rs -> {
			OftenQuestions oftenQuestions = new OftenQuestions();
			oftenQuestions.setNo(rs.getInt("OFTEN_NO"));
			oftenQuestions.setTitle(rs.getString("OFTEN_TITLE"));
			oftenQuestions.setContents(rs.getString("OFTEN_CONTENTS"));
			oftenQuestions.setCreated(rs.getDate("OFTEN_CREATED"));
			oftenQuestions.setDeleted(rs.getDate("OFTEN_DELETED"));
			
			return oftenQuestions;
		});
	}
	
	public OftenQuestions getOftenQuestionsContents(int no) throws SQLException {
		String sql = "SELECT OFTEN_NO, OFTEN_TITLE, OFTEN_CONTENTS, OFTEN_CREATED, OFTEN_DELETED "
					+ "FROM RIDI_OFTEN_QUESTIONS "
					+ "WHERE OFTEN_NO = ? ";
		return helper.selectOne(sql, rs -> {
			
			OftenQuestions oftenQuestions = new OftenQuestions();
			oftenQuestions.setNo(rs.getInt("OFTEN_NO"));
			oftenQuestions.setTitle(rs.getString("OFTEN_TITLE"));
			oftenQuestions.setContents(rs.getString("OFTEN_CONTENTS"));
			oftenQuestions.setCreated(rs.getDate("OFTEN_CREATED"));
			oftenQuestions.setDeleted(rs.getDate("OFTEN_DELETED"));
			
			return oftenQuestions;
		}, no);
	}
}
