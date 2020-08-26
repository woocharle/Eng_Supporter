<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Engineering Support</title>
	<style type="text/css">
		.intro{width: 75%; height: 1400px; position: relative; left: 400px; bottom: 1430px; overflow: auto;}
		.intro table{margin-bottom: 20px;}
		.intro h3{position: relative; left: 50px; font-size: 30px; margin-bottom: 50px;}	
		.intro h4{position: relative; left: 60px; font-size: 25px; margin-bottom: 20px; font-weight: normal;}	
		#pspec{position: relative; left: 10px; width: 1000px; height: 270px;}
		#pspec td {position: relative; left: 60px; padding: 0.5px; font-size: 20px;}
		#pbasis1{position: relative; left: 10px; width: 1000px; height: 220px;}
		#pbasis1 td {position: relative; left: 60px; padding: 0.5px; font-size: 20px;}
		#pbasis2{position: relative; left: 10px; width: 1000px; height: 170px;}
		#pbasis2 td {position: relative; left: 60px; padding: 0.5px; font-size: 20px;}
		
		#suction{position: relative; left: 60px; overflow: scroll; height:750px; width: 1000px; border: 1px solid black;}
		#suction table{position: relative; left: 20px; padding: 0.5px; font-size: 20px; margin:5px;}
		#suction td {padding:5px;}
		#suction input{width: 80px;}
			
		#discharge{position: relative; left: 60px; overflow: scroll; height:1000px; width: 1000px; border: 1px solid black;}
		#discharge table{position: relative; left: 20px; padding: 0.5px; font-size: 20px; margin:5px; width:320px;}
		#discharge td {padding:5px;}
		
		.pspec1{width:120px;}
		.pspec2{width: 90px;}
		#combo1{width:140px; font-size: 22px;}
		.combo2{width:100px; font-size: 22px;}
		
		
	</style>

    <script type="text/javascript">
		function pumprev_go(f) {
			alert("테스트성공");
			
			/* 			
			f.action="/Controller?cmd=line&obj=rev";
			f.submit(); */
		}
	
	</script>
</head>
<body>
	<div class="intro">
		<h3>Pump Hydraulic</h3>
			
		<h4>Pump Specification</h4>
			<form method="post">
			<input type="hidden" name ="cal" value="${cal}">
			<table id="pspec">
				<thead>
						<td style="width:20%;"></td><td style="width:25%;"></td><td ></td>
						<td style="width:200px;"></td><td style="width:130px;"></td><td></td>
				</thead>
				<tbody>
					<tr>
						<td>Item No.</td><td><input type="text" name="item1" value="${hvo2.item1}" class="pspec1"  onkeyup="pumprev_go(this.form)"></td><td></td>
						<td>Net Suction Press</td><td><input type="text" name="psuc" value="${hvo2.psuc}" class="pspec2"  readonly> </td><td>kg/cm2</td>
					</tr>
					<tr>
						<td>Rev No.</td><td><input type="text" name="rev"  value="${hvo2.rev}" class="pspec1" onkeyup="pumprev_go(this.form)"></td><td></td>
						<td>NPSH Available</td><td><input type="number" name="npsh" value="${hvo2.npsh}" class="pspec2" readonly> </td><td>kg/cm2</td>
					</tr>
					<tr>
						<td>Component.</td><td><input type="text" name="comp" class="pspec1" value="${hvo2.comp}" onkeyup="pumprev_go(this.form)"></td><td></td>
						<td>Discharge Press</td><td><input type="text" name="pdis" class="pspec2" value="${hvo2.pdis}" readonly> </td><td>kg/cm2</td>
					</tr>
					<tr>
						<td>Type.</td>
						<td>
							<select name="ptype" id="combo1" onchange="pumprev_go(this.form)">
								<option value="centri" <c:if test="${hvo2.ptype eq 'centri'}"> selected </c:if>> Centrifugal </option>					
			               		<option value="rotary" <c:if test="${hvo2.ptype eq 'rotary'}"> selected </c:if>> Rotary</option>		  	
							</select>
						</td>
						<td></td>
						<td>Differential Press</td><td><input type="number" name="pdiff" class="pspec2" value="${hvo2.pdiff}" readonly > </td><td>kg/cm2</td>
					</tr>
					<tr>
						<td>Condition</td>
						<td>
							<input type="radio" id="Inlet"name="cdtn" value="Inlet" onclick="pumprev_go(this.form)" checked> 
							<label for="Exist">Exist</label>
							<input type="radio" id="Outlet" name="cdtn" value="Outlet" onclick="pumprev_go(this.form)">
							<label for="New">New</label>						
						</td>
						<td></td>
						<td>Differential Head</td><td><input type="number" name="hdiff" class="pspec2" value="${hvo2.hdiff}" readonly> </td><td>kg/cm2</td>
					</tr>
					<tr>
						<td colspan="3"></td>
						<td>Hydraulic Power</td><td><input type="number" name="hp" class="pspec2" value="${hvo2.hp}" readonly> </td><td>kg/cm2</td>
					</tr>
				</tbody>
			</table>
			</form>
			
		<h4>Basis</h4>
			<form method="post">
			<input type="hidden" name ="cal" value="${cal}">
			
			<table id="pbasis1">
				<thead>
						<td style="width:20%;">Depart (Suction)</td>
						<td style="width:25%;"><span style="position: relative; left:100px">Equip Item No.</span></td><td></td>
						<td style="width:200px;"><input type="text" name="item2" class="pspec1" value="${hvo2.item2}" onkeyup="pumprev_go(this.form)"></td>
						<td style="width:130px;"></td><td></td>
				</thead>
				<tbody>
					<tr>
						<td></td><td></td>
						<td colspan="4"></td>
					</tr>
					<tr>
						<td>Operating Press</td>
						<td><input type="number" name="op1" class="pspec1" value="${hvo2.op1}" onkeyup="pumprev_go(this.form)">&nbsp;&nbsp;&nbsp;kg/cm2G</td><td></td>
						<td>Min.Static Head</td><td><input type="number" name="minh" class="pspec2" value="${hvo2.minh}" onkeyup="pumprev_go(this.form)"></td><td>m</td>
					</tr>
					<tr>
						<td>Design press</td>
						<td><input type="number" name="dp1" class="pspec1" value="${hvo2.dp1}" onkeyup="pumprev_go(this.form)">&nbsp;&nbsp;&nbsp;kg/cm2G</td><td></td>
						<td>Max.Static Head</td><td><input type="number" name="maxh" class="pspec2" value="${hvo2.maxh}" onkeyup="pumprev_go(this.form)"></td><td>m</td>
					</tr>
					<tr>
						<td>Strainer</td>
						<td><input type="number" name="strainer" class="pspec1" value="${hvo2.strainer}" onkeyup="pumprev_go(this.form)">&nbsp;&nbsp;&nbsp;kg/cm2G</td><td></td>
						<td>Pump Shaft Level</td><td><input type="number" name="plevel" class="pspec2" value="${hvo2.plevel}" onkeyup="pumprev_go(this.form)"> </td><td>m</td>
					</tr>
					<tr>
						<td>Vapor Pressure</td><td><input type="number" name="vppress" class="pspec1" value="${hvo2.vppress}" onkeyup="pumprev_go(this.form)">&nbsp;&nbsp;&nbsp;kg/cm2G</td><td></td>
						<td>Elevation change</td><td><input type="number" name="elsuc" class="pspec2" value="${hvo2.elsuc}" readonly> </td><td>m</td>
					</tr>
				</tbody>
			</table>
			<br><br>
			<table id="pbasis2">
				<thead>
						<td style="width:20%;">Arrival (Discharge)</td>
						<td style="width:25%;"><span style="position: relative; left:100px">Equip Item No.</span></td><td></td>
						<td style="width:200px;"><input type="text" name="item2" class="pspec1" value="${hvo2.item2}" onkeyup="pumprev_go(this.form)"></td>
						<td style="width:130px;"></td><td></td>
				</thead>
				<tbody>
					<tr>
						<td>Elevation change</td><td><input type="text" name="elmax" class="pspec1" value="${hvo2.elmax}" readonly></td><td></td>
						<td>Operating Press</td><td><input type="number" name="op2" class="pspec2" value="${hvo2.op2}" onkeyup="pumprev_go(this.form)"></td><td>m</td>
					</tr>
					<tr>
						<td>Control Valve</td>
						<td>
							<input type="radio" id="Inlet"name="cvalve" value="Exist" onclick="pumprev_go(this.form)" checked> 
							<label for="Exist">Exist</label>
							<input type="radio" id="Outlet" name="cvalve" value="New" onclick="pumprev_go(this.form)">
							<label for="New">New</label>						
						</td>
						<td></td>
						<td>- Item.No</td><td><input type="text" name="citem" class="pspec2" value="${hvo2.citem}" onkeyup="pumprev_go(this.form)"></td><td>kg/cm2G</td>
					</tr>
					<tr>
						<td colspan="3"></td>
						<td>- Press Drop</td>
						<td><input type="number" name="cvp" class="pspec2" <c:if test="${pvo2.cvalve eq 'New'}"> readonly </c:if>
							<c:if test="${pvo2.cvalve eq 'Exist'}"> onkeyup='pumprev_go(this.form)' </c:if>> </td>
						
						<td>kg/cm2</td>
					</tr>
				</tbody>
			</table>
			
			</form>
		
		<h4>Suction</h4>
		<input type="button" value="calculate" onclick="#">
		<div id="suction" style="">
			<input type="hidden" name ="cal" value="${cal}">
			<form method="post">
			<table>
				<thead>
					<tr><td style="width:220px;'"></td><td style="width:100px;"></td>
						<c:forEach var="i" begin="1" end="4">
							<td></td>
						</c:forEach>
					</tr>
				</thead>
				<tbody>
					<tr><td>Line.No</td><td><input type="button" value="add" onclick="#" style="width:90px; font-size:18px"></td>
						<c:forEach var="i" begin="1" end="4">
							<td><c:if test="${i > 3}"><input type="button" value="delete" onclick="#"></c:if></td>
						</c:forEach>
					</tr>
					<tr><td>Pressure (In)</td><td>kg/cm2</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>
					</tr>
					<tr><td>Pressure (out)</td><td>kg/cm2</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td>Temperature</td><td>C</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td>Density</td><td>kg/m3</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>
					</tr>
					<tr><td>Viscosity</td><td>cP</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td>Process</td><td></td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td>Flow rate</td><td>kg/hr</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td>Over Design</td><td>%</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td>Complex factor</td><td></td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td>Line Size</td><td></td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td>Schedule or Class</td><td></td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td>Inside of Dia</td><td>m</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td>Length of Pipe</td><td>m</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td>Wall Roughness</td><td>m</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td>Elevation Change</td><td>m</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td>Fitting</td><td></td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td>90 Elbow</td><td></td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Threaded 
						<span style="position: relative; left:10px">Std</span></td>
						<td>(R/D=1)</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>						
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=1.5)</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					<tr>
					<tr><td style="position: relative; left:10px">- Flanged 
						<span style="position: relative; left:21px">Std</span></td>
						<td>(R/D=1)</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>						
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=2)</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=4)</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=6)</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Welded
						<span style="position: relative; left:65px">1</span></td>
						<td> weld 90</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>						
					</tr>
					<tr><td style="position: relative; left:10px">
						<span style="position: relative; left:170px">2</span>
						</td>
						<td>weld 45</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">
						<span style="position: relative; left:170px">3</span>
						</td>
						<td>weld 30</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td>45 Elbow</td><td></td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Threaded 
						<span style="position: relative; left:10px">Std</span></td>
						<td>(R/D=1)</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=1.5)</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					<tr>
					<tr><td>180 Bend</td><td></td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1)</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Flanged</td><td>(R/D=1)</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					<tr>
					<tr><td style="position: relative; left:10px">- All types</td><td>(R/D=1.5)</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					<tr>
					<tr><td colspan="2">Tee (branch as Elbow)</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1)</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1.5)</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Flanged</td><td>(R/D=1)</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					<tr>
					<tr><td colspan="2" style="position: relative; left:10px">- Stub-in branch</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					<tr>
					<tr><td colspan="2">Tee (Run-Through)</td></tr>
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1)</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Flanged</td><td>(R/D=1)</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					<tr>
					<tr><td colspan="2" style="position: relative; left:10px">- Stub-in branch</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					<tr>
					<tr><td>Valve</td><td></td></tr>
					<tr><td style="position: relative; left:10px">- Gate valve</td><td></td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Globe valve</td><td></td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Ball valve</td><td></td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Check valve</td><td>(Swing)</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td></td><td>(Lift)</td></tr>
					<tr><td style="position: relative; left:10px">- Angle valve</td><td>(45)</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td></td><td>(90)</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px;">- Plug valve
						<span style="position: relative; left:10px">(branch flow)</span></td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>						
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px;">
						<span style="position: relative; left:100px">(straight flow)</span></td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>						
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px;">
						<span style="position: relative; left:100px">(three-way)</span></td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>						
					</tr>
					<tr><td>Diaphragm</td><td></td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px">Reducer
						<span style="position: relative; left:65px">Diameter</span></td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>						
					</tr>
					<tr><td colspan="2"><span style="position: relative; left:100px">theta</td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px">Expander
						<span style="position: relative; left:65px">Diameter</span></td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					</tr>
					<tr><td colspan="2"><span style="position: relative; left:100px">theta</span></td>
						<c:forEach var="i" begin="1" end="4">
							<td><input type="number" value="delete" onclick="#"></td>
						</c:forEach>					
					<tr>
				</tbody>
				
			</table>
			</form>

			<br><br>
		</div>

		
		<h4>Discharge</h4>
	</div>
</body>
</html>