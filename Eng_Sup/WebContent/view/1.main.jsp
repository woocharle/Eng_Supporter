<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> Engineering Support </title>
	<style type="text/css">
		.all-browsers {margin: 10px auto;}
		.all-browsers > .browser {
		  	padding: 5px;
		  	width:1500px;
			margin: 20px auto; 
		}
		.browser > h2 {
			font-size: 35px;
			position: relative;
			left: 50px;	
		}
		.browser > h3 {
			font-size: 25px;
			position: relative;
			left: 70px;
			padding: 10px 0px 20px 00px;
				
		}
		.browser > .sentence1{
			font-size: 24px;
			position: relative;
			margin: 50px 0px 10px 0px;
			left: 80px;	
		}
		.browser > .sentence2{
			font-size: 20px;
			position: relative;
			left: 80px;	
		}
		
		#img_s{
			font-size: 20px;
			position: relative;
			left: 600px;
			bottom: 380px;
		}

	</style>
	
</head>
<body>
<jsp:include page="0.header.jsp"/>

<div class="all-browsers">
	<article class="browser">
		<h2>Unit Converter</h2>
		<p class="sentence1">
			Unit(단위)은 물리량을 표시하는 문자 및 기호다. 각 국가 마다 달랐지만 글로벌화가 되면서 많은 국가들이 국제표준(SI)에 따른다. <br>
			하지만, 영연방 국가, 미국 등 영국에 영향을 받은 국가들은 British 단위를 지금도 쓰고 있기 때문에 설계를 할 때 트러블이 생기지 <br>
			않도록 단위환산을 해줘야한다. 
		</p>
		
	</article>
	<article class="browser" style=" height:500px;">
		<h2>Price of Petroleum</h2>
		
		<p class="sentence1" ><img src="" width="450px" height="350px"></p>
		<p id="img_s">
			 석유 가격이 미치는 영향은... <br>
		</p>
	</article>
	<article class="browser">
		<h2>Calculation</h2>

		<h3>Simple calculation</h3>
		<p class="sentence2"> 구와 원기둥의 높이와 부피등을 구하는 계산이다. </p>
			
		<h3>Hydraulic calculation</h3>
		<p class="sentence2"> 설계를 할 때 많이 하는 계산으로서.... </p>
		
		<h3>Heat Transfer</h3>
		<p class="sentence2"> 열관련... </p>

		
		
	</article>
</div>

<jsp:include page="0.footer.jsp"/>

</body>
</html>