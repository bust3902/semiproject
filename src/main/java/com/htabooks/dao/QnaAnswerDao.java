package com.htabooks.dao;

import java.sql.SQLException;

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
					+ "(ridi_qna_no, ridi_qna_name, ridi_qna_contents, ridi_qna_answer, ridi_qna_answer_check, ridi_qna_created, ridi_qna_category ) "
					+ "values "
					+ "(ridi_qna_seq.nextval, ?, ?, ?, ?, ?, ?) ";
		
		helper.insert(sql, qnaAnswer.getName(), qnaAnswer.getContents(), qnaAnswer.getAnswer(), qnaAnswer.getAnswerCheck(), qnaAnswer.getCreated(), qnaAnswer.getCategory());
	}
	
	
}
