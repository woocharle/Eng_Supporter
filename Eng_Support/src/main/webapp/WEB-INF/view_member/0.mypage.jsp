<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> Engineering Support </title>
	<style type="text/css">
		.all-browsers {
		  	padding: 5px;
		  	width:1500px;
		  	height: 1500px;
			margin: 20px auto; 
			clear: none;
			
		}
		 h2 {position: relative; left: 20px; font-size: 40px;}
		.browser{position: relative; left: 60px; }
		.browser h4{position: relative; left: 40px;}
		
		 .intro{width: 75%; height: 1400px; position: relative; left: 400px; bottom: 1430px;}
		 .intro h3{position: relative; left: 40px; font-size: 30px; margin-bottom: 50px;}
		 .intro table{position: relative; left: 60px; font-size: 20px; margin-bottom: 50px;}
		
		 #list{width: 25%; height: 1400px; position: relative; left:10px;}
		 #list > h3{position: relative; left: 50px; font-size: 30px; margin-bottom: 50px;}
		 #list li{font-size: 20px; font-weight: bold; margin: 30px 0px 30px 30px;}
		 #list1 {list-style-type: none; height:1350px; border-right: 1px dashed black;}
		 .list2 > li {position:relative; right: 20px;}
		 
		 #list a{text-decoration:none;}
		 #list a:link {color: black;}
		 #list a:visited {color: black;}
		 #list a:hover {color: black; text-decoration: underline;}

	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		
		
	</script>
	
	
</head>
<body>
<jsp:include page="../view_user/0.header.jsp"/>
<div class="all-browsers">
	<h2> MyPage </h2>
		
	<div id="list">	
		<ul id="list1">					
			<li><a href="cal.do?cal=Intro"> FAQ </a></li>
			
			<li><a href="cal.do?cal=simcal"> 개인정보 수정 </a></li>
			
			<li><a href="cal.do?cal=linehyd"> 비고 </a> </li>
		</ul>
	
	</div>
	
	<c:if test="${cal eq 'Intro'}">
		<div class="intro" >

		</div>
	</c:if>
	
	<c:if test="${cal eq 'simcal'}">
		<div class="intro" >

		</div>
	</c:if>
	
</div>

<br>
	
<jsp:include page="../view_user/0.footer.jsp"/> 


</body>
</html>