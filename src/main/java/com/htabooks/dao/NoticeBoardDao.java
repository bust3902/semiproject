package com.htabooks.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.htabooks.helper.DaoHelper;
import com.htabooks.vo.NoticeBoard;

public class NoticeBoardDao {

	private static NoticeBoardDao instance = new NoticeBoardDao();
	private NoticeBoardDao() {}
	public static NoticeBoardDao getInstance() {
		return instance;
	}
	
	private DaoHelper helper = DaoHelper.getInstance();
	
	public List<NoticeBoard> getNoticeBoard(int beginIndex, int endIndex) throws SQLException {
		String sql = "SELECT  NOTICE_BOARD_NO, NOTICE_BOARD_TITLE, NOTICE_BOARD_CONTENTS, NOTICE_BOARD_DELETED, NOTICE_BOARD_CREATED "
					+ "FROM (SELECT ROW_NUMBER() OVER (ORDER BY NOTICE_BOARD_NO DESC) RN, NOTICE_BOARD_NO, NOTICE_BOARD_TITLE, NOTICE_BOARD_CONTENTS, NOTICE_BOARD_DELETED, NOTICE_BOARD_CREATED "
					+ "      FROM RIDI_NOTICE_BOARD "
					+ "      WHERE NOTICE_BOARD_DELETED  = 'N') "
					+ "WHERE RN >= ? AND RN <= ? ";
		// 상자						// 도구
		List<NoticeBoard> noticeList = helper.selectList(sql, rs -> {
			// 삼자에 담을 것들
			NoticeBoard noticeBoard = new NoticeBoard();
			noticeBoard.setNo(rs.getInt("NOTICE_BOARD_NO"));
			noticeBoard.setTitle(rs.getString("NOTICE_BOARD_TITLE"));
			noticeBoard.setContents(DaoHelper.clobToString(rs.getClob("NOTICE_BOARD_CONTENTS")));
			noticeBoard.setDeletedDate(rs.getString("NOTICE_BOARD_DELETED"));
			noticeBoard.setCreatedDate(rs.getDate("NOTICE_BOARD_CREATED"));
			// 상자에 담을 것 보여준다.
			return noticeBoard;
		}, beginIndex, endIndex);
			return noticeList;
	}
			
			
	public List<NoticeBoard> getNoticeBoard(int beginIndex, int endIndex, String keyword) throws SQLException {
		String sql = "SELECT  NOTICE_BOARD_NO, NOTICE_BOARD_TITLE, NOTICE_BOARD_CONTENTS, NOTICE_BOARD_DELETED, NOTICE_BOARD_CREATED "
					+ "FROM (SELECT ROW_NUMBER() OVER (ORDER BY NOTICE_BOARD_NO DESC) RN, NOTICE_BOARD_NO, NOTICE_BOARD_TITLE, NOTICE_BOARD_CONTENTS, NOTICE_BOARD_DELETED, NOTICE_BOARD_CREATED "
					+ "      FROM RIDI_NOTICE_BOARD "
					+ "      WHERE NOTICE_BOARD_DELETED  = 'N') "
					+ "WHERE RN >= ? AND RN <= ? ";
		// 상자						// 도구
		List<NoticeBoard> list = helper.selectList(sql, rs -> {
			// 삼자에 담을 것들
			NoticeBoard noticeBoard = new NoticeBoard();
			noticeBoard.setNo(rs.getInt("NOTICE_BOARD_NO"));
			noticeBoard.setTitle(rs.getString("NOTICE_BOARD_TITLE"));
			noticeBoard.setContents(DaoHelper.clobToString(rs.getClob("NOTICE_BOARD_CONTENTS")));
			noticeBoard.setDeletedDate(rs.getString("NOTICE_BOARD_DELETED"));
			noticeBoard.setCreatedDate(rs.getDate("NOTICE_BOARD_CREATED"));
			// 상자에 담을 것 보여준다.
			return noticeBoard;
		}, beginIndex, endIndex, keyword);
			// 리스트 반환
			return list;
	}
	
	public int getTotalRows() throws SQLException {
		String sql = "select count(*) cnt "
				   + "from ridi_notice_board "
				   + "where NOTICE_BOARD_DELETED = 'N' ";
		
		return helper.selectOne(sql, rs -> {
			return rs.getInt("cnt");
		});
	}
	
	
	// 검색하는 쿼리
	public int getTotalRows(String keyword) throws SQLException {
		String sql = "select (*) cnt "
				   + "from RIDI_NOTICE_BOARD "
				   + "where NOTICE_BOARD_DELETED = 'N' and (NOTICE_BOARD_TITLE || NOTICE_BOARD_CONTENTS) like ('%' || ? || '%') ";
		
		return helper.selectOne(sql, rs -> {
			return rs.getInt("cnt");
		}, keyword);
	}
	
	public NoticeBoard getNoticeBoardByContents(int no) throws SQLException {
		String sql = "select notice_board_no, notice_board_title, notice_board_contents, notice_board_deleted, notice_board_created "
					+"from ridi_notice_board "
					+"where notice_board_no = ? ";
		return helper.selectOne(sql, rs -> {
			
			NoticeBoard noticeBoard = new NoticeBoard();
			noticeBoard.setNo(rs.getInt("notice_board_no"));
			noticeBoard.setTitle(rs.getString("notice_board_title"));
			noticeBoard.setContents(rs.getString("notice_board_contents"));
			noticeBoard.setDeletedDate(rs.getString("notice_board_deleted"));
			noticeBoard.setCreatedDate(rs.getDate("notice_board_created"));
			return noticeBoard;
		}, no);
	}
	
	
}
