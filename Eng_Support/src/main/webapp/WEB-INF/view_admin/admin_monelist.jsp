<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> 방 명 록 </title>
	<style>
		a { text-decoration: underline;}
		table{width: 600px; border-collapse:collapse; text-align: center;}
		table,th,td{border: 1px solid black; padding: 3px}
	</style>
	<script type="text/javascript">
		function delete_go(f){	
			if(f.pwd.value == f.admin_pass.value){
				var chk = confirm("정말 삭제할까요?");
				if(chk){
					f.action="pdelete.do";
					f.submit();
				} else {
					return;
				}
			} else{
				alert("비밀번호가 일치하지 않습니다.");
				f.pwd.value = "";
				f.pwd.focus();
				return;
			} 


		}
		
	</script>
</head>
<body>
	<div align="center">
		<h2> 방명록 : 회원관리 </h2>
		<hr>
		<p>[ <a href ="mlist_go.do">목록으로 이동 </a>]</p>
		<form method="post">
			<table>
				<tbody>
					<tr align="center">
						<td style="width:30%; background-color:#333; color: white;">회원이름 / 아이디</td>
						<td>${mvo.m_name}&nbsp;&nbsp;/&nbsp;&nbsp; ${mvo.m_id}</td>
					</tr>
					<tr align="center">
						<td style="color: white; background-color:#333;">비밀번호</td>
						<td>${mvo.m_pw}</td>
					</tr>	
					<tr align="center">
						<td style="color: white; background-color:#333;">소속</td>
						<td>${mvo.m_com}</td>
					</tr>					
					<tr align="center">
						<td style="color: white; background-color:#333;">전화번호</td>
						<td>${mvo.m_phone}</td>			
					</tr>
					<tr>
						<td style="color: white; background-color:#333;">이메일</td>
						<td>${mvo.m_email}</td>		
					</tr>
					<tr>
						<td style="color: white; background-color:#333;">요청사항 (삭제 / 분실)</td>
						<td>
							<c:choose> 
								<c:when test="${mvo.req_del ne null}">O</c:when>
								<c:otherwise>X</c:otherwise>
							</c:choose>&nbsp;&nbsp;/&nbsp;&nbsp;
							<c:choose> 
								<c:when test="${mvo.req_find ne null}">O</c:when>
								<c:otherwise>X</c:otherwise>
							</c:choose>
						</td>		
					</tr>
					
				</tbody>
				<tfoot>
					<tr align="center">
						<td style="color: white; background-color:#333;">비밀번호 입력</td>
						<td>
							<input type="password" name="pwd">
							<input type="hidden" name="admin_pass" value="${admin_pass}">
						</td>
					</tr>
					<tr align="center">
						<td style="color: white; background-color:#333;" colspan="2"> 
						    <input type="button" value="삭제" onclick="delete_go(this.form)" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="아이디/비번 전송" onclick="send_go(this.form)" />
							<input type="hidden" name="idx" value="${mvo.idx}"/>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>