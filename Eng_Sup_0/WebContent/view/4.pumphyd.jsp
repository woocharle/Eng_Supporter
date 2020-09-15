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
		
		#suction{position: relative; left: 60px; overflow: scroll; height:475px; width: 1000px; border: 1px solid black;}
		#suction table{position: relative; left: 20px; padding: 0.5px; font-size: 20px; margin:5px;}
		#suction td {padding:5px; width:120px;}
		#suction td > input {align: middle; width: 80px; text-align: center; display: block; margin: auto;} 
			
		#discharge{position: relative; left: 60px; overflow: scroll; height:475px; width: 1000px; border: 1px solid black;}
		#discharge table{position: relative; left: 20px; padding: 0.5px; font-size: 20px; margin:5px;}
		#discharge td {padding:5px; width:120px;}
		#discharge td > input {align: middle; width: 80px; text-align: center; display: block; margin: auto;} 
		
		.pspec1{width:120px;}
		.pspec2{width: 90px;}
		#combo1{width:100px; font-size: 20px;}

		
		
	</style>

    <script type="text/javascript">
		function pumprev_go(f) {
		       if (window.event.keyCode == 13 || window.event.keyCode == 9) {
		    	   
		             // 엔터키가 눌렸을 때 실행할  onkeyup하면 무조건 변경 
		    	   	alert("테스트성공");
					
					/* 			
					f.action="/Controller?cmd=line&obj=rev";
					f.submit(); */
	
		        }
				//alert("테스트성공");
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
						<td>Item No.</td><td><input type="text" name="item1" value="${pvo1.item1}" class="pspec1"  onkeyup="pumprev_go(this.form)"></td><td></td>
						<td>Net Suction Press</td><td><input type="text" name="psuc" value="${pvo1.psuc}" class="pspec2"  readonly> </td><td>kg/cm2</td>
					</tr>
					<tr>
						<td>Rev No.</td><td><input type="text" name="rev"  value="${pvo1.rev}" class="pspec1" onkeyup="pumprev_go(this.form)"></td><td></td>
						<td>NPSH Available</td><td><input type="number" name="npsh" value="${pvo1.npsh}" class="pspec2" readonly> </td><td>kg/cm2</td>
					</tr>
					<tr>
						<td>Component.</td><td><input type="text" name="comp" class="pspec1" value="${pvo1.comp}" onkeyup="pumprev_go(this.form)"></td><td></td>
						<td>Discharge Press</td><td><input type="text" name="pdis" class="pspec2" value="${pvo1.pdis}" readonly> </td><td>kg/cm2</td>
					</tr>
					<tr>
						<td>Type.</td>
						<td>
							<select name="ptype" id="combo1" onchange="pumprev_go(this.form)">
								<option value="centri" <c:if test="${pvo1.ptype eq 'centri'}"> selected </c:if>> Centrifugal </option>					
			               		<option value="rotary" <c:if test="${pvo1.ptype eq 'rotary'}"> selected </c:if>> Rotary</option>		  	
							</select>
						</td>
						<td></td>
						<td>Differential Press</td><td><input type="number" name="pdiff" class="pspec2" value="${pvo1.pdiff}" readonly > </td><td>kg/cm2</td>
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
						<td>Differential Head</td><td><input type="number" name="hdiff" class="pspec2" value="${pvo1.hdiff}" readonly> </td><td>kg/cm2</td>
					</tr>
					<tr>
						<td colspan="3"></td>
						<td>Hydraulic Power</td><td><input type="number" name="hp" class="pspec2" value="${pvo1.hp}" readonly> </td><td>kg/cm2</td>
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
						<td style="width:200px;"><input type="text" name="item2" class="pspec1" value="${pvo1.item2}" onkeyup="pumprev_go(this.form)"></td>
						<td style="width:130px;"></td><td></td>
				</thead>
				<tbody>
					<tr>
						<td></td><td></td>
						<td colspan="4"></td>
					</tr>
					<tr>
						<td>Operating Press</td>
						<td><input type="number" name="op1" class="pspec1" value="${pvo1.op1}" onkeyup="pumprev_go(this.form)">&nbsp;&nbsp;&nbsp;kg/cm2G</td><td></td>
						<td>Min.Static Head</td><td><input type="number" name="minh" class="pspec2" value="${pvo1.minh}" onkeyup="pumprev_go(this.form)"></td><td>m</td>
					</tr>
					<tr>
						<td>Design press</td>
						<td><input type="number" name="dp1" class="pspec1" value="${pvo1.dp1}" onkeyup="pumprev_go(this.form)">&nbsp;&nbsp;&nbsp;kg/cm2G</td><td></td>
						<td>Max.Static Head</td><td><input type="number" name="maxh" class="pspec2" value="${pvo1.maxh}" onkeyup="pumprev_go(this.form)"></td><td>m</td>
					</tr>
					<tr>
						<td>Strainer</td>
						<td><input type="number" name="strainer" class="pspec1" value="${pvo1.strainer}" onkeyup="pumprev_go(this.form)">&nbsp;&nbsp;&nbsp;kg/cm2G</td><td></td>
						<td>Pump Shaft Level</td><td><input type="number" name="plevel" class="pspec2" value="${pvo1.plevel}" onkeyup="pumprev_go(this.form)"> </td><td>m</td>
					</tr>
					<tr>
						<td>Vapor Pressure</td><td><input type="number" name="vppress" class="pspec1" value="${pvo1.vppress}" onkeyup="pumprev_go(this.form)">&nbsp;&nbsp;&nbsp;kg/cm2G</td><td></td>
						<td>Elevation change</td><td><input type="number" name="elsuc" class="pspec2" value="${pvo1.elsuc}" readonly> </td><td>m</td>
					</tr>
				</tbody>
			</table>
			<br><br>
			<table id="pbasis2">
				<thead>
						<td style="width:20%;">Arrival (Discharge)</td>
						<td style="width:25%;"><span style="position: relative; left:100px">Equip Item No.</span></td><td></td>
						<td style="width:200px;"><input type="text" name="item2" class="pspec1" value="${pvo1.item2}" onkeyup="pumprev_go(this.form)"></td>
						<td style="width:130px;"></td><td></td>
				</thead>
				<tbody>
					<tr>
						<td>Elevation change</td><td><input type="text" name="elmax" class="pspec1" value="${pvo1.elmax}" readonly></td><td></td>
						<td>Operating Press</td><td><input type="number" name="op2" class="pspec2" value="${pvo1.op2}" onkeyup="pumprev_go(this.form)"></td><td>m</td>
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
						<td>- Item.No</td><td><input type="text" name="citem" class="pspec2" value="${pvo1.citem}" onkeyup="pumprev_go(this.form)"></td><td>kg/cm2G</td>
					</tr>
					<tr>
						<td colspan="3"></td>
						<td>- Press Drop</td>
						<td><input type="number" name="cvdp" class="pspec2" <c:if test="${pvo1.cvalve eq 'New'}"> readonly </c:if>
							<c:if test="${pvo1.cvalve eq 'Exist'}"> onkeyup='pumprev_go(this.form)' </c:if>> </td>
						
						<td>kg/cm2</td>
					</tr>
				</tbody>
			</table>
			
			</form>
		
		<h4>Suction</h4>
		
		<div id="suction" style="">
			<form method="post">
			<input type="hidden" name ="cal" value="${cal}">
			<input type="button" value="calculate" onclick="#" style="position: relative; left: 350px; bottom: 40px;">
			<input type="hidden" name="idx" value="${k.idx}" />
			<table>
				<thead>
					<tr><td style="width:200px;'"></td><td style="width:100px;"></td>
						<c:forEach var="k" items="${pslist}">
							<td><c:if test="${k.idx > 3}"><input type="button" value="delete" onclick="#"></c:if></td>
						</c:forEach>
					</tr>
				</thead>
				<tbody>
					<tr><td>Line.No</td><td><input type="button" value="add" onclick="plineadd_go(this.form)" style="width:75px; font-size:18px; margin:inherit;"></td>
						<c:forEach var="k" items="${pslist}">  <!-- 1 -->
							<td><input type="text" name="lineno1" value="${k.pin}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>
					</tr>
					<tr><td>Pressure (In)</td><td>kg/cm2</td>  <!-- 2 -->
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="pin" value="${k.pin}" onkeyup="pumprev_go(this.form)"></td>
						</c:forEach>
					</tr>
					<tr><td>Pressure (out)</td><td>kg/cm2</td>  <!-- 3 -->
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="pout" value="${k.pout}" onkeyup="pumprev_go(this.form)"></td>
						</c:forEach>					
					</tr>
					<tr><td>Temperature</td><td>C</td>  <!-- 4 -->
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="temp" value="${k.temp}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td>Density</td><td>kg/m3</td>  <!-- 5 -->
						<c:forEach var="k" items="${pslist}">
							<td> <input type="number" name="den" value="${k.den}" onkeyup="pumprev_go(this.form)" >	</td>							
						</c:forEach>
					</tr>
					<tr><td>Viscosity</td><td>cP</td> 	 <!-- 6 -->
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="vis" value="${k.vis}" onkeyup="pumprev_go(this.form)" ></td>				
						</c:forEach>					
					</tr>
					<tr><td>Flow rate</td><td>kg/hr</td>  <!-- 7 -->
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="flow" value="${k.flow}" onkeyup="pumprev_go(this.form)" ></td>						
						</c:forEach>				
					</tr>
					<tr><td>Over Design</td><td>%</td>  	<!-- 8 -->
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="per" value="${k.per}" onkeyup="pumprev_go(this.form)" >	</td>					
						</c:forEach>					
					</tr>
					<tr><td>Complex factor</td><td></td>	<!-- 9 -->
						<c:forEach var="k" items="${pslist}">
							<td>			
								<select name="Fitting" id="combo1" onchange="pumprev_go(this.form)">
									<option value="1" <c:if test="${k.cfactor eq '1'}"> selected </c:if>>1 </option>					
				               		<option value="2" <c:if test="${k.cfactor eq '2'}"> selected </c:if>> 2</option>		  	
				               		<option value="4" <c:if test="${k.cfactor eq '4'}"> selected </c:if>> 4</option>		  	
				               		<option value="Fitting" <c:if test="${k.cfactor eq 'Fitting'}"> selected </c:if>> Fitting</option>		  	
								</select>
							</td>
						</c:forEach>					
					</tr>
					<tr><td>Line Size</td><td></td> 	<!-- 10 -->
						<c:forEach var="k" items="${pslist}">
							<td>
							<!-- 리스트를 따로 만들어서 For문 처리  -->
								<select name="dout" id="combo1" onchange="pumprev_go(this.form)">
									<c:forEach var="i" items="${k.size}">
										<option value="${i}" <c:if test="${k.dout eq i}"> selected </c:if>>${i}</option>					
									</c:forEach>
								</select>
							</td>
						</c:forEach>					
					</tr>
					<tr><td>Schedule or Class</td><td></td>
						<c:forEach var="k" items="${pslist}">
							<td>
								<select name="schd" id="combo1" onchange="pumprev_go(this.form)">
									<c:forEach var="i" items="${k.schedule}">
										<option value="${i}" <c:if test="${k.schd eq i}"> selected </c:if>>${i}</option>					
									</c:forEach>								  	
								</select>
							</td>
						</c:forEach>						
					</tr>
					<tr><td>Inside of Dia</td><td>m</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="per" value="${k.din}" readonly></td>						
						</c:forEach>						
					</tr>
					<tr><td>Length of Pipe</td><td>m</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="plen" value="${k.plen}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>						
					</tr>
					<tr><td>Wall Roughness</td><td>m</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="wall" value="${k.wall}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>						
					</tr>
					<tr><td>Elevation Change</td><td>m</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elchange" value="${k.elchange}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td>Fitting</td><td colspan="${pnum + 1}"></td></tr>
					<tr><td>90 Elbow</td><td colspan="${pnum + 1}"></td></tr>
					<tr><td style="position: relative; left:10px">- Threaded 
						<span style="position: relative; left:10px">Std</span></td>
						<td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_1" value="${k.elbow90_1}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>							
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=1.5)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_2" value="${k.elbow90_2}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>				
					<tr>
					<tr><td style="position: relative; left:10px">- Flanged 
						<span style="position: relative; left:21px">Std</span></td>
						<td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_3" value="${k.elbow90_3}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>							
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=2)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_4" value="${k.elbow90_4}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>						
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=4)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_5" value="${k.elbow90_5}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>						
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=6)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_6" value="${k.elbow90_6}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Welded
						<span style="position: relative; left:65px">1</span></td>
						<td> weld 90</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_7" value="${k.elbow90_7}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>						
					</tr>
					<tr><td style="position: relative; left:10px"><span style="position: relative; left:170px">2</span></td>
						<td>weld 45</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_8" value="${k.elbow90_8}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px"><span style="position: relative; left:170px">3</span></td>
						<td>weld 30</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_9" value="${k.elbow90_9}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>						
					</tr>
					<tr><td>45 Elbow</td><td></td><td colspan="${pnum + 1}"></td></tr>				
					<tr><td style="position: relative; left:10px">- Threaded 
						<span style="position: relative; left:10px">Std</span></td>
						<td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow45_1" value="${k.elbow45_1}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=1.5)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow45_2" value="${k.elbow45_2}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					<tr>
					<tr><td>180 Bend</td><td></td><td colspan="${pnum + 1}"></td></tr>		
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="bend_1" value="${k.bend_1}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>						
					</tr>
					<tr><td style="position: relative; left:10px">- Flanged</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="bend_2" value="${k.bend_2}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- All types</td><td>(R/D=1.5)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="bend_3" value="${k.bend_3}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td colspan="2">Tee (branch as Elbow)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_1" value="${k.tee_1}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_2 value="${k.tee_2}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1.5)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_3" value="${k.tee_3}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Flanged</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_4" value="${k.tee_4}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					<tr>
					<tr><td colspan="2" style="position: relative; left:10px">- Stub-in branch</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_5" value="${k.tee_5}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>				
					<tr>
					<tr><td colspan="2">Tee (Run-Through)</td></tr>
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_6" value="${k.tee_6}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Flanged</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_7" value="${k.tee_7}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>				
					<tr>
					<tr><td colspan="2" style="position: relative; left:10px">- Stub-in branch</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_8" value="${k.tee_8}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>				
					<tr>
					<tr><td>Valve</td><td></td></tr>
					<tr><td style="position: relative; left:10px">- Gate valve</td><td></td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="gtvalve" value="${k.gtvalve}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Globe valve</td><td></td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="gbvalve" value="${k.gbvalve}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Ball valve</td><td></td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="bvalve" value="${k.bvalve}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Check valve</td><td>(Swing)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="cvalve_1" value="${k.cvalve_1}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td></td><td>(Lift)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="cvalve_2" value="${k.cvalve_2}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>
					</tr>
					
					<tr><td style="position: relative; left:10px">- Angle valve</td><td>(45)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="avalve_1" value="${k.avalve_1}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td></td><td>(90)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="avalve_2" value="${k.avalve_2}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>				
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px;">- Plug valve
						<span style="position: relative; left:10px">(branch flow)</span></td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="pvalve_1" value="${k.pvalve_1}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>						
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px;">
						<span style="position: relative; left:100px">(straight flow)</span></td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="pvalve_2" value="${k.pvalve_2}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>						
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px;">
						<span style="position: relative; left:100px">(three-way)</span></td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="pvalve_3" value="${k.pvalve_3}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px;">- Diaphragm valve</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="dvalve" value="${k.dvalve}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>				
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px">Reducer
						<span style="position: relative; left:65px">Diameter</span></td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="redd" value="${k.redd}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td colspan="2"><span style="position: relative; left:100px">theta</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="redth" value="${k.redth}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>				
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px">Expander
						<span style="position: relative; left:65px">Diameter</span></td>
						<c:forEach var="k" items="${pslist}">
							<td>
								<input type="number" name="expd" value="${k.expd}" onkeyup="pumprev_go(this.form)" >
							</td>
						</c:forEach>				
					</tr>
					<tr><td colspan="2"><span style="position: relative; left:100px">theta</span></td>
						<c:forEach var="k" items="${pslist}">
							<td>
								<input type="number" name="expth" value="${k.expth}" onkeyup="pumprev_go(this.form)" >
							</td>
						</c:forEach>				
					<tr>
				</tbody>
				
			</table>
			</form>
			<br><br>
		</div>

		
		<h4>Discharge</h4>
		
		<div id="discharge" style="">
			<form method="post">
			<input type="hidden" name ="cal" value="${cal}">
			<input type="button" value="calculate" onclick="#" style="position: relative; left: 350px; bottom: 40px;">
			<input type="hidden" name="idx" value="${k.idx}" />
			<table>
				<thead>
					<tr><td style="width:200px;'"></td><td style="width:100px;"></td>
						<c:forEach var="k" items="${pslist}">
							<td><c:if test="${k.idx > 3}"><input type="button" value="delete" onclick="#"></c:if></td>
						</c:forEach>
					</tr>
				</thead>
				<tbody>
					<tr><td>Line.No</td><td><input type="button" value="add" onclick="plineadd_go(this.form)" style="width:75px; font-size:18px; margin:inherit;"></td>
						<c:forEach var="k" items="${pslist}">  <!-- 1 -->
							<td><input type="text" name="lineno1" value="${k.pin}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>
					</tr>
					<tr><td>Pressure (In)</td><td>kg/cm2</td>  <!-- 2 -->
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="pin" value="${k.pin}" onkeyup="pumprev_go(this.form)"></td>
						</c:forEach>
					</tr>
					<tr><td>Pressure (out)</td><td>kg/cm2</td>  <!-- 3 -->
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="pout" value="${k.pout}" onkeyup="pumprev_go(this.form)"></td>
						</c:forEach>					
					</tr>
					<tr><td>Temperature</td><td>C</td>  <!-- 4 -->
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="temp" value="${k.temp}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td>Density</td><td>kg/m3</td>  <!-- 5 -->
						<c:forEach var="k" items="${pslist}">
							<td> <input type="number" name="den" value="${k.den}" onkeyup="pumprev_go(this.form)" >	</td>							
						</c:forEach>
					</tr>
					<tr><td>Viscosity</td><td>cP</td> 	 <!-- 6 -->
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="vis" value="${k.vis}" onkeyup="pumprev_go(this.form)" ></td>				
						</c:forEach>					
					</tr>
					<tr><td>Flow rate</td><td>kg/hr</td>  <!-- 7 -->
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="flow" value="${k.flow}" onkeyup="pumprev_go(this.form)" ></td>						
						</c:forEach>				
					</tr>
					<tr><td>Over Design</td><td>%</td>  	<!-- 8 -->
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="per" value="${k.per}" onkeyup="pumprev_go(this.form)" >	</td>					
						</c:forEach>					
					</tr>
					<tr><td>Complex factor</td><td></td>	<!-- 9 -->
						<c:forEach var="k" items="${pslist}">
							<td>			
								<select name="Fitting" id="combo1" onchange="pumprev_go(this.form)">
									<option value="1" <c:if test="${k.cfactor eq '1'}"> selected </c:if>>1 </option>					
				               		<option value="2" <c:if test="${k.cfactor eq '2'}"> selected </c:if>> 2</option>		  	
				               		<option value="4" <c:if test="${k.cfactor eq '4'}"> selected </c:if>> 4</option>		  	
				               		<option value="Fitting" <c:if test="${k.cfactor eq 'Fitting'}"> selected </c:if>> Fitting</option>		  	
								</select>
							</td>
						</c:forEach>					
					</tr>
					<tr><td>Line Size</td><td></td> 	<!-- 10 -->
						<c:forEach var="k" items="${pslist}">
							<td>
							<!-- 리스트를 따로 만들어서 For문 처리  -->
								<select name="dout" id="combo1" onchange="pumprev_go(this.form)">
									<c:forEach var="i" items="${k.size}">
										<option value="${i}" <c:if test="${k.dout eq i}"> selected </c:if>>${i}</option>					
									</c:forEach>
								</select>
							</td>
						</c:forEach>					
					</tr>
					<tr><td>Schedule or Class</td><td></td>
						<c:forEach var="k" items="${pslist}">
							<td>
								<select name="schd" id="combo1" onchange="pumprev_go(this.form)">
									<c:forEach var="i" items="${k.schedule}">
										<option value="${i}" <c:if test="${k.schd eq i}"> selected </c:if>>${i}</option>					
									</c:forEach>								  	
								</select>
							</td>
						</c:forEach>						
					</tr>
					<tr><td>Inside of Dia</td><td>m</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="per" value="${k.din}" readonly></td>						
						</c:forEach>						
					</tr>
					<tr><td>Length of Pipe</td><td>m</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="plen" value="${k.plen}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>						
					</tr>
					<tr><td>Wall Roughness</td><td>m</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="wall" value="${k.wall}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>						
					</tr>
					<tr><td>Elevation Change</td><td>m</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elchange" value="${k.elchange}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td>Fitting</td><td colspan="${pnum + 1}"></td></tr>
					<tr><td>90 Elbow</td><td colspan="${pnum + 1}"></td></tr>
					<tr><td style="position: relative; left:10px">- Threaded 
						<span style="position: relative; left:10px">Std</span></td>
						<td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_1" value="${k.elbow90_1}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>							
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=1.5)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_2" value="${k.elbow90_2}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>				
					<tr>
					<tr><td style="position: relative; left:10px">- Flanged 
						<span style="position: relative; left:21px">Std</span></td>
						<td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_3" value="${k.elbow90_3}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>							
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=2)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_4" value="${k.elbow90_4}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>						
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=4)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_5" value="${k.elbow90_5}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>						
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=6)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_6" value="${k.elbow90_6}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Welded
						<span style="position: relative; left:65px">1</span></td>
						<td> weld 90</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_7" value="${k.elbow90_7}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>						
					</tr>
					<tr><td style="position: relative; left:10px"><span style="position: relative; left:170px">2</span></td>
						<td>weld 45</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_8" value="${k.elbow90_8}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px"><span style="position: relative; left:170px">3</span></td>
						<td>weld 30</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_9" value="${k.elbow90_9}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>						
					</tr>
					<tr><td>45 Elbow</td><td></td><td colspan="${pnum + 1}"></td></tr>				
					<tr><td style="position: relative; left:10px">- Threaded 
						<span style="position: relative; left:10px">Std</span></td>
						<td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow45_1" value="${k.elbow45_1}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=1.5)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow45_2" value="${k.elbow45_2}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					<tr>
					<tr><td>180 Bend</td><td></td><td colspan="${pnum + 1}"></td></tr>		
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="bend_1" value="${k.bend_1}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>						
					</tr>
					<tr><td style="position: relative; left:10px">- Flanged</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="bend_2" value="${k.bend_2}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- All types</td><td>(R/D=1.5)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="bend_3" value="${k.bend_3}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td colspan="2">Tee (branch as Elbow)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_1" value="${k.tee_1}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_2 value="${k.tee_2}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1.5)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_3" value="${k.tee_3}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Flanged</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_4" value="${k.tee_4}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					<tr>
					<tr><td colspan="2" style="position: relative; left:10px">- Stub-in branch</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_5" value="${k.tee_5}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>				
					<tr>
					<tr><td colspan="2">Tee (Run-Through)</td></tr>
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_6" value="${k.tee_6}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Flanged</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_7" value="${k.tee_7}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>				
					<tr>
					<tr><td colspan="2" style="position: relative; left:10px">- Stub-in branch</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_8" value="${k.tee_8}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>				
					<tr>
					<tr><td>Valve</td><td></td></tr>
					<tr><td style="position: relative; left:10px">- Gate valve</td><td></td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="gtvalve" value="${k.gtvalve}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Globe valve</td><td></td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="gbvalve" value="${k.gbvalve}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Ball valve</td><td></td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="bvalve" value="${k.bvalve}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Check valve</td><td>(Swing)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="cvalve_1" value="${k.cvalve_1}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td></td><td>(Lift)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="cvalve_2" value="${k.cvalve_2}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>
					</tr>
					
					<tr><td style="position: relative; left:10px">- Angle valve</td><td>(45)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="avalve_1" value="${k.avalve_1}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td></td><td>(90)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="avalve_2" value="${k.avalve_2}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>				
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px;">- Plug valve
						<span style="position: relative; left:10px">(branch flow)</span></td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="pvalve_1" value="${k.pvalve_1}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>						
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px;">
						<span style="position: relative; left:100px">(straight flow)</span></td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="pvalve_2" value="${k.pvalve_2}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>						
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px;">
						<span style="position: relative; left:100px">(three-way)</span></td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="pvalve_3" value="${k.pvalve_3}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px;">- Diaphragm valve</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="dvalve" value="${k.dvalve}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>				
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px">Reducer
						<span style="position: relative; left:65px">Diameter</span></td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="redd" value="${k.redd}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>					
					</tr>
					<tr><td colspan="2"><span style="position: relative; left:100px">theta</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="redth" value="${k.redth}" onkeyup="pumprev_go(this.form)" ></td>
						</c:forEach>				
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px">Expander
						<span style="position: relative; left:65px">Diameter</span></td>
						<c:forEach var="k" items="${pslist}">
							<td>
								<input type="number" name="expd" value="${k.expd}" onkeyup="pumprev_go(this.form)" >
							</td>
						</c:forEach>				
					</tr>
					<tr><td colspan="2"><span style="position: relative; left:100px">theta</span></td>
						<c:forEach var="k" items="${pslist}">
							<td>
								<input type="number" name="expth" value="${k.expth}" onkeyup="pumprev_go(this.form)" >
							</td>
						</c:forEach>				
					<tr>
				</tbody>
				
			</table>
			</form>
			<br><br>
		</div>
		<br><br><br>
	</div>
</body>
</html>