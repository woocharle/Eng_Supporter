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
		#suction table{position: relative; left: 20px; padding: 0px; font-size: 20px; margin:5px;}
		#suction td {padding:2px; width:120px;}
		#suction td > input {align: middle; width: 70px; text-align: center; display: block; margin: auto; font-size: 16px;} 
			
		#discharge{position: relative; left: 60px; overflow: scroll; height:475px; width: 1000px; border: 1px solid black;}
		#discharge table{position: relative; left: 20px; padding: 0px; font-size: 20px; margin:5px;}
		#discharge td {padding:2px; width:120px;}
		#discharge td > input {align: middle; width: 60px; text-align: center; display: block; margin: auto;} 
		
		.pspec1{width:120px;}
		.pspec2{width: 90px;}
		#combo1{width:100px; font-size: 20px;}
		#section1{font-size: 18px; margin: 0px auto;}
		
	</style>

    <script type="text/javascript">
		function rev_go(f) {
			f.action="pumprev.do";
			f.submit(); 
		}
		
		function add1_go(f) {
			f.action="plineadd1.do";
			f.submit(); 
		}
		
		function add2_go(f) {
			f.action="plineadd2.do";
			f.submit(); 
		}
		
		function del1_go(f) {
			f.action="plinedel1.do";
			f.submit(); 
		}
		
		function del2_go(f) {
			f.action="plinedel2.do";
			f.submit(); 
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
						<td>Item No.</td><td><input type="text" name="item1" value="${pvo1.item1}" class="pspec1" ></td><td></td>
						<td>Net Suction Press</td><td><input type="text" name="psuc" value="${pvo1.psuc}" class="pspec2"  readonly> </td><td>kg/cm2</td>
					</tr>
					<tr>
						<td>Rev No.</td><td><input type="text" name="rev"  value="${pvo1.rev}" class="pspec1" ></td><td></td>
						<td>NPSH Available</td><td><input type="number" name="npsh" value="${pvo1.npsh}" class="pspec2" readonly> </td><td>kg/cm2</td>
					</tr>
					<tr>
						<td>Component.</td><td><input type="text" name="comp" class="pspec1" value="${pvo1.comp}" ></td><td></td>
						<td>Discharge Press</td><td><input type="text" name="pdis" class="pspec2" value="${pvo1.pdis}" readonly> </td><td>kg/cm2</td>
					</tr>
					<tr>
						<td>Type.</td>
						<td>
							<select name="ptype" id="combo1" style="width: 140px;">
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
							<input type="radio" id="Inlet" name="cdtn" value="Exist" onclick="rev_go(this.form)" 
							<c:if test="${pvo1.cdtn eq 'Exist'}">checked </c:if>> 
							<label for="Exist">Exist</label>
							&nbsp;&nbsp;
							<input type="radio" id="Outlet" name="cdtn" value="New" onclick="rev_go(this.form)" 
							<c:if test="${pvo1.cdtn eq 'New'}">checked </c:if>>
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
		
		<h4>Basis</h4>
			<table id="pbasis1">
				<thead>
						<td style="width:20%;">Depart (Suction)</td>
						<td style="width:25%;"><span style="position: relative; left:100px">Equip Item No.</span></td><td></td>
						<td style="width:200px;"><input type="text" name="item2" class="pspec1" value="${pvo1.item2}"></td>
						<td style="width:130px;"></td><td></td>
				</thead>
				<tbody>
					<tr>
						<td></td><td></td>
						<td colspan="4"></td>
					</tr>
					<tr>
						<td>Operating Press</td>
						<td><input type="number" name="op1" class="pspec1" value="${pvo1.op1}">&nbsp;&nbsp;&nbsp;kg/cm2G</td><td></td>
						<td>Min.Static Head</td><td><input type="number" name="minh" class="pspec2" value="${pvo1.minh}"></td><td>m</td>
					</tr>
					<tr>
						<td>Design press</td>
						<td><input type="number" name="dp1" class="pspec1" value="${pvo1.dp1}">&nbsp;&nbsp;&nbsp;kg/cm2G</td><td></td>
						<td>Max.Static Head</td><td><input type="number" name="maxh" class="pspec2" value="${pvo1.maxh}" ></td><td>m</td>
					</tr>
					<tr>
						<td>Strainer</td>
						<td><input type="number" name="strainer" class="pspec1" value="${pvo1.strainer}">&nbsp;&nbsp;&nbsp;kg/cm2G</td><td></td>
						<td>Pump Shaft Level</td><td><input type="number" name="plevel" class="pspec2" value="${pvo1.plevel}"> </td><td>m</td>
					</tr>
					<tr>
						<td>Vapor Pressure</td><td><input type="number" name="vppress" class="pspec1" value="${pvo1.vppress}" >&nbsp;&nbsp;&nbsp;kg/cm2G</td><td></td>
						<td>Elevation change</td><td><input type="number" name="elsuc" class="pspec2" value="${pvo1.elsuc}" readonly> </td><td>m</td>
					</tr>
				</tbody>
			</table>
			<br><br>
			<table id="pbasis2">
				<thead>
						<td style="width:20%;">Arrival (Discharge)</td>
						<td style="width:25%;"><span style="position: relative; left:100px">Equip Item No.</span></td><td></td>
						<td style="width:200px;"><input type="text" name="item3" class="pspec1" value="${pvo1.item3}"></td>
						<td style="width:130px;"></td><td></td>
				</thead>
				<tbody>
					<tr>
						<td>Elevation change</td><td><input type="text" name="elmax" class="pspec1" value="${pvo1.elmax}" readonly></td><td></td>
						<td>Operating Press</td><td><input type="number" name="op2" class="pspec2" value="${pvo1.op2}"></td><td>m</td>
					</tr>
					<tr>
						<td>Control Valve</td>
						<td>
							<input type="radio" id="Inlet" name="cvalve" value="Exist" onclick="rev_go(this.form)" 
							<c:if test="${pvo1.cvalve eq 'Exist'}">checked </c:if>> 
							<label for="Exist">Exist</label>
							<input type="radio" id="Outlet" name="cvalve" value="New" onclick="rev_go(this.form)"
							<c:if test="${pvo1.cvalve eq 'New'}">checked </c:if>>
							<label for="New">New</label>						
						</td>
						<td></td>
						<td>- Item.No</td><td><input type="text" name="citem" class="pspec2" value="${pvo1.citem}"></td><td>kg/cm2G</td>
					</tr>
					<tr>
						<td colspan="3"></td>
						<td>- Press Drop</td>
						<td><input type="number" name="cvdp" class="pspec2" <c:if test="${pvo1.cvalve eq 'New'}"> readonly </c:if>> </td>
						<td>kg/cm2</td>
					</tr>
				</tbody>
			</table>
				
		
		<h4>Suction line</h4>
		<div id="suction" >
			<table>
				<thead>
					<tr>
						<td style="height:30px;"> 
							<select name="section1" id="section1">
								<option>삭제할 section 선택::</option>	
								<c:forEach var="k" items="${pslist}">
									<option value="${k.idx}">Section ${k.idx}</option>					
								</c:forEach>
							</select>
						</td>
						<td>
							<input type="button" value="delete" onclick="del1_go(this.form)" style="width:85px; font-size:18px; margin:inherit;">
						</td>
					
						<c:forEach var="k" items="${pslist}" >
							<td style="text-align: center; font-size: 18px;">Section ${k.idx}</td>
						</c:forEach>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:200px;">Line.No</td>
						<td style="width:100px;">
							<input type="button" value="add" onclick="add1_go(this.form)" style="width:85px; font-size:18px; margin:inherit;">
						</td>
						<c:forEach var="k" items="${pslist}">  <!-- 1 -->
							<td><input type="text" name="lineno${k.idx}" value="${k.lineno}" style="width: 90px;"></td>
						</c:forEach>
					</tr>
					<tr><td>Pressure (In)</td><td>kg/cm2</td>  <!-- 2 -->
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="pin${k.idx}" value="${k.pin}" disabled="disabled"></td>
						</c:forEach>
					</tr>
					<tr><td>Pressure (out)</td><td>kg/cm2</td>  <!-- 3 -->
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="pout${k.idx}" value="${k.pout}" disabled="disabled"></td>
						</c:forEach>					
					</tr>
					<tr><td>Temperature</td><td>C</td>  <!-- 4 -->
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="temp${k.idx}" value="${k.temp}" ></td>
						</c:forEach>					
					</tr>
					<tr><td>Density</td><td>kg/m3</td>  <!-- 5 -->
						<c:forEach var="k" items="${pslist}">
							<td> <input type="number" name="den${k.idx}" value="${k.den}" >	</td>							
						</c:forEach>
					</tr>
					<tr><td>Viscosity</td><td>cP</td> 	 <!-- 6 -->
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="vis${k.idx}" value="${k.vis}" ></td>				
						</c:forEach>					
					</tr>
					<tr><td>Flow rate</td><td>kg/hr</td>  <!-- 7 -->
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="flow${k.idx}" value="${k.flow}" ></td>						
						</c:forEach>				
					</tr>
					<tr><td>Over Design</td><td>%</td>  	<!-- 8 -->
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="per${k.idx}" value="${k.per}">	</td>					
						</c:forEach>					
					</tr>
					<tr><td>Complex factor</td><td></td>	<!-- 9 -->
						<c:forEach var="k" items="${pslist}">
							<td>			
								<select name="cfactor${k.idx}" id="combo1" onchange="rev_go(this.form)">
									<option value="fitting" <c:if test="${k.cfactor eq 'fitting'}"> selected </c:if>>Fitting (직접입력)</option>	
									<option value="utility" <c:if test="${k.cfactor eq 'utility'}"> selected </c:if>>Utility Supply Lines (1)</option>
									<option value="long" <c:if test="${k.cfactor eq 'long'}"> selected </c:if>>Long Straight Piping Runs (1) </option>
									<option value="norpipe" <c:if test="${k.cfactor eq 'norpipe'}"> selected </c:if>>Normal Piping (1.5)</option>
									<option value="manifold" <c:if test="${k.cfactor eq 'manifold'}"> selected </c:if>>Normal Manifold-type Piping (2)</option>
									<option value="complex"<c:if test="${k.cfactor eq 'complex'}"> selected </c:if>>Very Complex Manifolds (3)</option>
								</select>
							</td>
						</c:forEach>					
					</tr>
					<tr><td>Line Size</td><td></td> 	<!-- 10 -->
						<c:forEach var="k" items="${pslist}">
							<td>
							<!-- 리스트를 따로 만들어서 For문 처리  -->
								<select name="dout${k.idx}" id="combo1" onchange="rev_go(this.form)">
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
								<select name="schd${k.idx}" id="combo1" onchange="rev_go(this.form)">
									<c:forEach var="i" items="${k.schedule}">
										<option value="${i}" <c:if test="${k.schd eq i}"> selected </c:if>>${i}</option>					
									</c:forEach>								  	
								</select>
							</td>
						</c:forEach>						
					</tr>
					<tr><td>Inside of Dia</td><td>m</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="din${k.idx}" value="${k.din}" readonly></td>						
						</c:forEach>						
					</tr>
					<tr><td>Length of Pipe</td><td>m</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="plen${k.idx}" value="${k.plen}"  ></td>
						</c:forEach>						
					</tr>
					<tr><td>Wall Roughness</td><td>mm</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="wall${k.idx}" value="${k.wall}"  ></td>
						</c:forEach>						
					</tr>
					<tr><td>Elevation Change</td><td>m</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elchange${k.idx}" value="${k.elchange}"  ></td>
						</c:forEach>					
					</tr>
					<tr><td>Equivalent Length</td><td>m</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="eqvlen${k.idx}" value="${k.eqvlen}"  disabled="disabled"></td>
						</c:forEach>					
					</tr>
					<tr><td>Fitting</td><td></td></tr>
					<tr><td>90 Elbow</td><td></td></tr>
					<tr><td style="position: relative; left:10px">- Threaded 
						<span style="position: relative; left:10px">Std</span></td>
						<td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_1${k.idx}" value="${k.elbow90_1}"  
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=1.5)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_2${k.idx}" value="${k.elbow90_2}"  
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>	
					</tr>
					<tr><td style="position: relative; left:10px">- Flanged 
						<span style="position: relative; left:21px">Std</span></td>
						<td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_3${k.idx}" value="${k.elbow90_3}"  
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>	
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=2)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_4${k.idx}" value="${k.elbow90_4}"  
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>	
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=4)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_5${k.idx}" value="${k.elbow90_5}"  
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=6)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_6${k.idx}" value="${k.elbow90_6}"  
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>
					</tr>
					<tr><td style="position: relative; left:10px">- Welded<span style="position: relative; left:65px">1</span></td>
						<td> weld 90</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_7${k.idx}" value="${k.elbow90_7}"  
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>
					</tr>
					<tr><td style="position: relative; left:10px"><span style="position: relative; left:170px">2</span></td>
						<td>weld 45</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_8${k.idx}" value="${k.elbow90_8}"  
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>
					</tr>
					<tr><td style="position: relative; left:10px"><span style="position: relative; left:170px">3</span></td>
						<td>weld 30</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow90_9${k.idx}" value="${k.elbow90_9}"  
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>	
					</tr>
					<tr><td>45 Elbow</td><td></td><td colspan="${pnum + 1}"></td></tr>				
					<tr><td style="position: relative; left:10px">- Threaded <span style="position: relative; left:10px">Std</span></td>
						<td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow45_1${k.idx}" value="${k.elbow45_1}"  
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=1.5)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow45_2${k.idx}" value="${k.elbow45_2}"  
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>
					<tr>
					<tr><td>180 Bend</td><td></td><td colspan="${pnum + 1}"></td></tr>		
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="bend_1${k.idx}" value="${k.bend_1}"  
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>						
					</tr>
					<tr><td style="position: relative; left:10px">- Flanged</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="bend_2${k.idx}" value="${k.bend_2}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- All types</td><td>(R/D=1.5)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="bend_3${k.idx}" value="${k.bend_3}"  
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td colspan="2">Tee (branch as Elbow)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_1${k.idx}" value="${k.tee_1}"  
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_2${k.idx}" value="${k.tee_2}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1.5)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_3${k.idx}" value="${k.tee_3}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Flanged</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_4${k.idx}" value="${k.tee_4}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					<tr>
					<tr><td colspan="2" style="position: relative; left:10px">- Stub-in branch</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_5${k.idx}" value="${k.tee_5}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					<tr>
					<tr><td colspan="2">Tee (Run-Through)</td></tr>
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_6${k.idx}" value="${k.tee_6}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Flanged</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_7${k.idx}" value="${k.tee_7}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					<tr>
					<tr><td colspan="2" style="position: relative; left:10px">- Stub-in branch</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_8${k.idx}" value="${k.tee_8}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					<tr>
					<tr><td>Valve</td><td></td></tr>
					<tr><td style="position: relative; left:10px">- Gate valve</td><td></td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="gtvalve${k.idx}" value="${k.gtvalve}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Globe valve</td><td></td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="gbvalve${k.idx}" value="${k.gbvalve}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Ball valve</td><td></td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="bvalve${k.idx}" value="${k.bvalve}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Check valve</td><td>(Swing)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="cvalve_1${k.idx}" value="${k.cvalve_1}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td></td><td>(Lift)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="cvalve_2${k.idx}" value="${k.cvalve_2}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>
					</tr>
					
					<tr><td style="position: relative; left:10px">- Angle valve</td><td>(45)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="avalve_1${k.idx}" value="${k.avalve_1}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td></td><td>(90)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="avalve_2${k.idx}" value="${k.avalve_2}"  
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px;">- Plug valve
						<span style="position: relative; left:10px">(branch flow)</span></td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="pvalve_1${k.idx}" value="${k.pvalve_1}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>						
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px;">
						<span style="position: relative; left:100px">(straight flow)</span></td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="pvalve_2${k.idx}" value="${k.pvalve_2}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>						
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px;">
						<span style="position: relative; left:100px">(three-way)</span></td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="pvalve_3${k.idx}" value="${k.pvalve_3}"  
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px;">- Diaphragm valve</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="dvalve${k.idx}" value="${k.dvalve}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px">Reducer
						<span style="position: relative; left:65px">Diameter</span></td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="redd${k.idx}" value="${k.redd}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td colspan="2"><span style="position: relative; left:100px">theta</span></td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="redth${k.idx}" value="${k.redth}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px">Expander
						<span style="position: relative; left:65px">Diameter</span></td>
						<c:forEach var="k" items="${pslist}">
							<td>
								<input type="number" name="expd${k.idx}" value="${k.expd}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td colspan="2"><span style="position: relative; left:100px">theta</span></td>
						<c:forEach var="k" items="${pslist}">
							<td>
								<input type="number" name="expth${k.idx}" value="${k.expth}"  
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					<tr>
				</tbody>
				
			</table>
			<br><br>

		</div>
		
		<h4>Discharge line</h4>
		
		<div id="discharge" style="">
			<table>
				<thead>
					<tr><td style="width:200px;'"></td><td style="width:100px;"></td>
						<c:forEach var="k" items="${pdlist}">
							<td>
								<c:if test="${k.idx_2 > 3}"><input type="button" value="delete" onclick="del2_go(this.form)"></c:if>
								<input type="hidden" name="idx_2_${k.idx_2}" value="${k.idx_2}">
							</td>
						</c:forEach>
					</tr>
				</thead>
				<tbody>
					<tr><td>Line.No</td><td><input type="button" value="add" onclick="add2_go(this.form)" style="width:75px; font-size:18px; margin:inherit;"></td>
						<c:forEach var="k" items="${pdlist}">  <!-- 1 -->
							<td><input type="text" name="lineno_2${k.idx_2}" value="${k.lineno_2}" style="width: 90px;"></td>
						</c:forEach>
					</tr>
					<tr><td>Pressure (In)</td><td>kg/cm2</td>  <!-- 2 -->
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="pin_2${k.idx_2}" value="${k.pin_2}" disabled="disabled"></td>
						</c:forEach>
					</tr>
					<tr><td>Pressure (out)</td><td>kg/cm2</td>  <!-- 3 -->
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="pout_2${k.idx_2}" value="${k.pout_2}"  disabled="disabled"></td>
						</c:forEach>					
					</tr>
					<tr><td>Temperature</td><td>C</td>  <!-- 4 -->
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="temp_2${k.idx_2}" value="${k.temp_2}"  ></td>
						</c:forEach>					
					</tr>
					<tr><td>Density</td><td>kg/m3</td>  <!-- 5 -->
						<c:forEach var="k" items="${pdlist}">
							<td> <input type="number" name="den_2${k.idx_2}" value="${k.den_2}" ></td>							
						</c:forEach>
					</tr>
					<tr><td>Viscosity</td><td>cP</td> 	 <!-- 6 -->
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="vis_2${k.idx_2}" value="${k.vis_2}" ></td>				
						</c:forEach>					
					</tr>
					<tr><td>Flow rate</td><td>kg/hr</td>  <!-- 7 -->
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="flow_2${k.idx_2}" value="${k.flow_2}" ></td>						
						</c:forEach>				
					</tr>
					<tr><td>Over Design</td><td>%</td>  	<!-- 8 -->
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="per_2${k.idx_2}" value="${k.per_2}" >	</td>					
						</c:forEach>					
					</tr>
					<tr><td>Complex factor</td><td></td>
						<!-- 9 -->
						<c:forEach var="k" items="${pdlist}">
							<td>			
								<select name="cfactor_2${k.idx_2}" id="combo1" onchange="rev_go(this.form)">
									<option value="fitting" <c:if test="${k.cfactor_2 eq 'fitting'}"> selected </c:if>>Fitting (직접입력)</option>	
									<option value="utility" <c:if test="${k.cfactor_2 eq 'utility'}"> selected </c:if>>Utility Supply Lines (1)</option>
									<option value="long" <c:if test="${k.cfactor_2 eq 'long'}"> selected </c:if>>Long Straight Piping Runs (1) </option>
									<option value="norpipe" <c:if test="${k.cfactor_2 eq 'norpipe'}"> selected </c:if>>Normal Piping (1.5)</option>
									<option value="manifold" <c:if test="${k.cfactor_2 eq 'manifold'}"> selected </c:if>>Normal Manifold-type Piping (2)</option>
									<option value="complex"<c:if test="${k.cfactor_2 eq 'complex'}"> selected </c:if>>Very Complex Manifolds (3)</option>
								</select>
							</td>
						</c:forEach>					
					</tr>
					<tr><td>Line Size</td><td></td> 	<!-- 10 -->
						<c:forEach var="k" items="${pdlist}">
							<td>
							<!-- 리스트를 따로 만들어서 For문 처리  -->
								<select name="dout_2${k.idx_2}" id="combo1" onchange="rev_go(this.form)">
									<c:forEach var="i" items="${k.size}">
										<option value="${i}" <c:if test="${k.dout_2 eq i}"> selected </c:if>>${i}</option>					
									</c:forEach>
								</select>
							</td>
						</c:forEach>					
					</tr>
					<tr><td>Schedule or Class</td><td></td>
						<c:forEach var="k" items="${pdlist}">
							<td>
								<select name="schd_2${k.idx_2}" id="combo1" onchange="rev_go(this.form)">
									<c:forEach var="i" items="${k.schedule}">
										<option value="${i}" <c:if test="${k.schd_2 eq i}"> selected </c:if>>${i}</option>					
									</c:forEach>								  	
								</select>
							</td>
						</c:forEach>						
					</tr>
					<tr><td>Inside of Dia</td><td>m</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="din_2${k.idx_2}" value="${k.din_2}" readonly></td>						
						</c:forEach>						
					</tr>
					<tr><td>Length of Pipe</td><td>m</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="plen_2${k.idx_2}" value="${k.plen_2}"  ></td>
						</c:forEach>						
					</tr>
					<tr><td>Wall Roughness</td><td>mm</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="wall_2${k.idx_2}" value="${k.wall_2}"  ></td>
						</c:forEach>						
					</tr>
					<tr><td>Elevation Change</td><td>m</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elchange_2${k.idx_2}" value="${k.elchange_2}"  ></td>
						</c:forEach>					
					</tr>
					<tr><td>Equivalent Length</td><td>m</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="eqvlen_2${k.idx_2}" value="${k.eqvlen_2}"  ></td>
						</c:forEach>					
					</tr>
					<tr><td>Fitting</td><td colspan="${pnum2 + 1}"></td></tr>
					<tr><td>90 Elbow</td><td colspan="${pnum2 + 1}"></td></tr>
					<tr><td style="position: relative; left:10px">- Threaded 
						<span style="position: relative; left:10px">Std</span></td>
						<td>(R/D=1)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elbow90_1_2${k.idx_2}" value="${k.elbow90_1_2}"    
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>							
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=1.5)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elbow90_2_2${k.idx_2}" value="${k.elbow90_2_2}"    
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					<tr>
					<tr><td style="position: relative; left:10px">- Flanged 
						<span style="position: relative; left:21px">Std</span></td>
						<td>(R/D=1)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elbow90_3_2${k.idx_2}" value="${k.elbow90_3_2}"   
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>							
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=2)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elbow90_4_2${k.idx_2}" value="${k.elbow90_4_2}"    
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>						
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=4)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elbow90_5_2${k.idx_2}" value="${k.elbow90_5_2}"    
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>						
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=6)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elbow90_6_2${k.idx_2}" value="${k.elbow90_6_2}"    
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Welded
						<span style="position: relative; left:65px">1</span></td>
						<td> weld 90</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elbow90_7_2${k.idx_2}" value="${k.elbow90_7_2}"   
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>						
					</tr>
					<tr><td style="position: relative; left:10px"><span style="position: relative; left:170px">2</span></td>
						<td>weld 45</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elbow90_8_2${k.idx_2}" value="${k.elbow90_8_2}"    
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px"><span style="position: relative; left:170px">3</span></td>
						<td>weld 30</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elbow90_9_2${k.idx_2}" value="${k.elbow90_9_2}"    
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>						
					</tr>
					<tr><td>45 Elbow</td><td></td><td colspan="${pnum + 1}"></td></tr>				
					<tr><td style="position: relative; left:10px">- Threaded 
						<span style="position: relative; left:10px">Std</span></td>
						<td>(R/D=1)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elbow45_1_2${k.idx_2}" value="${k.elbow45_1_2}"    
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=1.5)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elbow45_2_2${k.idx_2}" value="${k.elbow45_2_2}"   
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					<tr>
					<tr><td>180 Bend</td><td></td><td colspan="${pnum + 1}"></td></tr>		
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="bend_1_2${k.idx_2}" value="${k.bend_1_2}"    
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>						
					</tr>
					<tr><td style="position: relative; left:10px">- Flanged</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="bend_2_2${k.idx_2}" value="${k.bend_2_2}"    
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- All types</td><td>(R/D=1.5)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="bend_3_2${k.idx_2}" value="${k.bend_3_2}"    
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td colspan="2">Tee (branch as Elbow)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="tee_1_2${k.idx_2}" value="${k.tee_1_2}"    
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="tee_2_2${k.idx_2}" value="${k.tee_2_2}"   
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1.5)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="tee_3_2${k.idx_2}" value="${k.tee_3_2}"    
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Flanged</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="tee_4_2${k.idx_2}" value="${k.tee_4_2}"   
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					<tr>
					<tr><td colspan="2" style="position: relative; left:10px">- Stub-in branch</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="tee_5_2${k.idx_2}" value="${k.tee_5_2}"    
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					<tr>
					<tr><td colspan="2">Tee (Run-Through)</td></tr>
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="tee_6_2${k.idx_2}" value="${k.tee_6_2}"    
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Flanged</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="tee_7_2${k.idx_2}" value="${k.tee_7_2}"   
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					<tr>
					<tr><td colspan="2" style="position: relative; left:10px">- Stub-in branch</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="tee_8_2${k.idx_2}" value="${k.tee_8_2}"   
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					<tr>
					<tr><td>Valve</td><td></td></tr>
					<tr><td style="position: relative; left:10px">- Gate valve</td><td></td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="gtvalve_2${k.idx_2}" value="${k.gtvalve_2}"   
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Globe valve</td><td></td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="gbvalve_2${k.idx_2}" value="${k.gbvalve_2}"   
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Ball valve</td><td></td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="bvalve_2${k.idx_2}" value="${k.bvalve_2}"    
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Check valve</td><td>(Swing)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="cvalve_1_2${k.idx_2}" value="${k.cvalve_1_2}"    
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td></td><td>(Lift)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="cvalve_2_2${k.idx_2}" value="${k.cvalve_2_2}"    
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>
					</tr>
					
					<tr><td style="position: relative; left:10px">- Angle valve</td><td>(45)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="avalve_1_2${k.idx_2}" value="${k.avalve_1_2}"   
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td></td><td>(90)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="avalve_2_2${k.idx_2}" value="${k.avalve_2_2}"   
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px;">- Plug valve
						<span style="position: relative; left:10px">(branch flow)</span></td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="pvalve_1_2${k.idx_2}" value="${k.pvalve_1_2}"    
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>						
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px;">
						<span style="position: relative; left:100px">(straight flow)</span></td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="pvalve_2_2${k.idx_2}" value="${k.pvalve_2_2}"    
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>						
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px;">
						<span style="position: relative; left:100px">(three-way)</span></td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="pvalve_3_2${k.idx_2}" value="${k.pvalve_3_2}"    
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px;">- Diaphragm valve</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="dvalve_2${k.idx_2}" value="${k.dvalve_2}"    
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px">Reducer
						<span style="position: relative; left:65px">Diameter</span></td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="redd_2${k.idx_2}" value="${k.redd_2}"     
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td colspan="2"><span style="position: relative; left:100px">theta</span></td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="redth_2${k.idx_2}" value="${k.redth_2}"    
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px">Expander
						<span style="position: relative; left:65px">Diameter</span></td>
						<c:forEach var="k" items="${pdlist}">
							<td>
								<input type="number" name="expd_2${k.idx_2}" value="${k.expd_2}"     
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td colspan="2"><span style="position: relative; left:100px">theta</span></td>
						<c:forEach var="k" items="${pdlist}">
							<td>
								<input type="number" name="expth_2${k.idx_2}" value="${k.expth_2}"     
								<c:if test="${k.cfactor_2 ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					<tr>
				</tbody>
				
			</table>
			<br><br>
		</div>
		<br><br><br>
		</form>
	</div>
</body>
</html>