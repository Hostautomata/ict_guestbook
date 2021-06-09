<%@page import="com.ict.guestbook.DAO"%>
<%@page import="com.ict.guestbook.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");
	String idx = request.getParameter("idx");
	VO vo = DAO.getInstance().getDetail(idx);
	pageContext.setAttribute("vo", vo);
	//페이지 이동하면 request정보를 그대로 사용 하려면 forward사용해야함.
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
div {
	text-align: center;
	margin: 0px 100px;
	auto;
}

th, td {
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
	function update_go(f) {
		f.action="update.jsp";
		f.submit();
	}
	function delete_go(f) {
		f.action="del.jsp";
		f.submit();
		
	}
</script>
</head>
<body>
	<div>
	<h2>방명록:내용화면</h2>
		<hr>
		<div><p>[<a href="list.jsp">게시물목록으로</a>]</p></div>

		<form  method="post">
				<table>
					<tbody>
						<tr>
							<th style="width:40%">IDX</th><td>${vo.idx}</td>
						</tr>
						<tr>
							<th >작성자</th><td>${vo.name}</td>
						</tr>
						<tr>
							<th>제목</th><td>${vo.subject}</td>
						</tr>
						<tr>
							<th>email</th><td>${vo.email}</td>
						</tr>
						<tr >
							<td colspan="2">${vo.main}</td>
						</tr>
						
					</tbody>
						<tfoot>
							<tr>
								<td colspan="2" style="text-align: center;">
									<input type="button" value="수정" onclick="update_go(this.form)">
									<input type="button" value="삭제" onclick="delete_go(this.form)">
									<%--정보가 세션에 저장되어 있으므로 별도로 저장할 필요는 없다.
										수정과 삭제를 위해서는 id와 pw가 반드시필요하다.
									 --%>
									 <input type="hidden" name="idx" value="${vo.idx }">     
						    		<input type="hidden" name="pw" value="${vo.pw }"> 
								</td>
							</tr>
						</tfoot>
				</table>
		</form>
	</div>
</body>
</html>