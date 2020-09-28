<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Engineering Support</title>
	<style type="text/css">
		.fwrite{width: 75%; height: 1400px; position: relative; left: 400px; bottom: 1430px; text-align: center;}
		.fwrite p {font-size: 20px;}
		.fwrite h3{position: relative; left: 40px; font-size: 30px; margin-bottom: 50px;}
		.fwrite table{
				font-size: 22px; margin-bottom: 50px; margin: 0 auto;
				width:950px; height: 700px;  border-collapse: collapse;
		}	
		.fwrite input{font-size: 22px; text-align: center;}
		.fwrite textarea{font-size: 18px;}
		.fwrite th, td {border: 1px solid black; }
		.tf{background-color: #333; color: white; height: 45px; width: 20%; }
	
	</style>
	<script type="text/javascript">
		function sendData(f) {			
			for (var i = 0; i < document.forms[0].elements.length; i++) {
				if(i == 2){continue;}
				if (f.elements[i].value == "") {
					alert(f.elements[i].name + "를(을) 입력하세요");
					f.elements[i].focus();
					return;//수행 중단
				}
			}
			
			f.action="fsave_go.do"
			f.submit();
		}	
	</script>
</head>
<body>
	<div class="fwrite">
		<p>[<a href="mypage.do?page=faq&cPage=${cPage}"> 목록으로 가기 </a>]</p>
		<form method="post">
			<table>
				<caption  style=" font-size:30px; margin-bottom:10px; height: 60px;">게시판 글쓰기</caption>
				<tbody>
					<tr>
						<th class="tf">작성자</th>
						<td align="center"><input type="text" name="writer" value="${mvo.m_name}" readonly></td>
					</tr>
					<tr>
						<th class="tf">제목</th>
						<td align="center"> <input type="text" name="subject" style="width: 600px; text-align: left;"></td>
					</tr>
					<tr>
						<th style="background-color: #333; color: white;">내용</th>
						<td align="center">
							 <script src="https://cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
							 <textarea name="content"></textarea>
		               		 <script>
		                       	CKEDITOR.replace('content');
		                       	CKEDITOR.config.width = 700;
		                       	CKEDITOR.config.height = 450;
		               		</script>
						</td>
					</tr>
					<tr>
						<th class="tf">비밀번호</th>
						<td align="center"><input type="password" name="pwd"></td>
					</tr>
					<tr>
						<th class="tf">공개 여부</th>
						<td align="center">
							<input type="radio" name="open_close" value="open" > 
							<label for="open">공개</label>
							&nbsp;&nbsp;
							<input type="radio" name="open_close" value="close">
							<label for="close">비공개</label>							
						
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="입력" onclick="sendData(this.form)" /> 
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" value="취소" />
							<input type="hidden" name="m_idx" value="${mvo.idx}">
						</td>
					</tr>
		            </tbody>				
				</tbody>
			</table>
		
		</form>	
	
	</div>

</body>
</html>