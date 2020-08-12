<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> Engineering Support_Admin </title>
	<style type="text/css">
		a { text-decoration: underline;}
		table{width: 500px; border-collapse:collapse; text-align: center;}
		table,th,td{border: 1px solid black; padding: 3px}
	</style>
</head>
<body>	
	<div align = "center">
		<h2> Petroleum </h2>
		<hr>
		<p>[ <a href ="view/write.jsp"> 석유화학제품 추가 </a>]</p>
		<form method = "post">
			<table>
				<thead>
					<tr bgcolor="#99ccff">
						<td>번호</td><td>제품</td>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty plist}">
							<tr>
								<td colspan="2"> <h2 style="text-align: center"> 원하는 자료가 존재하지 않습니다. </h2></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="k" items="${plist}" varStatus="vs">
								<tr>
									<td>${vs.count}</td>
									<td><a href="/Controller?cmd=onepick&idx=${k.idx}">${k.unit}</a></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2"> intro는 건들지 말것!!!</td>
					</tr>
				</tfoot>
			</table>
		</form>
	
	</div>

</body>
</html>