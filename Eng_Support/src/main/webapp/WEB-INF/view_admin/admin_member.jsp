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
		table{width: 800px; border-collapse:collapse; text-align: center;}
		table,th,td{border: 1px solid black; padding: 3px}
	</style>
</head>
<body>	
	<div align = "center">
		<h2> member </h2>
		<hr>
		<h3>[ <a href ="admin_main.do">메인메뉴로 이동 </a>]</h3>
		<form method = "post">
			<table>
				<thead>
					<tr style="background-color: #333; color: white;">
						<td>번호</td><td>아이디</td><td>이름</td><td>소속</td><td>아이디/비번 분실</td><td>삭제요청</td>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty mlist}">
							<tr>
								<td colspan="6"> <h2 style="text-align: center"> 자료가 존재하지 않습니다. </h2></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="k" items="${mlist}" varStatus="vs">
								<c:if test="${k.m_id ne 'admin'}">
								<tr>
									<td>${((paging.nowPage-1)*paging.numPerpage + vs.index)}</td>
									<td><a href="monelist.do?idx=${k.idx}&cPage=${paging.nowPage}">${k.m_id}</a></td>
									<td>${k.m_id}</td>
									<td>${k.m_com}</td>
									<td>
										<c:choose> 
											<c:when test="${k.req_find ne null}">O</c:when>
											<c:otherwise>X</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose> 
											<c:when test="${k.req_del ne null}">O</c:when>
											<c:otherwise>X</c:otherwise>
										</c:choose>
									</td>
								</tr>
								</c:if>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="6">
							<!-- 이전 -->
							<c:choose>
								<c:when test="${paging.beginBlock <= paging.pagePerBlock}">
									<span style="color:lightgray;">이전으로&nbsp;&nbsp;</span>						
								</c:when>
								<c:otherwise>
									<a href="mlist_go.do?cPage=${paging.beginBlock-paging.pagePerBlock}"><span style="color:black;">이전으로&nbsp;&nbsp;</span></a>
								</c:otherwise>
							</c:choose>		
							
							<!-- 페이지 번호 -->
							<c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}" step="1" var="k">
								<!-- 현재페이지이냐, 아니냐 구분 -->
								<c:choose>
									<c:when test="${k == paging.nowPage }">
										<font style="font-weight: bold;">${k}</font>
									</c:when>
									<c:otherwise>
										<a href="mlist_go.do?cPage=${k}"><font style="font-weight: bold; color: tomato">${k}</font></a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<!-- 이후-->
							<c:choose>
								<c:when test="${paging.endBlock >= paging.totalBlock}">
									<span style="color:lightgray;">&nbsp;&nbsp;다음으로</span>						
								</c:when>
								<c:otherwise>
									<a href="mlist_go.do?cPage=${paging.beginBlock+paging.pagePerBlock}"><span style="color:black;">&nbsp;&nbsp;다음으로</span></a>
								</c:otherwise>
							</c:choose>							
						</td>				
					</tr>
				</tfoot>
			</table>
		</form>
	
	</div>

</body>
</html>