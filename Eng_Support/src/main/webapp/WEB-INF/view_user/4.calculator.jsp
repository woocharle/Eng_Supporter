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
		
		.intro{width: 75%; height: 1400px; position: relative; left: 400px; bottom: 1520px; overflow: auto;}
		
		
		 h2 {position: relative; left: 20px; font-size: 40px;}
		.browser{position: relative; left: 60px; }
		.browser h3{position: relative; font-size: 30px; margin-bottom: 40px;}
		.browser h4{position: relative; left: 40px; font-size: 25px; margin-bottom: 30px;}
		.browser p{position: relative; left:60px; font-size: 22px; margin-bottom: 30px; width:950px;}

		
		#simple{width: 75%; height: 1400px; position: relative; left: 400px; bottom: 1420px;}
		#simple h3{position: relative; font-size: 30px; left: 60px;}
		#simple table{position: relative; left: 90px; font-size: 20px; margin-bottom: 50px;}
		#simple input{width: 100px;}
		
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
		function sphere_cal(f) {
			
		}
		
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
			<h2>Introduce </h2>
			
			<article class="browser">
				<h3>Hydraulic</h3>
				<h4>Line Hydraulic</h4>
					<p>
						&lt;사용 목적&gt;<br>
						측정한 Line을 지나갈 때 높이 수드 및 마찰 손실 수두 합한 총 손실 수두를 구하는 것이다. 
					</p>
			
				<h4>Pump Hydraulic</h4>
					<p>
						&lt;사용 목적&gt;<br>
  						Pump는 NPSHA, Suction Pressure, Discharger Pressure과 Difference Head 등 Process 관련 
  						Specification을 기계팀에서 제시하여 펌프 Vender와 협의하여 Pump를 제작할 수 있도록 한다. 
  						<br><br>
  						&lt;주요 용어&gt;<br>
  						- NPSHA:  펌프의 공동화현상(Cavitaion)의 발생 가능성을 점검하는 척도  <br>
  						- Cavitation: 유체의 속도 변화로 인한 압력변화로 기포가 생기는 현상 impeller를 손상시킨다.<br>
  						- Suction Press: Pump에 압력 변화<br>
  						- Discharge Press: Pump가 유체를 전송할 Vessel로 보내는데 필요한 압력. <br>
  						- Differential Head: Discharge Press - Suction Press
					</p>
				
				<h4>PSV Hydraulic</h4>
					<p>
						PSV(Pressure Safety Valve)는 Vessel 내부 압력이 설계한 압력을 초과하여 기체를 다른 Vessel에 
						보낼 경우에만 Open을 한다.<br>
						PSV가 Suction을 하거나 Discharge할 때 손실 되는 수두가 커지면 Vessel 및 PSV가 손상이 될 수 
						있기 때문에 Line의 Size 및 길이를 조정해야 된다.
					</p>
			
				<h4>Notice</h4>
					<p>
						기체와 액체의 혼합인 2Phase일 때 계산하는 경우가 있는데 Open이 잘 되지 않아서 찾기 힘들고 비용을 
						지불해야되는 자료가 있어서 구현하지 못했다.<br>
					 	Non-Newton fluid는 Newton fluid 나 Newton fluid와 거의 비슷한 양상을 보이는 fluid와
					 	Reynolds Number를 구하는 방법이 다르다. Non-Newton fluid의 Reynolds Number를 구하는 공식을 찾고
					 	정리하는데 시간이 많이 소요되서 정리가 되면 올릴 예정이다. 				
					</p>
					<br>
			</article>
			<article class="browser">
				<h3>Heat Transfer</h3>
				<h4>Pipe Heat Transfer</h4>
					<p>
						&lt;사용 목적&gt;<br>
						파이프가 지나가면 외부와 열교환을 하는 데 열에 의해 부피가 팽창되거나 상(Phase)가 변할 수 있는 
						fluid가 있기 때문에 그에 대한 조치가 필요여부를 판단하는데 필요하다. 
					</p>
				<h4>Tank Heat Transfer</h4>
					<p>
						&lt;사용 목적&gt;<br>
						Tank에 있는 fluid가 열교환을 하는데 그것으로 팽창을 하거나 수축을 하여 내부 압력에 영향을 줄 정도로
						팽창과 수축에 압력이 잘 변하는 fluid가 있다. 그래서 Heating Coil로 온도를 유지하기 위해 계절에 따른 
						온도 변화량을 측정하는 것이다.
					</p>
			
			</article>


			<article class="browser">
				<h3>참고문헌</h3>
				<p>
					Wiki백과사전<br>
					
				</p>
			
			</article>
		</div>
	</c:if>
	
	<c:if test="${cal eq 'simcal'}">
		<div id="simple" >
			<h3>Simple Calculation</h3>
			<form method="post">
			<table style="width:600px;">
				<thead>
					<tr>
						<th style="width:40%;"></th><th style="width:5%;"></th><th></th><th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td> Sphere </td><td></td><td colspan="2"><span style="font-weight: bold;">Input</span></td>
					</tr>
					<tr>
						<td rowspan="5" style="width:100px;"><img alt="sphere" src="resources/upload/sphere.png"></td><td></td>
						<td style="height: 42px;">Diameter</td><td><input type="number" name="sphere_dia">&nbsp;&nbsp;m</td>
					</tr>
					<tr>
						<td style="height: 42px;"></td><td>Wet Length</td><td><input type="number" name="sphere_wet1">&nbsp;&nbsp;m</td>
					</tr>
					<tr>
						<td></td><td><span style="font-weight: bold;">Output</span></td><td></td>
					</tr>
					<tr>
						<td style="height: 42px;"></td><td>Area</td><td><input type="number" name="sphere_Area">&nbsp;&nbsp;m<sup>2</sup></td>
					</tr>
					<tr>
						<td style="height: 42px;"></td><td>Wetted Area</td><td><input type="number">&nbsp;&nbsp;m<sup>2</sup></td>
					</tr>
					<tr>
						<td rowspan="2" style="text-align: center;">
						<input type="button" value="calculate" onclick="sphere_cal(this.form)" style="width: 150px; font-size: 20px;">
						<td style="height: 42px;"></td><td>Volume</td>
						<td><input type="number">&nbsp;&nbsp;m<sup>3</sup></td>
					</tr>
					<tr>
						<td style="height: 42px;"></td><td>Wetted Volume</td><td><input type="number">&nbsp;&nbsp;m<sup>3</sup></td>
					</tr>
		
				</tbody>
				
			</table>
			</form>
			<br><br>
	
			<form method="post">
			<table style="width:600px;">
				<thead>
					<tr>
						<th style="width:40%;"></th><th style="width:5%;"></th><th></th><th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td> Cylinder </td><td></td><td colspan="2"><span style="font-weight: bold;">Input</span></td>
					</tr>
					<tr>
						<td rowspan="6"><img alt="cylinder" src="resources/upload/cylinder.png"></td><td></td>
						<td style="height: 35px;">Diameter</td><td><input type="number">&nbsp;&nbsp;m</td>
					</tr>
					<tr>
						<td style="height: 35px;"></td><td>height</td><td><input type="number">&nbsp;&nbsp;m</td>
					</tr>
					<tr>
						<td style="height: 35px;"></td><td>Wet Length</td><td><input type="number">&nbsp;&nbsp;m</td>
					</tr>
					<tr>
						<td></td><td><span style="font-weight: bold;">Output</span></td><td></td>
					</tr>
					<tr>
						<td style="height: 42px;"></td><td>Area</td><td><input type="number">&nbsp;&nbsp;m<sup>2</sup></td>
					</tr>
					<tr>
						<td style="height: 42px;"></td><td>Wetted Area</td><td><input type="number">&nbsp;&nbsp;m<sup>2</sup></td>
					</tr>
					<tr>
						<td rowspan="2" style="text-align: center;">
						<input type="button" value="calculate" onclick="cylinder_cal(this.form)" style="width: 150px; font-size: 20px;">
						<td style="height: 42px;"></td><td>Volume</td>
						<td><input type="number">&nbsp;&nbsp;m<sup>3</sup></td>
					</tr>
					<tr>
						<td style="height: 42px;"></td><td>Wetted Volumn</td><td><input type="number">&nbsp;&nbsp;m<sup>3</sup></td>
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