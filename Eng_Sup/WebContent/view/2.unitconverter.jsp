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
		.unit > h2{
			position: relative;
			left: 100px;
			font-size: 40px; 
			margin: 20px 0px 80px 0px;
		}
		.unit > p{margin: 90px 0px;}
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
		
		#unitcvt{
			margin: 0px auto; 
			width: 1200px; 
			height: 400px;
			border: 1px solid black;
		}
		
		#section1{
			position: relative;
			left: 50px;
			top: 45px;
		}
		
		#choice{width:200px; height: 30px; font-size: 18px;}
	</style>
	<script type="text/javascript">
					
						
					
	</script>
</head>
<body>

	<jsp:include page="0.header.jsp" />

	<br><br>
	<div class ="unit">
		<h2> Unit Converter</h2>
		<form method="post">
			<input id="add_chart" type="button" value="Add Chart" onclick="">
			<input id="del_chart" type="button" value="Delete Chart" onclick="Add_go(this)">
		</form>
		<p></p>
	</div>
	
	
	<div class ="unit">
		<c:forEach var="i"  begin="1" end="${table}">
			<div id="unitcvt">
				<form method="post">
				<div id="section1"> 
					<span style="font-size: 20px;">거주지 :&nbsp;&nbsp;</span> 
					<select id="choice"> <!-- 하나만 선택 -->
	  	  			   <option value="len" selected>길이 (Length)</option>
		               <option value="vel"> 속도 (Velocity)</option>		  	
	  	 			   <option value="temp"> 온도 (Temperature)</option>
	  	 			   <option value="press">압력 (Pressure)</option>
	  	 			   <option value="weight">무게 (Weight)</option>
			  		 </select>
			  	</div>
				</form>
				
				<div>
					<%
						page
					%>
										
				
				</div>
				
			</div>
			<br><br><br><br>
		</c:forEach>		
	</div>
	
	<br><br>
	
	<jsp:include page="0.footer.jsp"/>
</body>
</html>