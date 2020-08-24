<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title> 방 명 록 </title>
	<style type="text/css">
		a { text-decoration: none;}
		table{width: 500px; border-collapse:collapse; }
		table,tr,td{border: 1px solid black; padding: 3px;}
	</style>
	<script type="text/javascript">
		function delete_ok(f) {		
			var chk = confirm("정말 삭제할까요?");
			if(chk){
				f.action="/Controller?cmd=pdelete";
				f.submit();
			} else {
				
			}
		
		}
		
		function delete_no(){
			window.history.go(-1);
		}
		
	</script>
</head>
<body>
	<div align="center">
		<h2>방명록 : 삭제화면</h2>
		<hr />
		<p>[<a href="/0722_MVC_Mybatis_02/MyController?cmd=list">목록으로 이동</a>]</p>
		<form method="post">
			<table>
				<tfoot>
					<tr align="center">
						<td colspan="2">
							<input type="button" value="삭제" onclick="delete_ok(this.form)" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="취소" onclick="delete_no()"/>
							<input type="hidden" name="idx" value="${vo.idx}"/>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>