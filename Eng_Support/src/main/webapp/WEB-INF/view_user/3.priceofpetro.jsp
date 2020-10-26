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
		  	height: 1550px;
			margin: 20px auto; 
			clear: none;
			
		}
		 h2 {position: relative; left: 20px; font-size: 40px;}
		.browser{position: relative; left: 60px; }
		
		 .intro{width: 75%; height: 1400px; position: relative; left: 400px; bottom: 1430px;}
		 .intro h3{position: relative; left: 50px; font-size: 30px; margin-bottom: 50px;}
		 .intro h4{position: relative; left: 10px; font-size: 25px; margin-bottom: 50px;}
		 .intro p{position: relative; left: 15px; font-size: 20px; margin-bottom: 50px;}
		 .intro pre{position: relative; left: 15px; font-size: 20px; margin-bottom: 50px; width:1000px;}
		 .intro img{position: relative; left: 15px; top: 20px; width: 800px; height: 650px;}
		 #price{width: 25%; height: 1400px; position: relative; left:10px;}
		 #price > h3{position: relative; left: 50px; font-size: 30px; margin-bottom: 50px;}
		 #price ul{list-style-type: none; height:1350px; border-right: 1px dashed black;}
		 #price li{font-size: 25px; font-weight: bold; margin: 30px 0px 30px 30px;}
		 
		 #content_s{
			white-space: pre-wrap; /* CSS3*/
			white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
			white-space: -pre-wrap; /* Opera 4-6 */
			white-space: -o-pre-wrap; /* Opera 7 */
			word-wrap: break-all; /* Internet Explorer 5.5+ */ 
		 }
		 
		 #content{
			position: relative; left: 20px; top: 40px; width:1000px; font-size: 18px;
		 }
		 		 
		 
		 #petro{text-decoration:none;}
		 #petro:link {color: black;}
		 #petro:visited {color: black;}
		 #petro:hover {color: black; text-decoration: underline;}
		
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">

		
	</script>
	
	
</head>
<body>
	<jsp:include page="0.header.jsp"/>
	<div class="all-browsers">
		<h2> Petroleum </h2>
			
		<div id="price">
			<h3>Price of Products</h3>	
			<form method="get">	
			<ul>			
				<c:forEach var="k" items="${plist}">
					<li><a id="petro" href="petro.do?unit=${k.unit}">${k.unit} </a></li>
				</c:forEach>
			</ul>
			</form>
		</div>
	
	<c:choose>
	<c:when test="${unit eq 'Intro'}">
		<div class="intro" >
			<h3>Introduce of Products</h3>
			<c:forEach var="k" items="${plist}">
			<c:choose>
			<c:when test="${k.unit ne 'Intro'}">
			<article class="browser">
				<h4>${k.unit}</h4>
				<pre id="content_s">${k.content_s}</pre>
			
			</article>
			</c:when>
			</c:choose>
			</c:forEach>
			<article class="browser">
				<h4>참고문헌</h4>
				<p>
					한국석유공사 (https://www.knoc.co.kr/)
				</p>
			
			</article>
		</div>
	</c:when>
	<c:otherwise>
		<div class="intro" >			
			<h3>${unit}</h3>
			<article class="browser">
			<img src="/resources/upload/${vo2.img}" >
				<p id="content">${vo2.content}</p>
			</article>
		</div>
	</c:otherwise>
		
	</c:choose>

	
</div>


<jsp:include page="0.footer.jsp"/> 


</body>
</html>