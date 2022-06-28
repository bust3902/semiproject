<%@page import="com.htabooks.vo.NoticeBoard"%>
<%@page import="com.htabooks.util.StringUtil"%>
<%@page import="com.htabooks.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//  공지삭제 페이지

/* // 로그인 후 사용가능한 서비스 (세션에 저장된 관리자정보 조회)
	User admin = (User) session.getAttribute("LOGINED_ADMIN");
	if(admin == null){
		response.sendRedirect("(사용자정보 오류 페이지)");
		return;
	
	}
	// 요청파라미터에서 게시글번호를 조회한다.
	int boardNo = StringUtil.stringToInt(request.getParameter("no"));
	int currentPage = StringUtil.stringToInt(request.getParameter("page"), 1);

	// 게시글번호에 해당하는 게시글 정보를 조회한다.
	noticeBoardDao noticeBoardDao = NoticeBoardDao.getInstance();
	NoticeBoard board = NoticeBoardDao.getBoardByNo();
		
	// 게시글정보가 없으면 재요청 URL을 응답으로보낸다.
	if (board == null) {
		throw new RuntimeException("현재 게시글 정보가 존재하지 않습니다.");
	}
	
	
	// 게시글 정보의 삭제여부를 Y로 변경한다.
	board.setDeleted("Y");
	// 변경된 게시글 정보를 데이터베이스에 반영시킨다.
	noticeBoardDao.updateBoard(board);
	
	// 게시글목록을 재요청하는 URL을 응답으로 보낸다.
	response.sendRedirect("noticeboardlist.jsp");	
		
		 */
		
		
		
%>