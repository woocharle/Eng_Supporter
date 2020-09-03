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
	<p>[<a href="/Controller?cmd=petro_list">목록으로 이동</a>]</p>
	<form method="post" enctype="multipart/form-data">
		<table>
			<tbody>
				<tr>
					<td class="tb">제 품</td>
					<td><input type="text" name="unit" size="20" ></td>
				</tr>
					<tr align="center">
						<td bgcolor="#99ccff">간단한 설명</td>
						<td style="padding:15px">
							<textarea style="width: 1000px;" rows="10" name="content_s"></textarea>
						</td>
					</tr>	
				<tr>
					<td class="tb">첨부파일</td>
					<td><input type="file" name="img" size="20"></td>
				</tr>	
				<tr>
					<td colspan="2" style="padding:15px">
						<textarea style="width: 1000px;"rows="20"  name="content"></textarea>
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