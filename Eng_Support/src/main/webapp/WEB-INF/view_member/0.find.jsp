<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> Engineering Support </title>
	<style type="text/css">
		table{margin:0px auto; width:400px;}
		td{margin: 0px auto; text-align: center;}
		
		#mydiv{margin-top: 60px;}
	
	</style>
	<script type="text/javascript">
		function send_go(f){
			f.action="send_mail.do";
			f.submit();
		}
			
	</script>
</head>
<body>
	<div id="mydiv">
		<form method="post">
			<table>
				<thead>
					<tr>
						<th colspan="2"><h2>이메일을 입력하시오.</h2></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2"><input type="text" name="m_email"></td>
					</tr>	
				</tbody>
				<tfoot>
					<tr style="height: 40px;">
						<td colspan="2">
							<input type="button" value="확인" onclick="send_go(this.form)">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>