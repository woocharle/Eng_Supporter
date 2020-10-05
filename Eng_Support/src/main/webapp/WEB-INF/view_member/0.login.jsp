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
		td{margin: 0px auto; text-align: center; padding: 8px; font-size: 20px;}
		td input {font-size: 20px; width: 200px;}
		.button{font-size: 20px; width: 100px;}
		
		#mydiv{margin-top: 60px; text-align: center;}
	
	</style>
	<script type="text/javascript">
		function login_go(f){
			f.action="login_ok.do";
			f.submit();
		}
		
		function join_go(f){
			f.action="join.do";
			f.submit();
		}
	
	</script>
</head>
<body>
	<c:if test="${finish eq 'ok'}"><jsp:include page="../view_admin/alarm.jsp"/></c:if>
	<div id="mydiv">
		<h3>[ <a href ="home.do">메인 메뉴로 이동 </a>]</h3>
		<form method="post">
			<table>
				<thead>
					<tr>
						<th colspan="2"><h2>로그인</h2></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="m_id" value="${id}"></td>
					</tr>	
					<tr>
						<td>패스워드</td>
						<td><input type="password" name="m_pw"></td>
					</tr>

				</tbody>
				<tfoot>
					<tr style="height: 40px;">
						<td colspan="2">
							<input type="button" class="button" value="로그인" onclick="login_go(this.form)">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" class="button" value="회원가입" onclick="join_go(this.form)">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<a href="find_go.do"> 아이디 및 비밀번호를 분실하신 경우 click</a>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>