<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		table{width: 500px; border-collapse: collapse;}
		table > thead{background-color: #99ccff; border: 1px solid black; text-align: center;}
		table, tr, td, th{border: 1px solid black; text-align: center;}
		table > tr {margin: auto;}
		.tb{background-color: #99ccff;}
	</style>
	<script type="text/javascript">
		function update_ok(f) {
			if(f.pwd.value == "${vo.pwd}"){
				f.action="/0722_MVC_Mybatis_02/MyController?cmd=update";
				f.submit();
				
			} else{
				alert("비밀번호가 틀립니다.");
				f.pw.focus();
				return;
			}
		}
		function update_no(f){
			f.action="/0722_MVC_Mybatis_02/MyController?cmd=onelist&idx=${vo.idx}"
			f.submit();
		}
	</script>
</head>
<body>
	<div align="center">
	<h2>방명록 : 수정화면</h2>
	<hr>
	<p>[<a href="/0722_MVC_Mybatis_02/MyController?cmd=list">목록으로 이동</a>]</p>
	<form method="post" enctype="multipart/form-data">
		<table>
			<tbody>
				<tr>
					<td class="tb">작성자</td>
					<td><input type="text" name="name" size="20" value="${vo.name}"></td>
				</tr>
				<tr>
					<td class="tb">제  목</td>
					<td><input type="text" name="subject" size="20" value="${vo.subject}"></td>
				</tr>
				<tr>
					<td class="tb">이메일</td>
					<td><input type="text" name="email" size="20" value="${vo.email}"></td>
				</tr>
				<tr>
					<td class="tb">첨부파일</td>
					<td><input type="file" name="filename" size="20">${vo.filename}</td>
				</tr>	
				<tr>
					<td class="tb">비밀번호</td>
					<td><input type="password" name="pwd" size="20" ></td>
				</tr>
				<tr>
					<td colspan="2" style="padding:15px">
						<textarea rows="10" cols="60" name="content">${vo.content}</textarea>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="수정" onclick="update_ok(this.form)"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="취소" onclick="update_no(this.form)"/>
						<input type="hidden" name="idx" value="${vo.idx}"/>
						<input type="hidden" name="filename0" value="${vo.filename}"/>
					</td>
				</tr>
			</tfoot>
		
		</table>
	
	</form>
	
	
	</div>
</body>
</html>