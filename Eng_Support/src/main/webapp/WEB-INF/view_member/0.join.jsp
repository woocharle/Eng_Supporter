<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> Engineering Support </title>
	<style type="text/css">
		table{margin:0px auto; width:530px;}
		td{margin: 0px auto; text-align: center; padding: 8px; font-size: 20px;}
		td input {font-size: 20px; width:200px;}
		
		#mydiv{margin-top: 60px; text-align: center;}
	
	</style>
	<script type="text/javascript">
		function join_ok(f){
			for (var i = 0; i < document.forms[0].elements.length; i++) {
				if (f.elements[i].value == "") {						
					alert(f.elements[i].id + "를(을) 입력하세요");
					f.elements[i].focus();
					return;
				}
			}
			
			if(f.id_chk1.value == "yes"){
				if(f.id_chk2.value == "yes"){
					if(f.m_pw.value == f.chk.value){
						f.action="join_ok.do";
						f.submit();
					}else{
						alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
						f.m_pw.focus();
						return;
					}
				}else{
					alert("아이디가 중복됩니다.");
		
				}
				
			} else{
				alert("아이디 중복체크를 하시오.");

			}

		}
		
		function check_ok(f) {
			if(f.m_id.value == ""){
				alert("아이디를 입력하세요");
				f.m_pw.focus();
			} else{
				f.action = "duple_chk.do";
				f.submit();
			}
			
			
		}
		
		function reset_ok(f) {
			f.action="join.do"
			f.submit();
		}
		
	</script>
</head>
<body>
	<c:if test="${finish eq 'ok'}"><jsp:include page="../view_admin/alarm.jsp"/></c:if>
	<div id="mydiv">
		<h3>[ <a href ="login.do">이전화면으로 이동 </a>]</h3>
		<br>
		
		<form method="post">
			<table>
				<thead>
					<tr>
						<th colspan="3"><h2>회원가입</h2></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 30%; text-align: left;">이름</td>
						<td><input type="text" id="이름" name="m_name" value="${vo1.m_name}"></td>
						<td></td>
					</tr>	
					<tr>
						<td style="width: 30%; text-align: left;">소속</td>
						<td><input type="text" id="소속" name="m_com" value="${vo1.m_com}"></td>
						<td></td>
					</tr>	
					<tr>
						<td style="width: 30%; text-align: left;">아이디</td>
						<td><input type="text" id="아이디" name="m_id" value="${vo1.m_id}"></td>
						<td style="width: 20%"><input type="button" value="중복확인" style="width:100px;" onclick="check_ok(this.form)"></td>
					</tr>
					<c:if test="${id_chk1 eq 'yes'}">
						<tr>
							<td colspan="3">
								<input type="hidden" name="id_chk1" value="${id_chk1}">
								<input type="hidden" name="id_chk2" value="${id_chk2}">
								<c:if test="${id_chk2 eq 'yes' }"> 사용 가능한 아이디 입니다. </c:if>
								<c:if test="${id_chk2 eq 'no' }"> 중복 된 아이디가 있습니다. </c:if>
							</td>
						</tr>
					</c:if>
					<tr>
						<td style="width: 30%; text-align: left;">비밀번호</td>
						<td><input type="password" id="비밀번호" name="m_pw" value="${vo1.m_pw}"></td>
						<td></td>
					</tr>	
					<tr>
						<td style="width: 30%; text-align: left;">비밀번호 확인</td>
						<td><input type="password" id="비밀번호 확인" name="chk" ></td>
						<td></td>
					</tr>	
					
					<tr>
						<td style="width: 30%; text-align: left;">이메일</td>
						<td><input type="text" id="이메일" name="m_email" value="${vo1.m_email}"></td>
						<td></td>
					</tr>	
					<tr>
						<td style="width: 30%; text-align: left;">연락처</td>
						<td><input type="text" id="연락처" name="m_phone" value="${vo1.m_email}"></td>
						<td></td>
					</tr>	
					<tr><td colspan="3"></td></tr>
					<tr><td colspan="3"></td></tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="3">
							<input type="button" value="회원가입" style="width:150px;" onclick="join_ok(this.form)">
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