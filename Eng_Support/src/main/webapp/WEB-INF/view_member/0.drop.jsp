<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Engineering Support</title>
	<style type="text/css">
		.drop{width: 75%; height: 1400px; position: relative; left: 575px; bottom: 1430px;}
		.drop h3{position: relative; left: 40px; font-size: 30px; margin-bottom: 50px;}
		.drop table{position: relative; left: 80px; font-size: 20px; 
					margin-bottom: 50px; width: 600px; border-collapse:collapse; }	
		.drop td{height: 50px; border: 1px solid black; text-align: center;}
		.drop input{font-size: 20px; text-align: center;}	
	
		.tb{width: 30%; text-align: left; background-color: #333; color: white;}
	
	</style>
	<script type="text/javascript">
		
		function drop_ok(f){
			if(f.m_pw.value == f.chk.value){
				f.action="drop2.do";
				f.submit();
			} else {
				alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
				f.m_pw.focus();
				return;
			}			
		}	
	
		function reset_ok(f) {
/* 			f.action="join.do?page="+${page}
			f.submit(); */
		}
	
	
	</script>
</head>
<body>
	<c:if test="${finish eq 'ok'}"><jsp:include page="../view_admin/alarm.jsp"/></c:if>
	<div class="drop">
		<form method="post">
			<table>
				<thead>
					<tr>
						<th colspan="3"><h2>비밀번호 변경</h2></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="tb">비밀번호</td>
						<td><input type="password" id="비밀번호" name="m_pass">
							<input type="hidden" id="비밀번호" name="m_pw0" value="${vo1.m_pw}"/>
						</td>
					</tr>	
				</tbody>
				<tfoot>
					<tr>
						<td colspan="3">
							<input type="button" value="삭제" style="width:100px;" onclick="drop_ok(this.form)">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" value="취소" style="width:100px;" onclick="reset_ok(this.form)">
					
						</td>
					</tr>
				</tfoot>
			</table>
		</form>	
	</div>

</body>
</html>