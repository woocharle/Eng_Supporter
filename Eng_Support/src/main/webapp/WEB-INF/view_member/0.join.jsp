<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> Engineering Support </title>
	<style type="text/css">
		table{margin:0px auto; width:400px;}
		td{margin: 0px auto; text-align: center;}
		
		#mydiv{margin-top: 60px;}
	
	</style>
	<script type="text/javascript">
		function join_ok(f){
			f.action="join_ok.do";
			f.submit();
		}
		
	</script>
</head>
<body>
	<div id="mydiv">
		<h3>[ <a href ="login.do">이전화면으로 이동 </a>]</h3>
		<br>
		<c:if test="${finish eq 'ok'}">
			<h3> 가입이 완료 되었습니다. 로그인 화면으로 이동해주십시오.</h3>
		</c:if>
		
		<form method="post">
			<table>
				<thead>
					<tr>
						<th colspan="2"><h2>회원가입</h2></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 40%">이름</td>
						<td><input type="text" name="m_id"></td>
					</tr>	
					<tr>
						<td style="width: 40%">소속</td>
						<td><input type="text" name="m_name"></td>
					</tr>	
					<tr>
						<td style="width: 40%">아이디</td>
						<td><input type="text" name="m_id"></td>
					</tr>	
					<tr>
						<td style="width: 40%">비밀번호</td>
						<td><input type="text" name="m_pw"></td>
					</tr>	
					<tr>
						<td style="width: 40%">이메일</td>
						<td><input type="text" name="m_email"></td>
					</tr>	
					<tr>
						<td style="width: 40%">연락처</td>
						<td><input type="text" name="m_phone"></td>
					</tr>	
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="button" value="회원가입" onclick="join_ok(this.form)">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" value="취소">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>