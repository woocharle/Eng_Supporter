<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Engineering Support</title>
	<style type="text/css">
		.revise {position: relative; top: 50px; margin: 0px auto; width:1500px; height: 1500px;}
		.revise p{text-align: center;}
		.revise h3{font-size: 30px; margin-bottom: 50px;}
		.revise table{width: 850px; border-collapse:collapse; margin: 0px auto; }	
		.revise td{height: 35px; border: 1px solid black;}
		.revise input{font-size: 20px; text-align: center;}
	
		.tb{width: 30%; text-align: left; background-color: #333; color: white; padding-left: 20px;}
		.ti{text-align: center;}
		
		textarea {font-size: 16px; }
		
	</style>
	<script type="text/javascript">
		
		function revise_ok(f){
			if (f.m_pass.value == f.m_pw0.value) {
				var chk = confirm("수정할까요?");
				if(chk){
	 				f.action="admin_update.do";
					f.submit(); 
				} else {
					return;
				}		
				
			} else{
				alert("비밀번호를 다시 확인 하십시오.");
				f.m_pass.focus();
				return;				
			}			
		}	
	
		function reset_ok(f) {
			f.action="admin_page2.do";
			f.submit(); 
		}
	
	</script>
</head>
<body>
	<c:if test="${finish eq 'ok'}"><jsp:include page="../view_admin/alarm.jsp"/></c:if>
	<div class="revise" align="center">
		<h3>개인정보 및 변경</h3>
		<form method="post">
			<table>
				<tbody>
					<tr>
						<td class="tb">이름</td>
						<td class="ti"><input type="text" id="이름" name="m_name" value="${vo1.m_name}" readonly="readonly"></td>
					</tr>	
					<tr>
						<td class="tb">소속</td>
						<td class="ti"><input type="text" id="소속" name="m_com" value="${vo1.m_com}"></td>
					</tr>					
					<tr>
						<td class="tb">이메일</td>
						<td class="ti"><input type="text" id="이메일" name="m_email" value="${vo1.m_email}"></td>
					</tr>	
					<tr>
						<td class="tb">연락처</td>
						<td class="ti"><input type="text" id="연락처" name="m_phone" value="${vo1.m_phone}"></td>
					</tr>
					<tr>
					<tr>
						<td class="tb">자기소개</td>
						<td class="ti"><textarea cols="75" rows="10" name="m_content">${vo1.m_content}</textarea></td>
					</tr>	
					<tr>
						<td class="tb">현재 비밀번호</td>
						<td class="ti"><input type="password" id="비밀번호" name="m_pass">
							<input type="hidden" id="비밀번호" name="m_pw0" value="${vo1.m_pw}"/>
						</td>
					</tr>	
					<tr>
						<td class="tb">비밀번호</td>
						<td  class="ti"><input type="password" id="비밀번호" name="m_pw"></td>
					</tr>	
					<tr>
						<td class="tb">비밀번호 확인</td>
						<td class="ti"><input type="password" id="비밀번호 확인" name="chk" ></td>
					</tr>						
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" class="ti">
							<input type="button" value="수정" style="width:100px;" onclick="revise_ok(this.form)">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" value="취소" style="width:100px;" onclick="reset_ok(this.form)">
							<input type="hidden" name="idx" value="${vo1.idx}">
						
						</td>
					</tr>
				</tfoot>
			</table>
		</form>	
	</div>
</body>
</html>