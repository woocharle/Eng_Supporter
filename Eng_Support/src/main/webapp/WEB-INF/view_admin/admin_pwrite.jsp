<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		table{width: 1000px; border-collapse: collapse;}
		td {border: 1px solid black; text-align: center;}
		table tr {margin: auto;}
		textarea{width:800px; font-size: 18px;}
		.tb{background-color: #333; color: white; width:30%;}
	</style>
	<script type="text/javascript">
		function save_ok(f) {
			f.action="pwrite_ok.do";
			f.submit();
		}
		

	</script>
</head>
<body>
	<div align="center">
	<h2>방명록 : 작성화면</h2>
	<hr>
	<p>[<a href="plist_go.do">목록으로 이동</a>]</p>
	<form method="post" enctype="multipart/form-data">
		<table>
			<tbody>
				<tr>
					<td class="tb">제 품</td>
					<td><input type="text" name="unit"></td>
				</tr>
				<tr align="center">
					<td class="tb">간단한 설명</td>
					<td><textarea rows="10" name="content_s"></textarea></td>
				</tr>	
				<tr>
					<td class="tb">첨부파일</td>
					<td><input type="file" name="file" size="20"></td>
				</tr>	
				<tr>
					<td class="tb">자세한 설명</td>
					<td>
						<script src="https://cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
						 <textarea name="content"></textarea>
                		 <script >
                        		CKEDITOR.replace( 'content' );
                		</script>
                	</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="저장" onclick="save_ok(this.form)"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="취소"/>
					</td>
				</tr>
			</tfoot>
		
		</table>
	
	</form>
	
	
	</div>
</body>
</html>