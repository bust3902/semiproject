package com.htabooks.dao;

import java.sql.SQLException;
import java.util.List;

import com.htabooks.helper.DaoHelper;
import com.htabooks.vo.NoticeBoard;

public class QuestionsBoardDao {

	private static QuestionsBoardDao instance = new QuestionsBoardDao();
	private QuestionsBoardDao() {}
	public static QuestionsBoardDao getInstance() {
		return instance;
	}
	
	private DaoHelper helper = DaoHelper.getInstance();
	
	// 검색하는 쿼리
	public int getTotalRows(String keyword) throws SQLException {
		String sql = "select count(*) cnt "
				   + "from risi_questions_board "
				   + "where questions_deleted = 'N' and questions_title like '%' || ? || '%' ";
		
		return helper.selectOne(sql, rs -> {
			return rs.getInt("cnt");
		}, keyword);
	}
	
	public List<NoticeBoard> getNoticeBoard(int beginIndex, int endIndex) throws SQLException {
		String sql = "SELECT  NOTICE_BOARD_NO, NOTICE_BOARD_TITLE, NOTICE_BOARD_CREATED "
					+ "FROM (SELECT ROW_NUMBER() OVER (ORDER BY NOTICE_BOARD_NO DESC) RN, NOTICE_BOARD_NO, NOTICE_BOARD_TITLE, NOTICE_BOARD_CREATED "
					+ "      FROM RIDI_NOTICE_BOARD "
					+ "      WHERE NOTICE_BOARD_DELETED  = 'N') "
					+ "WHERE RN >= ? AND RN <= ? ";
		// 상자						// 도구
		List<NoticeBoard> list = helper.selectList(sql, rs -> {
			// 삼자에 담을 것들
			NoticeBoard noticeBoard = new NoticeBoard();
			noticeBoard.setNo(rs.getInt("notice_board_no"));
			noticeBoard.setTitle(rs.getString("notice_board_title"));
			noticeBoard.setContents(rs.getString("notice_board_contents"));
			noticeBoard.setDeletedDate(rs.getString("notice_board_deleted"));
			noticeBoard.setCreatedDate(rs.getDate("notice_board_created"));
			// 상자에 담을 것 보여준다.
			return noticeBoard;
		}, beginIndex, endIndex);
			return list;
	}
}
