<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSTL: JSP 표준 태그 라이브러리(core) </title>
	</head>
	<body>
		<%--
			1. 라이브러리를 다운받아서 해당 프로젝트에게 저장한다. 
			   (tomcat.apache.org)
			2. 다운받은 라이브러리를 WEB-INF 안에 lib에 넣어주세요.
			3. page지시어 및에 taglib 지시어를 통해서 선언하고 사용한다.
			
			
	 	--%>
	 <h2> 1. Intro </h2>	
	 <h3>
	 	<%-- 변수 생성 --%>
	 	<c:set var="test" value="Hello JSP" />
	 
	 	<%-- 배열 생성 --%>
	 	<c:set var="arr" value= "김호중, 임영웅, 영탁, 이찬원"/>
	 	<c:set var="arr2" value= "김호중, 임영웅, 영탁, 이찬원/김희재, 장민호/정동원, 김성주"/>
	 
	 
	 
	 	<%-- 변수데이터 출력 --%>
	 	<li> <c:out value="test" /> </li>
	 	<li> <c:out value= "${test}" /> </li>
	 	<li>${test}</li> 
	 	
	 	<li> <c:remove var="test"/> </li>
	 	<li> <c:out value= "${test}" /> </li>
	 	<li>${test}</li>
	 	<hr>
	 	
	 	<c:if test="${5 > 4}" >
	 		<li> Hello JSP World </li>
	 	</c:if>
	 	
	 	<c:set var="sum" value = "88" />  
	 	
	 	<c:if test="${sum >= 90}">
	 		<li> 합격 </li>
	 	</c:if>
	 	<c:if test="${sum < 90}">
	 		<li> 불합격 </li>
	 	</c:if>
	 	
	 	<c:choose>
	 		<c:when test="${sum >= 90}"> <li> A </li></c:when>		
	 		<c:when test="${sum >= 80}"> <li> B </li></c:when>		
	 		<c:when test="${sum >= 70}"> <li> C </li></c:when>		
	 		<c:when test="${sum < 70}"> <li> F </li></c:when>		
	 	</c:choose>
	 	
	 	<c:forEach begin="0" end = "10" step = "1" var = "i">
	 		${i} &nbsp;&nbsp;
	 	</c:forEach>
	 	
	 	<br>
	 	
	 	<c:forEach begin="0" end = "10" step = "1" var = "i">
	 		<c:if test="${i % 2 == 0}">
	 			${i} &nbsp;&nbsp;
	 		</c:if>
	 		
	 	</c:forEach>
	 	
	 	<br>

	 	<c:forEach begin="20" end = "29" step = "1" var = "i" varStatus="vs">
	 		${i} / ${vs.index} / ${vs.count} / ${vs.first} / ${vs.last} <br>
	 	</c:forEach>
	 	
	 	<br>
	 	
	 	<c:forEach var="k" items="${arr}">
	 		${k} &nbsp;&nbsp;
	 	</c:forEach>
	 	
	 	<br>
	 	
	 	<c:forTokens var="k" items="${arr2}" delims="/ ,">
	 		${k} &nbsp;&nbsp;
	 	</c:forTokens>
	 </h3>
	 
	 <h2> 2.페이지 이동 </h2>
	 <h3>
	 	<%-- 
	 		<jsp:forward page="Jsp08_1_1.jsp"/>
	 	--%>
	 	
	 	<%-- 
	 	<c:redirect url="Jsp08_1_1.jsp">
	 		<c:param name="name" value="마징가"></c:param>	 	
	 	</c:redirect>
	 	--%>
	 	
	 	<%request.setCharacterEncoding("UTF-8"); %>
	 	<jsp:forward page="Jsp08_1_1.jsp">
	 		<jsp:param value="아수라 백작" name="name"/>
	 	</jsp:forward>
	 	
	 	
	 </h3>	
	 	
	 	
	</body>
</html>