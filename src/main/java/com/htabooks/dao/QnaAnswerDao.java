package com.htabooks.dao;

import java.sql.SQLException;
import java.util.List;

import com.htabooks.helper.DaoHelper;
import com.htabooks.vo.QnaAnswer;

public class QnaAnswerDao {

	private static QnaAnswerDao instance = new QnaAnswerDao();
	private QnaAnswerDao() {}
	public static QnaAnswerDao getInstance() {
		return instance;
	}
	
	private DaoHelper helper = DaoHelper.getInstance();
	
	public void insertQnaAnswer(QnaAnswer qnaAnswer) throws SQLException {
		System.out.println(qnaAnswer);
		String sql = "insert into ridi_qna "
					+ "(ridi_qna_no, ridi_qna_name, ridi_qna_contents, ridi_qna_answer, ridi_qna_answer_check, ridi_qna_created, ridi_qna_category) "
					+ "values "
					+ "(ridi_qna_seq.nextval, ?, ?, ?, ?, ?, ?) ";
		
		helper.insert(sql, qnaAnswer.getName(), qnaAnswer.getContents(), qnaAnswer.getAnswer(), qnaAnswer.getAnswerCheck(), qnaAnswer.getCreated(), qnaAnswer.getCategory());
	}
	
	// 문의게시판 목록 불러오기
	public List<QnaAnswer> getQnaAnswer(int beginIndex, int endIndex) throws SQLException {
		String sql = "select RIDI_QNA_NO, RIDI_QNA_NAME, RIDI_QNA_CONTENTS, RIDI_QNA_ANSWER, RIDI_QNA_ANSWER_CHECK, RIDI_QNA_CREATED, RIDI_QNA_CATEGORY "
					+ "from (select ROW_NUMBER() over (order by RIDI_QNA_NO DESC) RN, RIDI_QNA_NO, RIDI_QNA_NAME, RIDI_QNA_CONTENTS, "
					+ "RIDI_QNA_ANSWER, RIDI_QNA_ANSWER_CHECK, RIDI_QNA_CREATED, RIDI_QNA_CATEGORY "
					+ "from RIDI_QNA) "
					+ "where RN >= ? AND RN <= ? ";
		return helper.selectList(sql, rs -> {
			
			QnaAnswer qnaAnswer = new QnaAnswer();
			qnaAnswer.setNo(rs.getInt("RIDI_QNA_NO"));
			qnaAnswer.setName(rs.getString("RIDI_QNA_NAME"));
			qnaAnswer.setContents(rs.getString("RIDI_QNA_CONTENTS"));
			qnaAnswer.setAnswer(rs.getString("RIDI_QNA_ANSWER"));
			qnaAnswer.setAnswerCheck(rs.getString("RIDI_QNA_ANSWER_CHECK"));
			qnaAnswer.setCreated(rs.getDate("RIDI_QNA_CREATED"));
			qnaAnswer.setCategory(rs.getInt("RIDI_QNA_CATEGORY"));
			
			return qnaAnswer;
		}, beginIndex, endIndex);
			
	}
	
	
	public List<QnaAnswer> getQnaAnswer(String keyword, int beginIndex, int endIndex) throws SQLException {
		String sql = "select RIDI_QNA_NO, RIDI_QNA_NAME, RIDI_QNA_CONTENTS, RIDI_QNA_ANSWER, RIDI_QNA_ANSWER_CHECK, RIDI_QNA_CREATED, RIDI_QNA_CATEGORY "
				+ "from (select ROW_NUMBER() over (order by RIDI_QNA_NO DESC) RN, RIDI_QNA_NO, RIDI_QNA_NAME, RIDI_QNA_CONTENTS, "
				+ "RIDI_QNA_ANSWER, RIDI_QNA_ANSWER_CHECK, RIDI_QNA_CREATED, RIDI_QNA_CATEGORY "
				+ "from RIDI_QNA) "
				+ "where RN >= ? AND RN <= ? ";
		return helper.selectList(sql, rs -> {
			
			QnaAnswer qnaAnswer = new QnaAnswer();
			qnaAnswer.setNo(rs.getInt("RIDI_QNA_NO"));
			qnaAnswer.setName(rs.getString("RIDI_QNA_NAME"));
			qnaAnswer.setContents(rs.getString("RIDI_QNA_CONTENTS"));
			qnaAnswer.setAnswer(rs.getString("RIDI_QNA_ANSWER"));
			qnaAnswer.setAnswerCheck(rs.getString("RIDI_QNA_ANSWER_CHECK"));
			qnaAnswer.setCreated(rs.getDate("RIDI_QNA_CREATED"));
			qnaAnswer.setCategory(rs.getInt("RIDI_QNA_CATEGORY"));
			
			return qnaAnswer;
		}, keyword, beginIndex, endIndex);
		
	}
	
	
	public int getTotalRwos(String keyword) throws SQLException {
		String sql = "select count(*) cnt "
				+ "from RIDI_QNA "
				+ "where RIDI_QNA_NAME || RIDI_QNA_CONTENTS LIKE ('%' || ? || '%') ";
		
		return helper.selectOne(sql, rs -> {
			return rs.getInt("cnt");
		}, keyword);
	}
	
	
	public int getTotalRwos() throws SQLException {
		String sql = "select count(*) cnt "
					+ "from RIDI_QNA ";
		
		return helper.selectOne(sql, rs -> {
			return rs.getInt("cnt");
		});
	}
	
	// 문의 답변 하기
	public String qnaAnswer(String answer) throws SQLException {
		String sql = "update RIDI_QNA "
					+"set RIDI_QNA_ANSWER = ? "
					+", RIDI_QNA_ANSWER_CHECK = ? "
					+"where RIDI_QNA_NO = ? ";
		
		return null;
		
	}
}
