
<%@page import="com.ict.guestbook.DAO"%>
<%@page import="com.ict.guestbook.VO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//테이블 전체 정보 가져오기
	List<VO> list = DAO.getInstance().getSelectAll();
//
	pageContext.setAttribute("list", list);
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div {
	text-align: center;
	margin: 0px 100px;
	auto;
}

table th, td {
	padding: 10px 5px;
	border: 1px solid black;
	width: 500px;
	margin: auto;
}
th {background-color: skyblue;
	width: 30%
}
</style>
</head>
<body>
	<div>
		<h2>방명록</h2>
		<hr>
		<form method="post">
		<div><p>[<a href="write.jsp">방명록 쓰기</a>]</p></div>
			<table>
				<thead>
					<tr style="background-color: skyblue;">
						<th style= "width:20%;">번호</th><th>작성자</th><th>제목</th><th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var = "k" items="${list}">
						<tr>
							<td>${k.idx}</td>
							<td>${k.name}</td>
							<%--상세페이지로 가기--%>
							<td style="text-align: center;"><a href="onelist.jsp?idx=${k.idx}">${k.subject}</a></td>
							<td>${k.reg}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>