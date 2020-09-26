<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> Engineering Support </title>
	<style type="text/css">
		table{margin:0px auto; width:450px;}
		td{margin: 0px auto; text-align: center; padding: 8px; font-size: 20px;}
		td input {font-size: 25px; width:350px; text-align: center;}
		.button{font-size: 20px; width: 100px;}
		
		#mydiv{margin-top: 60px; text-align: center;}
	
	</style>
	<script type="text/javascript">
		function send_go(f){
			if(f.m_email.value == ""){
				alert("이메일 주소를 입력하시오.");
			}else{
				f.action="send_mail.do";
				f.submit();
			}
				
		}
			
	</script>
</head>
<body>
	<div id="mydiv">
		<h3>[ <a href ="login.do">이전화면으로 이동 </a>]</h3>
		<br>
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
					<tr><td colspan="2"></td></tr>
				</tbody>
				<tfoot>
					<tr style="height: 40px;">
						<td colspan="2">
							<input type="button" class="button" value="확인" onclick="send_go(this.form)">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>