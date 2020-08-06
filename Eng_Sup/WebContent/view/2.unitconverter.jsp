<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> Engineering Support </title>
	<style type="text/css">
		.unit {margin: 0px auto; width: 1500px;}
		.unit > h2{
			position: relative;
			left: 100px;
			font-size: 40px; 
			margin: 20px 0px 80px 0px;
		}
		.unit > p{margin-top: 60px;}
		.unit>form>input {width: 180px;font-size: 20px;}
		
		#add_chart {
			position: relative;
			left: 940px;
			bottom: 5px;
		}
		
		#del_chart {
			position: relative;
			left: 980px;
			bottom: 5px;
		}
		
		#unitcvt{
			margin: 0px auto; 
			width: 1200px; 
			height: 400px;
			border: 1px solid black;
		}
		
		#section1{position: relative; left: 50px; top: 45px;}
		
		#choice{width:250px; height: 40px; font-size: 30px;}
		
		#inout{position: relative; top: 90px; height:50px;}
		
		#input{position: relative; left: 50px; width:500px;}
		#input > input {height: 30px; width: 200px;}
		
		#Output{position: relative; left: 620px; bottom:40px; width:500px; }
		#Output > input {height: 30px; width: 200px;}
		
		#choice1{
			position: relative; left: 80px; top: 120px;
			width:250px; height: 150px; 
		}
		#choice1 > option {font-size: 30px;}
		
		#choice2{
			position: relative; left: 380px; top: 120px;
			width:250px; height: 150px; 
		}
		#choice2 > option {font-size: 30px;}
		
		
	</style>
	<script type="text/javascript">
		function scala_go(f){
			f.action = "/Controller?cmd=unit1"
			f.submit();
		}					
		
		
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
					<span style="font-size:30px;">단위 :&nbsp;&nbsp;</span> 
					<select name="scala" id="choice" onchange="scala_go(this.form)"> <!-- 하나만 선택 -->
	  	  			   <option value="1" <c:if test="${name eq '1'}"> selected </c:if>> 길이 (Length)</option>					
		               <option value="2" <c:if test="${name eq '2'}"> selected </c:if>> 속도 (Velocity)</option>		  	
	  	 			   <option value="3" <c:if test="${name eq '3'}"> selected </c:if>> 온도 (Temperature)</option>
	  	 			   <option value="4" <c:if test="${name eq '4'}"> selected </c:if>> 압력 (Pressure)</option>
	  	 			   <option value="5" <c:if test="${name eq '5'}"> selected </c:if>> 무게 (Weight)</option>
			  		 </select>
			  	</div>
				</form>
				
				<div id ="inout">
					<div id="input">
						<span style="font-size:25px;">Input :&nbsp;&nbsp;</span>
						<input name="in" type ="number">
					</div>
				
					<div id="Output">
						<span style="font-size:25px;">Output :&nbsp;&nbsp;</span>
						<input name="Out" type ="number" readonly="readonly">
					</div>
				</div>

				<div>
					<select name="scala1" id="choice1" size="8">
						<c:forEach var="k" items="${list}" >
							
							<option value="${k}">${k}</option>
						
						</c:forEach>
					</select>
					
					<select name="scala2" id="choice2" size="8">
						<c:forEach var="k" items="${list}" >
							
							<option value="${k}">${k}</option>
						
						</c:forEach>
					</select>
				</div>
				
			</div>
			<br><br><br><br>
		</c:forEach>		
	</div>
	
	<br><br>
	
	<jsp:include page="0.footer.jsp"/>
</body>
</html>