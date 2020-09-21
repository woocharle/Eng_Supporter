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
<jsp:include page="0.header.jsp"/>
<div class="all-browsers">
	<h2> Calculation </h2>
		
	<div id="list">	
		<ul id="list1">					
			<li><a href="cal.do?cal=Intro"> Intro </a>	</li>
			
			<li><a href="cal.do?cal=simcal"> Simple Calculation </a></li>
			<li>Hydraulic 
				<ul class="list2">
					<li><a href="cal.do?cal=linehyd"> Line Hydraulic </a></li>
					<li><a href="cal.do?cal=pumphyd"> Pump Hydraulic </a></li>
					<li><a href="cal.do?cal=psvhyd"> PSV Hydraulic </a></li>
				</ul>
			</li>
			<li>Heat Transfer
				<ul class="list2">
					<li><a href="cal.do?cal=phtrans"> Pipe Heat Transfer </a></li>
					<li><a href="cal.do?cal=thtrans"> Tank Heat Transfer </a></li>
				</ul>
			
			</li>	
		</ul>
	
	</div>
	
	<c:if test="${cal eq 'Intro'}">
		<div class="intro" >
			<h3>Introduce </h3>

			<article class="browser">
				<h3>Simple Calculation</h3>
				<p>
					구와 원통의 부피와 넓이를....
				</p>
			
			</article>
			
			<article class="browser">
				<h3>Hydraulic</h3>
				<h4>Line Hydraulic</h4>
					<p>
						
					</p>
			
				<h4>Pump Hydraulic</h4>
					<p>
						
					</p>
				
				<h4>PSV Hydraulic</h4>
					<p>
						
					</p>
				
			</article>
			
			<article class="browser">
				<h3>Heat Transfer</h3>
				<h4>Pipe Heat Transfer</h4>
					<p>
						
					</p>
				<h4>Tank Heat Transfer</h4>
					<p>
						
					</p>
			
			</article>


			<article class="browser">
				<h3>참고문헌</h3>
				<p>
					
				</p>
			
			</article>
		</div>
	</c:if>
	
	<c:if test="${cal eq 'simcal'}">
		<div class="intro" >
			<h3>Simple Calculation </h3>
			<form method="post">
			<table style="width:600px;">
				<tbody>
					<tr>
						<td> Sphere </td><td colspan="2">Input</td>
					</tr>
					<tr>
						<td rowspan="5" style="width:100px;"><img alt="sphere" src="resources/upload/sphere.png"></td>
						<td>Diameter</td><td><input type="number">m</td>
					</tr>
					<tr>
						<td>Wet Length</td><td><input type="number">m</td>
					</tr>
					<tr>
						<td>Output</td><td></td>
					</tr>
					<tr>
						<td>Area</td><td><input type="number">m<sup>2</sup></td>
					</tr>
					<tr>
						<td>Wetted Area</td><td><input type="number">m<sup>2</sup></td>
					</tr>
					<tr>
						<td rowspan="2"><input type="button" value="calculate">
						<td>Volumn</td>
						<td><input type="number">m<sup>3</sup></td>
					</tr>
					<tr>
						<td>Wetted Volumn</td><td><input type="number">m<sup>3</sup></td>
					</tr>
		
				</tbody>
				
			</table>
			</form>
			<br><br>
	
			<form method="post">
			<table style="width:600px;">
				<thead>
					<tr>
						<th style="width:40%"></th><th></th><th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td> Cylinder </td><td colspan="2">Input</td>
					</tr>
					<tr>
						<td rowspan="5"><img alt="cylinder" src="resources/upload/cylinder.png"></td>
						<td>Diameter</td><td><input type="number">m</td>
					</tr>
					<tr>
						<td>Wet Length</td><td><input type="number">m</td>
					</tr>
					<tr>
						<td>Output</td><td></td>
					</tr>
					<tr>
						<td>Area</td><td><input type="number">m<sup>2</sup></td>
					</tr>
					<tr>
						<td>Wetted Area</td><td><input type="number">m<sup>2</sup></td>
					</tr>
					<tr>
						<td rowspan="2"><input type="button" value="calculate">
						<td>Volumn</td>
						<td><input type="number">m<sup>3</sup></td>
					</tr>
					<tr>
						<td>Wetted Volumn</td><td><input type="number">m<sup>3</sup></td>
					</tr>
		
				</tbody>
				
			</table>
			</form>

			
		</div>
	</c:if>
	
	<c:if test="${cal eq 'linehyd'}"><jsp:include page="4.linehyd.jsp"/></c:if>
	<c:if test="${cal eq 'pumphyd'}"><jsp:include page="4.pumphyd.jsp"/></c:if>
	<c:if test="${cal eq 'psvhyd'}"><jsp:include page="4.psvhyd.jsp"/></c:if>
	<c:if test="${cal eq 'phtrans'}"><jsp:include page="4.pipeheat.jsp"/></c:if>
	<c:if test="${cal eq 'thtrans'}"><jsp:include page="4.tankheat.jsp"/></c:if>

</div>

<br>
	
<jsp:include page="0.footer.jsp"/> 


</body>
</html>