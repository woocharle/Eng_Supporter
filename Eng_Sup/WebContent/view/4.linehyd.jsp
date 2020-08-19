<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		.intro{width: 75%; height: 1400px; position: relative; left: 400px; bottom: 1430px;}
		.intro h3{position: relative; left: 50px; font-size: 30px; margin-bottom: 50px;}
		.intro table{position: relative; left: 60px; font-size: 20px; margin-bottom: 50px;}
	
		#add_chart1{position: relative; left: 950px; font-size: 20px; height: 30px; width: 100px;}
		#lhyd{position: relative; left: 50px; overflow: scroll; width: 1000px; height: 450px; border: 1px solid black;}
		#lhyd td{padding: 4px 8px; width:8%; font-size: 16px; text-align: center;}
	</style>
	<script type="text/javascript">
		function add_go(f) {
			f.action="/Controller?cmd=line";
			f.submit();
		}
	
	</script>
</head>
<body>
	<div class="intro">
		<h3>Line Hydraulic</h3>
		<c:forEach var="i" begin="1" end="${num}">
		
		<div>
			<form method="post">
				<input id="add_chart1" type="button" value="Add" onclick="add_go(this.form)"> 
				<input type="hidden" name ="cal" value="${cal}">
				<input type="hidden" name = "num" value="${num}">
				<br><br>
				<div id="lhyd">
					<table style="position: relative; left: 30px; margin-top: 20px; width: 1500px;">
						<thead>
							<tr>
								<td></td><td></td><td></td><td></td><td ></td><td></td>
								<td></td><td></td><td></td><td></td><td></td><td></td>
							</tr>
						</thead>
						<tbody>
							<tr> <!--1  -->
								<td style="font-size: 20px;">Line.No</td>
								<td colspan="2"><input type="text" name="#"></td>
								<td style="text-align: left;"><input type="button" value="Calculate"></td>
								<td colspan="8"></td>
								<!-- delete 버튼은 기능 설정 쯤 개시 -->
							</tr>
							<tr style="font-size: 20px;"> <!-- 2 -->
								<td>Process</td>
								<td>Phase</td>
								<td colspan="2"><select>
										<option>Liquid</option>
										<option>Vapor</option>
										<option>2 Phase (1)</option>
										<option>2 Phase (2)</option>
										<option>2 Phase (3)</option>
								</select></td>
								<td>Press</td>
								<td colspan="7" style="text-align: left;">
									<input type="radio" id="Inlet"name="press" value="Inlet" onclick=""> 
									<label for="Inlet">Inlet</label>
									<input type="radio" id="Outlet" name="press" value="Outlet" onclick="">
									<label for="Outlet">Outlet</label>
								</td>
								<!-- jstl로 readonly 지정  -->
							</tr>
							<tr> <!-- 3 -->
								<td>Flow rate (kg/hr)</td>
								<td>Over Design (%)</td>
								<td>Vapor Fraction</td>
								<td>Inlet Press (kg/cm2G)</td>
								<td>Outlet Press (kg/cm2G)</td>
								<td>Property</td>
								<td>Temperature (C)</td>
								<td>Density (kg/m3)</td>
								<td>Viscosity</td>
								<td>Molecular</td>
								<td>Compress fact</td>
								<td>Cp/Cv</td>
							</tr>
							<tr> <!-- 4 -->
								<td><input type="number" name="flow"> </td>
								<td><input type="number" name="over"> </td>
								<td rowspan="2"><input type="number" name="frac"> </td>
								<td rowspan="2"><input type="number" name="pin"> </td>
								<td rowspan="2"><input type="number" name="pout"> </td>
								<td>Liquid</td>
								<td><input type="number" name="ltemp"> </td>
								<td><input type="number" name="lden"> </td>
								<td><input type="number" name="lvis"> </td>
								<td colspan="3"></td>
								
							</tr>
							<tr> <!-- 5 -->
								<td><input type="number" name="flow"> </td>
								<td><input type="number" name="over"> </td>
							
								<td>Vapor</td>
								<td><input type="number" name="vtemp"> </td>
								<td><input type="number" name="vden"> </td>
								<td><input type="number" name="vvis"> </td>
								<td><input type="number" name="mol"> </td>
								<td><input type="number" name="compfact"> </td>
								<td><input type="number" name="cpcv"> </td>
							</tr>
							<tr> <!-- 6 -->
								<td>Press drop</td>
								<td>Total</td>
								<td>Friction</td>
								<td>Gravity</td>
								<td>press/100m</td>
								<td colspan="7"></td>
							</tr>
							<tr> <!-- 7 -->
								<td>kg/cm2G</td>
								<td><input type="number" name="tdp" value="#" disabled="disabled"></td>
								<td><input type="number" name="fdp" value="#" disabled="disabled"></td>
								<td><input type="number" name="gdp" value="#" disabled="disabled"></td>
								<td><input type="number" name="dplenth" value="#" disabled="disabled"></td>
								<td colspan="7"></td>
							</tr>
							<tr> <!-- 8  -->
								<td>Pipe Spec.</td>
								<td>Complex Factor</td>
								<td>
									<select name="cfactor" onchange="#">
										<!-- Fitting -->
										<option>Liquid</option>
										<option>Vapor</option>
										<option>2 Phase (1)</option>
										<option>2 Phase (2)</option>
										<option>Fitting</option>
									</select>
								
								</td>
							</tr>
							<tr> <!-- 9 -->
								<td>Line Size (inch)</td>
								<td>schedule or Class</td>
								<td>Inside of Dia </td>
								<td>Length of Pipe</td>
								<td>Wall Roughness</td>
								<td>Elevation Change</td>
								<td>Equivalent Length</td>
								<td colspan="5"></td>
							</tr>
							<tr> <!-- 10 -->
								<td>
									<select name="linesize" onchange="#">
										<!-- line -->
										<option value="">Liquid</option>
										<option value="">Vapor</option>
										<option>2 Phase (1)</option>
										<option>2 Phase (2)</option>
										<option>2 Phase (3)</option>
									</select>
								</td>
								<td>
									<select name="sch" onchange="#">
										<!-- line -->
										<option>Liquid</option>
										<option>Vapor</option>
										<option>2 Phase (1)</option>
										<option>2 Phase (2)</option>
										<option>2 Phase (3)</option>
									</select>
								</td>
								<td><input type="number" name="id" value="#" disabled="disabled"></td>
								<td><input type="number" name="pipelen"></td>						
								<td><input type="number" name="wall"></td>						
								<td><input type="number" name="Ele"></td>						
								<td><input type="number" name="Eqlenth" value="#" disabled="disabled"></td>						
								<td colspan="5"></td>
							</tr>
							<tr>  <!-- 11 -->
								<td>Fitting</td>
								<td colspan="7"></td>
								<td>Valve</td>
								<td colspan="3"></td>
							</tr>
							<tr> <!-- 12 -->
								<td>90 Elbow</td>
								<td>std(R/D=1)</td>
								<td><input type="number" name="elbow90_1"></td>
								<td>45 Elbow Thread</td>
								<td>std(R/D=1)</td>
								<td><input type="number" name="elbow45_1"></td>
								<td colspan="2">Tee(Through-branch as Elbow)</td>
								<td>Angle Valve 45</td>
								<td><input type="number" name="valve45"></td>
								<td>Ball Valve</td>
								<td><input type="number" name="bvalve"></td>
							</tr>
							<tr> <!-- 13 -->
							
							</tr>
							<tr> <!-- 14 -->
							
							</tr>
							<tr> <!-- 15 -->
							
							</tr>
							<tr> <!-- 16 -->
							
							</tr>
							<tr> <!-- 17 -->
							
							</tr>
							<tr> <!-- 18 -->
							
							</tr>
							<tr> <!-- 19 -->
							</tr>
							
							<tr> <!-- 20 -->
							
							</tr>
							
						</tbody>
					</table>
				</div>
			</form>
		</div>
		<br><br>
		</c:forEach>
	</div>		
	
</body>
</html>