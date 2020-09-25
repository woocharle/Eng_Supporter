<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Engineering Support</title>
	<style type="text/css">
		.revise{width: 75%; height: 1400px; position: relative; left: 400px; bottom: 1430px;}
		.revise h3{position: relative; left: 40px; font-size: 30px; margin-bottom: 50px;}
		.revise table{position: relative; left: 60px; font-size: 20px; margin-bottom: 50px;}	
	
		.tb{width: 30%; text-align: left; background-color: #333; color: white;}
	
	</style>
	<script type="text/javascript">
		
		function revise_ok(f){
	
			if(f.m_pw.value == f.chk.value){
				f.action="revise2.do";
				f.submit();
			} else {
				alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
				f.m_pw.focus();
				return;
			}			
		}	
	
		function reset_ok(f) {
			f.action="join.do?page="+${page}
			f.submit();
		}
	
	
	</script>
</head>
<body>
	<c:if test="${finish eq 'ok'}"><jsp:include page="../view_admin/alarm.jsp"/></c:if>
	<div class="revise">
		<form method="post">
			<table>
				<thead>
					<tr>
						<th colspan="3"><h2>비밀번호 변경</h2></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="tb">현재 비밀번호</td>
						<td><input type="password" id="비밀번호" name="m_pass"></td>
						<td><input type="hidden" id="비밀번호" name="m_pw0" value="${mvo.m_pw}"></td>
						<td></td>
					</tr>	
					<tr>
						<td class="tb">현재 비밀번호</td>
						<td><input type="password" id="비밀번호" name="m_pw"></td>
						<td></td>
					</tr>	
					<tr>
						<td class="tb">비밀번호 확인</td>
						<td><input type="password" id="비밀번호 확인" name="chk" ></td>
						<td></td>
					</tr>	
					<tr><td colspan="3"></td></tr>
					<tr><td colspan="3"></td></tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="3">
							<input type="button" value="회원가입" style="width:150px;" onclick="revise_ok(this.form)">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" value="취소" style="width:150px;" onclick="reset_ok(this.form)">
					
						</td>
					</tr>
				</tfoot>
			</table>
		</form>	
	</div>

</body>
</html>