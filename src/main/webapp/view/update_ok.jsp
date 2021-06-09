<%@page import="com.ict.guestbook.DAO"%>
<%@page import="com.ict.guestbook.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	VO vo = new VO();
	vo.setIdx(request.getParameter("idx"));
	//vo.setId(request.getParameter("id"));
	//vo.setPw(request.getParameter("pw"));
	vo.setName(request.getParameter("name"));
	vo.setSubject(request.getParameter("subject"));
	vo.setEmail(request.getParameter("email"));
	vo.setMain(request.getParameter("main"));
	//vo.setReg(request.getParameter("reg"));
	int result = DAO.getInstance().getUpdate(vo);
	response.sendRedirect("detail.jsp?idx="+vo.getIdx());	
	
%>
