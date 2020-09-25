<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Engineering Support</title>
	<style type="text/css">
		.fwrite{width: 75%; height: 1400px; position: relative; left: 400px; bottom: 1430px; text-align: center;}
		.faq h3{position: relative; left: 40px; font-size: 30px; margin-bottom: 50px;}
		.faq table{position: relative; left: 60px; font-size: 20px; margin-bottom: 50px;}	
	
	</style>
	<script type="text/javascript">
		function sendData(f) {			
			for (var i = 0; i < document.forms[0].elements.length; i++) {
				if (f.elements[i].value == "") {
					if( i == 1 ){
						alert("로그인을 하세요.");
					}
					if (i == 2 || i == 3){continue;}
						
					alert(f.elements[i].name + "를(을) 입력하세요");
					f.elements[i].focus();
					return;//수행 중단
				}
			}
			
			f.action="save_go.do"
			f.submit();
		}	
	</script>
</head>
<body>
	<div class="fwrite">
		<p>[<a href="mypage.do?page=faq&cPage=${cPage}"> 목록으로 가기 </a>]</p>
		<form method="post" enctype="multipart/form-data">
			<table style="width:700; align: center;">
				<caption  style=" font-size:20px; margin-bottom:10px;">게시판 글쓰기</caption>
				<tbody>
					<tr>
						<th>작성자</th>
						<td align="left"><input type="text" name="writer" value="${mvo.m_name}" readonly></td>
					</tr>
					<tr>
						<th>제목</th>
						<td align="left"> <input type="text" name="subject"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							 <script src="https://cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
							 <textarea name="content"></textarea>
		               		 <script>
		                       	CKEDITOR.replace('content');
		               		</script>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td align="left"><input type="password" name="pwd"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="입력" onclick="sendData(this.form)" /> 
							<input type="reset" value="취소" />
							<input type="hidden" name="mid" value="${mvo.idx}">
						</td>
					</tr>
		            </tbody>				
				</tbody>
			</table>
		
		</form>	
	
	</div>

</body>
</html>