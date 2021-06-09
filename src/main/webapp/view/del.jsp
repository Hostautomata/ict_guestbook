<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</style>
<script type="text/javascript">
	function delete_ok(f) {
		if("${param.pw}" == f.pw.value){
			var chk = confirm("정말삭제할까요?");
			if(chk){
				f.action="delete_ok.jsp";
				f.submit();
			}else{
				history.go(-1);
			}
		}else{
			alert("비밀번호틀림");
			f.pw.value="";
			f.pw.focus();
			return;
		}
	}
</script>
</head>
<body>
   <div>
	<h2>방명록:삭제화면</h2>
	<hr>
	<div><p>[<a href="list.jsp">게시물목록으로</a>]</p></div>
		<form  method="post">
			<fieldset>
			 		비밀번호 : <input type="password" name="pw"  placeholder="비밀번호 입력하세요">
			 	<input type="button" value="삭제하기" onclick="delete_ok(this.form)">
			 	<input type="hidden" name="idx" value="${param.idx }">
			 </fieldset>
		</form>
	</div>
</body>
</html>