<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Engineering Support</title>
	<style type="text/css">
		.intro{width: 75%; height: 1400px; position: relative; left: 400px; bottom: 1430px; overflow: auto;}
		.intro h3{position: relative; left: 50px; font-size: 30px; margin-bottom: 50px;}	
		.intro h4{position: relative; left: 60px; font-size: 25px; margin-bottom: 50px; font-weight: normal;}	
		#pspec{}
		
	</style>

    <script type="text/javascript">
		function press_go(f) {
			f.action="/Controller?cmd=line";
			f.submit();
		}
	
	</script>
</head>
<body>
	<div class="intro">
		<h3>Pump Hydraulic</h3>
			
		<h4>Pump Specification</h4>
			<form method="post">
			<input type="hidden" name ="cal" value="${cal}">
			<table id="pspec">
				<thead>
					<tr>
						<td><input name="pnum" type="number" value="${pnum}" onkeyup="press_go(this.form)"/></td>
					</tr>
					
					<c:forEach var="i" begin="1" end='${pnum}'>
						<tr>
							<td><input name="press" type="number"></td>
							
						</tr>
					</c:forEach>
					<tr>
						<td><input name="tpress" type="number" value="${k}"></td>
					</tr>
				</thead>
				
				<tbody>
					
				</tbody>
			</table>
			</form>
		<h4>Suction</h4>
		
		<h4>Discharge</h4>
	</div>
</body>
</html>