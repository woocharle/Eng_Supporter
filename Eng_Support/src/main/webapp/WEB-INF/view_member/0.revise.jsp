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
			var chk = confirm("정말 수정할까요?");
			if(chk){
				f.action="revise.do";
				f.submit();
			} else {
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
						<th colspan="3"><h2>개인정보 및 변경</h2></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="tb">이름</td>
						<td><input type="text" id="이름" name="m_name" value="${mvo.m_name}"></td>
						<td></td>
					</tr>	
					<tr>
						<td class="tb">소속</td>
						<td><input type="text" id="소속" name="m_com" value="${mvo.m_com}"></td>
						<td></td>
					</tr>					
					<tr>
						<td class="tb">이메일</td>
						<td><input type="text" id="이메일" name="m_email" value="${mvo.m_email}"></td>
						<td></td>
					</tr>	
					<tr>
						<td class="tb">연락처</td>
						<td><input type="text" id="연락처" name="m_phone" value="${mvo.m_email}"></td>
						<td></td>
					</tr>
					<tr>
					<tr align="center">
						<td class="tb">자기소개</td>
						<td><textarea rows="10" name="m_content">${mvo.m_content}</textarea></td>
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