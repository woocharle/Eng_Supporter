<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> Engineering Support </title>
	<style type="text/css">
		.all-browsers {margin: 10px auto; overflow: auto;}
		.all-browsers > .browser {
		  	padding: 5px;
		  	width:1500px;
			margin: 20px auto; 
		}
		.browser h2 {font-size: 40px; position: relative; left: 50px;}
		.browser h3 {font-size: 28px; position: relative; left: 70px; padding: 10px 0px 10px 00px;}

		#sentence1{font-size: 24px; position: relative; margin: 50px 0px 10px 0px; left: 80px;}
		#sentence2{font-size: 24px; position: relative; margin: 50px 0px 10px 0px; left: 80px;}
		
		.sentence3{font-size: 24px; position: relative; left: 80px;	width:1400px;}
		
		#img_i{position: relative; left: 90px;}
		#img_s{position: relative; left: 600px; font-size: 24px; bottom: 380px;}

	</style>
	
</head>
<body>
<jsp:include page="0.header.jsp"/>

<div class="all-browsers">
	<article class="browser">
		<h2>Unit Converter</h2>
		<p id="sentence1">
			Unit(단위)은 물리량을 표시하는 문자 및 기호다. 각 국가 마다 달랐지만 글로벌화가 되면서 많은 국가들이 국제표준(SI)에 따른다. <br>
			하지만, 영연방 국가, 미국 등 영국에 영향을 받은 국가들은 British 단위를 지금도 쓰고 있기 때문에 설계를 할 때 트러블이 생기지 <br>
			않도록 단위환산을 해줘야한다. 
		</p>
		
	</article>
	<article class="browser" style=" height:500px;">
		<h2>Price of Petroleum</h2>
		
		<p id="img_i" ><img src="" width="450px" height="350px"></p>
		<p id="img_s">
			 석유 가격이 우리 나라에 미치는 영향은 매우 크다. <br>
			 대표적인 석유 화학물질을 소개할 것이다.
		</p>
	</article>
	<article class="browser">
		<h2>Calculation</h2>

		<h3>Simple calculation</h3>
		<p class="sentence3"> 구와 원기둥의 높이와 부피등을 구하는 계산이다. </p>
			
		<h3>Hydraulic calculation</h3>
		<p class="sentence3"> 
			PFD 작성이 끝나고 Equipment와 Vessel의 Size, Operating Pressure 등을 구하고 나면 Hydraulic 계산을 한다. 
			Hydraulic 계산이 Equipment와 Vessel 설계만큼 중요한 이유는 펌프와 배관을 인체로 비유하면 심장과 핏줄과
			거의 비슷하기 때문이다.
			
		</p>
		
		<h3>Heat Transfer</h3>
		<p class="sentence3">
			유체는 Pipe, Tank 및 Vessel 등에 있어도 외부와 열교환을 한다. 온도에 따라 압력이나 상변화가 민감하지 
			않은 fluid가 있는 한편 민감한 fluid가 있다. 민감한 fluid는 Tank 및 Vessel의 내부 압력에 영향을 주거나 
			Pipe의 경우 2phase가 되서 자극을 받는 응력이 커지기 때문에 신경을 써야 된다.  
		</p>

		
		
	</article>
</div>

<jsp:include page="0.footer.jsp"/>

</body>
</html>