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
		table{width: 1150px; border-collapse:collapse; text-align: center;}
		table,th,td{border: 1px solid black; padding: 3px}
	</style>
	<script type="text/javascript">
		function update_go(f){
			f.action = "pupdate.do"
			f.submit();
		}
		function delete_go(f){		
			var chk = confirm("정말 삭제할까요?");
			if(chk){
				f.action="pdelete.do";
				f.submit();
			} else {
				
			}

		}
		
	</script>
</head>
<body>
	<div align="center">
		<h2> 방명록 : 내용 화면 </h2>
		<hr>
		<p>[ <a href ="plist_go.do">목록으로 이동 </a>]</p>
		<form method="post">
			<table>
				<tbody>
					<tr align="center">
						<td bgcolor="#99ccff">제품</td>
						<td>${pvo.unit}</td>
					</tr>
					<tr align="center">
						<td bgcolor="#99ccff">간단한 설명</td>
						<td style="padding:15px">
							<textarea style="width: 1000px;" rows="10" name="content_s" readonly="readonly">${pvo.content_s}</textarea>
						</td>
					</tr>					
					<tr align="center">
						<td bgcolor="#99ccff">첨부파일</td>
						<c:choose>
							<c:when test="${empty pvo.img}">
								<td> <b>이미지 파일 없음..</b></td>
							</c:when>
							<c:otherwise>
								<td>
									<img src="upload/${vo.img}" style="width: 150px"><a>${pvo.img}</a>
								</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td colspan="2" style="padding:15px"> 가격동향 및 자세한 설명 </td>
					</tr>
					<tr>
						<td colspan="2" style="padding:15px">
							<textarea style="width: 1000px;"rows="20"  name="content">${pvo.content}</textarea>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr align="center">
						<td colspan="2"> 
						    <input type="button" value="수정" onclick="update_go(this.form)" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="삭제" onclick="delete_go(this.form)" />
							<input type="hidden" name="idx" value="${pvo.idx}"/>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>