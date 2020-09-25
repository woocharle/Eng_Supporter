<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> 석유화학제품 </title>
	<style>
		a { text-decoration: underline;}
		table{width: 1150px; border-collapse:collapse; text-align: center;}
		table,th,td{border: 1px solid black; padding: 3px}
		.tb{background-color: #333; color: white; width:30%;}
	</style>
	<script type="text/javascript">
		function update_go(f){
			if(f.pwd.value == f.admin_pass.value){
				f.action = "pupdate.do"
				f.submit();
			} else{
				alert("비밀번호가 일치하지 않습니다.");
				f.pwd.value = "";
				f.pwd.focus();
				return;
			}

		}
		
		function delete_go(f){		
			var chk = confirm("정말 삭제할까요?");
			if(chk){
				f.action="pdelete.do";
				f.submit();
			} else {
				return;
			}

		}
		
	</script>
</head>
<body>
	<div align="center">
		<h2> 방명록 : 내용 화면 </h2>
		<hr>
		<p>[ <a href ="plist_go.do?cPage=${cPage}">목록으로 이동 </a>]</p>
		<form method="post" enctype="multipart/form-data">
			<table>
				<tbody>
					<tr align="center">
						<td class="tb">제품</td>
						<td><input type="text" name="unit" value="${vo2.unit}" size="20"></td>
					</tr>
					<tr align="center">
						<td class="tb">간단한 설명</td>
						<td style="padding:15px">
							<textarea style="width: 1000px;" rows="10" name="content_s">${vo2.content_s}</textarea>
						</td>
					</tr>					
					<tr align="center">
						<td class="tb">첨부파일</td>
						<c:choose>
							<c:when test="${empty vo2.img}">
								<td> <b>이미지 파일 없음..</b></td>
							</c:when>
							<c:otherwise>
								<td>
									<img src="resources/upload/${vo2.img}" style="width: 150px"><a>${vo2.img}</a>
								</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr align="center">
						<td class="tb">첨부파일 변경</td>
						<td><input type="file" name="file"></td>
					</tr>
					<tr>
						<td colspan="2" class="tb"> 가격동향 및 자세한 설명 </td>
					</tr>
					<tr>
						<td colspan="2" style="padding:15px">
							<textarea style="width: 1000px;"rows="20"  name="content">${vo2.content}</textarea>
						</td>
					</tr>
					<tr align="center">
						<td class="tb">비밀번호 입력</td>
						<td>
							<input type="password" name="pwd">
							<input type="hidden" name="admin_pass" value="${admin_pass}">
						</td>
					</tr>
					
					
				</tbody>
				<tfoot>
					<tr align="center">
						<td colspan="2"> 
						    <input type="button" value="수정" onclick="update_go(this.form)" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="삭제" onclick="delete_go(this.form)" />
							<input type="hidden" name="idx" value="${vo2.idx}"/>
							<input type="hidden" name="img" value="${vo2.img}"/>
							<input type="hidden" name="cPage" value="${cPage}"/>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>