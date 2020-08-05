<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		.unit {margin: 0px auto; width: 1500px;}
		
		.unit>form>input {width: 180px;font-size: 20px;}
		
		#add_chart {
			position: relative;
			left: 1080px;
			bottom: 5px;
		}
		
		#del_chart {
			position: relative;
			left: 1120px;
			bottom: 5px;
		}
		
		#unitcvt{margin: 0px auto; width: 1200px; border: 1px solid black;}
		
	
	</style>
</head>
<body>

	<jsp:include page="0.header.jsp" />
	<br><br>
	<div class ="unit">
		<form method="post">
			<input id="add_chart" type="button" value="Add Chart" onclick="">
			<input id="del_chart" type="button" value="Delete Chart" onclick="Add_go(this)">
		</form>

	</div>
	
	<br><br>
	
	<div class ="unit">
		<div id="unitcvt">
			<p> ${table} </p>
			<p id=> 거주지 : <select name="addr"> <!-- 하나만 선택 -->
		  	  			   <option>::선택하세요::</option>
			               <option value="1">서울</option>		  	
		  	 			   <option >경기</option>
		  	 			   <option>제주</option>
		  	 			   <option>해외</option>	
		  				 </select>
		  	</p>
	
		</div>
	</div>


	<%-- 
	<c:forEach >
		일단 테이블 만들기, MVC 패턴으로 만들기, 추가 및 삭제시 DB를 따로 만들것.
	</c:forEach>
	--%>	

	<jsp:include page="0.footer.jsp"/>
</body>
</html>