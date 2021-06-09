<%@page import="com.ict.guestbook.DAO"%>
<%@page import="com.ict.guestbook.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
	<%
	request.setCharacterEncoding("utf-8");
	String idx = request.getParameter("idx");
	VO vo = DAO.getInstance().getDetail(idx);
	pageContext.setAttribute("vo", vo);
	%>
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
	text-align:left;
	padding: 10px 5px;
	border: 1px solid black;
	width: 500px;
	margin: auto;
}
th {background-color: skyblue;
	width: 30%
}

</style>
<script type="text/javascript">
function list_go(f) {
	f.action = "list.jsp";
	f.submit();
}
function update_go(f) {
	if("${param.pw}"==f.pw.value){
		f.action="update_ok.jsp";
		f.submit();
	}else{
		alert{"비밀번호 틀림"};
		f.pw.value="";
		f.pw.focus();
		return;
	}
}
</script>
</head>
<body>
	<div>
		<h2>방명록:수정화면</h2>
		<hr>
<div><p>[<a href="list.jsp">게시물목록으로</a>]</p></div>
		<form method="post">
			<table>
				<tbody>
					<tr>
						<th style="width:30%;">이름</th>
						<td><input type="text" name="name" value="${vo.name}"></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" value="${vo.subject}"></td>
					</tr>
					<tr>
						<th>email</th>
						<td><input type="email" name="email" value="${vo.email}"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pw"  ></td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" name="main" value="${vo.main}"></td>
						
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" style="text-align: center;">
						<input type="button" value="저장" onclick="update_go(this.form)">
						<input type="button" value="취소"	onclick="list_go(this.form)">
						
				</tfoot>
				
			</table>
		</form>
	</div>
</body>
</html>