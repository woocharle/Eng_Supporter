<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> Engineering Support </title>
	<style type="text/css">
		#unit1 {margin: 0px auto; width: 1500px; margin-bottom: 10px;}
		#unit1 h2{position: relative;left: 100px; font-size: 40px; margin: 20px 0px 80px 0px;}
		#unit1 input{width:180px; font-size: 25px;}
		
		
		#unit2 {margin: 0px auto; width: 1500px; padding-top:20px;  margin-bottom: 40px; overflow: auto;}
		#unit2 input {width: 180px; height: 35px; font-size: 20px;}
		
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
			f.action = "unit1.do";
			f.submit();
		}	
		
		function add_go(f){
			f.action = "unit2.do";
			f.submit();
		}					
		
		function del_go(f){
			f.action = "unit3.do";
			f.submit();
		}					
		
		function trans_go(f){
			f.action = "unit4.do";
			f.submit();
		}
		
		
	</script>
</head>
<body>

	<jsp:include page="0.header.jsp" />

	<br><br>
	<div id ="unit1">
		<h2>Unit Converter</h2>
		<form method="post">	
			<input type="hidden" name="table_1" value="${table}">
			<input id="add_chart" type="button" value="Add Chart" onclick="add_go(this.form)">
			<input id="del_chart" type="button" value="Delete Chart" onclick="del_go(this.form)">
		</form>
		<br>
	</div>
	
	
	<div id ="unit2">
		<c:forEach var="n"  items="${slist}">
			<c:if test="${idx eq n.idx}">
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
				<script type="text/javascript">
					$(function() {
						$("#auto").on("click", function() {
							var num = ${idx};
							$("#"+num).focus();
						});
						
						$("#auto").trigger("click");
					});

				</script>
				<div id="auto"></div>
				
			</c:if>
			<div id="unitcvt">
				<form method="post">
				<div id="section1"> 
					<span style="font-size:30px;">단위 :&nbsp;&nbsp;</span> 
					<select name="scala" id="choice" onchange="scala_go(this.form)"> <!-- 하나만 선택 -->
	  	  			   <option value="1" <c:if test="${n.scala eq '1'}"> selected </c:if>> 길이 (Length)</option>					
		               <option value="2" <c:if test="${n.scala eq '2'}"> selected </c:if>> 속도 (Velocity)</option>		  	
		               <option value="3" <c:if test="${n.scala eq '3'}"> selected </c:if>> 온도 (Temperature)</option>		  	
	  	 			   <option value="4" <c:if test="${n.scala eq '4'}"> selected </c:if>> 압력 (Pressure)</option>
	  	 			   <option value="5" <c:if test="${n.scala eq '5'}"> selected </c:if>> 무게 (Weight)</option>
			  		 </select>
			  		 <input type="hidden" name="idx" value="${n.idx}">
			 		 
			  	</div>
				
				<div id="inout">
					<div id="input">
						<span style="font-size:25px;">Input :&nbsp;&nbsp;</span>
						<input name="unit1" <c:if test="${idx eq n.idx}"> id="${idx}" </c:if> type ="text"  value="${n.unit1}" onchange="trans_go(this.form)">
					</div>
					<div id="Output">
						<span style="font-size:25px;">Output :&nbsp;&nbsp;</span>
						<input name="unit2" type ="text"  value="${n.unit2}" readonly="readonly">
					</div>
				</div>

		
				<select name="scala1" id="choice1" size="8" onchange="trans_go(this.form)">
					<c:forEach var="k" items="${n.list}" >
						
						<option value="${k}" <c:if test="${k eq n.scala1}"> selected </c:if>>${k}</option>
					
					</c:forEach>
				</select>
				
				<select name="scala2" id="choice2" size="8" onchange="trans_go(this.form)">
					<c:forEach var="k" items="${n.list}" >
						
						<option value="${k}" <c:if test="${k eq n.scala2}"> selected </c:if>>${k}</option>
					
					</c:forEach>
				</select>
		
				</form>
			</div>
			<br><br><br><br>
		</c:forEach>		
	</div>
	
	<br><br>
	
	<jsp:include page="0.footer.jsp"/>
</body>
</html>