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
		.revise h3{position: relative; left: 60px; font-size: 30px; margin-bottom: 50px;}
		.revise table{position: relative; left: 80px; font-size: 20px; 
					margin-bottom: 50px; width: 850px;
					border-collapse:collapse; }	
		.revise td{height: 35px; border: 1px solid black;}
		.revise input{font-size: 20px; text-align: center;}
	
		.tb{width: 30%; text-align: left; background-color: #333; color: white; padding-left: 20px;}
		.ti{text-align: center;}
		
		textarea {font-size: 16px; }
		
	</style>
	<script type="text/javascript">
		
		function revise_ok(f){
			var chk = confirm("정말 수정할까요?");
			if(chk){
/* 				f.action="revise.do";
				f.submit(); */
			} else {
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
	<div class="revise">
		<h3>개인정보 및 변경</h3>
	
		<form method="post">
			<table>
				<tbody>
					<tr>
						<td class="tb">이름</td>
						<td class="ti"><input type="text" id="이름" name="m_name" value="${mvo.m_name}"></td>
					</tr>	
					<tr>
						<td class="tb">소속</td>
						<td class="ti"><input type="text" id="소속" name="m_com" value="${mvo.m_com}"></td>
					</tr>					
					<tr>
						<td class="tb">이메일</td>
						<td class="ti"><input type="text" id="이메일" name="m_email" value="${mvo.m_email}"></td>
					</tr>	
					<tr>
						<td class="tb">연락처</td>
						<td class="ti"><input type="text" id="연락처" name="m_phone" value="${mvo.m_email}"></td>
					</tr>
					<tr>
					<tr>
						<td class="tb">자기소개</td>
						<td class="ti"><textarea cols="75" rows="10" name="m_content">${mvo.m_content}</textarea></td>
					</tr>						
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" class="ti">
							<input type="button" value="수정" style="width:100px;" onclick="revise_ok(this.form)">
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