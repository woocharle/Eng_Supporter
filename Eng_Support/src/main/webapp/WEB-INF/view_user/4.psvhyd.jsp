
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
		#pspec{position: relative; left: 10px; width: 1000px;}
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
			f.action="psvrev.do";
			f.submit(); 
		}
		
		function add1_go(f) {
			f.action="psvlineadd1.do";
			f.submit(); 
		}
		
		function add2_go(f) {
			f.action="psvlineadd2.do";
			f.submit(); 
		}
		
		function del1_go(f) {
			if(f.section1.value == 0){
				alert("section값을 선택하시오.");
				return;
		
			} else {
				f.action="psvlinedel1.do";
				f.submit(); 
			}

		}
		
		function del2_go(f) {
			if(f.section2.value == 0){
				alert("section값을 선택하시오.");
				return;
		
			} else {
				f.action="psvlinedel2.do";
				f.submit(); 
			}
		}
		
	
	</script>
</head>
<body>
	<div class="intro">
		<h3>PSV Hydraulic</h3>
		<h4>PSV Specification</h4>
			<form method="post">
			<input type="hidden" name ="cal" value="${cal}">
			<table id="pspec">
				<thead>
					<tr>
						<th>Item No. (PSV)</th><th><input type="text" name="item1" value="${psv.item1}" class="pspec1" ></th>
						<th>Rev No.</th><th><input type="text" name="rev" value="${psv.rev}" class="pspec1" ></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2">Suction</td><td></td>
						<td colspan="2">Discharge</td><td></td>
					<tr>
					<tr>
						<td>Item No.(Depart)</td><td><input type="text" name="item1" value="${psv.item2}" class="pspec1" ></td><td></td>
						<td>Item No.(Arrive)</td><td><input type="text" name="psuc" value="${psv.item3}" class="pspec2"  readonly> </td><td></td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td>Set. Press</td><td><input type="number" name="setpress" class="pspec1" value="${psv.setpress}" ></td><td>kg/cm2</td>
						<td>Operating press</td><td><input type="number" name="op" class="pspec2" value="${psv.op}" readonly> </td><td>kg/cm2</td>
					</tr>
					<tr>
						<td>Limit of Press. Drop</td><td><input type="number" name="limitdp" class="pspec1" value="${psv.limitdp}" ></td><td>%</td>
						<td></td><td></td><td></td>
					</tr>
					<tr>
						<td>Suction Press</td><td><input type="number" name="psuc" class="pspec1" value="${psv.psuc}" ></td><td>kg/cm2</td>
						<td>discharge Press</td><td><input type="number" name="pdis" class="pspec2" value="${psv.pdis}" readonly> </td><td>kg/cm2</td>
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
								<option value="0">삭제할 section 선택::</option>	
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
					<tr><td>Molecular</td><td></td> 	 <!-- 6 -->
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="mol${k.idx}" value="${k.mol}" ></td>				
						</c:forEach>					
					</tr>
					<tr><td>Compress fact.(z)</td><td></td> 	 <!-- 6 -->
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="cmpz${k.idx}" value="${k.cmpz}" ></td>				
						</c:forEach>					
					</tr>
					<tr><td>Cp/Cv</td><td></td> 	 <!-- 6 -->
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="cpcv${k.idx}" value="${k.cpcv}" ></td>				
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
					<tr><td>Reynold.no</td><td>m</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="reynold${k.idx}" value="${k.reynold}"  ></td>
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
					<tr><td>45 Elbow Mitered</td></tr>				
					<tr><td style="position: relative; left:10px">- Threaded <span style="position: relative; left:10px">Std</span></td>
						<td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow45_3${k.idx}" value="${k.elbow45_3}"  
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=1.5)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="elbow45_4${k.idx}" value="${k.elbow45_4}"  
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
					<tr><td colspan="2">Tee (branch as Elbow)</td></tr>
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_1${k.idx}" value="${k.tee_1}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1.5)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_2${k.idx}" value="${k.tee_2}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Flanged</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_3${k.idx}" value="${k.tee_3}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					<tr>
					<tr><td colspan="2" style="position: relative; left:10px">- Stub-in branch</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_4${k.idx}" value="${k.tee_4}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					<tr>
					<tr><td colspan="2">Tee (Run-Through)</td></tr>
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_5${k.idx}" value="${k.tee_5}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Flanged</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_6${k.idx}" value="${k.tee_6}" 
								<c:if test="${k.cfactor ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					<tr>
					<tr><td colspan="2" style="position: relative; left:10px">- Stub-in branch</td>
						<c:forEach var="k" items="${pslist}">
							<td><input type="number" name="tee_7${k.idx}" value="${k.tee_7}" 
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
					<tr>
						<td style="height:30px;"> 
							<select name="section2" id="section1">
								<option value="0">삭제할 section 선택::</option>	
								<c:forEach var="k" items="${pdlist}">
									<option value="${k.idx_d}">Section ${k.idx_d}</option>					
								</c:forEach>
							</select>
						</td>
						<td>
							<input type="button" value="delete" onclick="del2_go(this.form)" style="width:85px; font-size:18px; margin:inherit;">
						</td>
						<c:forEach var="k" items="${pdlist}" >
							<td style="text-align: center; font-size: 18px;">Section ${k.idx_d}</td>
						</c:forEach>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:200px;">Line.No</td>
						<td style="width:100px;">
							<input type="button" value="add" onclick="add2_go(this.form)" style="width:85px; font-size:18px; margin:inherit;">
						</td>
						<c:forEach var="k" items="${pdlist}">  <!-- 1 -->
							<td><input type="text" name="lineno_d${k.idx_d}" value="${k.lineno_d}" style="width: 90px;"></td>
						</c:forEach>
					</tr>
					<tr><td>Pressure (In)</td><td>kg/cm2</td>  <!-- 2 -->
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="pin_d${k.idx_d}" value="${k.pin_d}" disabled="disabled"></td>
						</c:forEach>
					</tr>
					<tr><td>Pressure (out)</td><td>kg/cm2</td>  <!-- 3 -->
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="pout_d${k.idx_d}" value="${k.pout_d}"  disabled="disabled"></td>
						</c:forEach>					
					</tr>
					<tr><td>Temperature</td><td>C</td>  <!-- 4 -->
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="temp_d${k.idx_d}" value="${k.temp_d}"  ></td>
						</c:forEach>					
					</tr>
					<tr><td>Density</td><td>kg/m3</td>  <!-- 5 -->
						<c:forEach var="k" items="${pdlist}">
							<td> <input type="number" name="den_d${k.idx_d}" value="${k.den_d}" ></td>							
						</c:forEach>
					</tr>
					<tr><td>Viscosity</td><td>cP</td> 	 <!-- 6 -->
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="vis_d${k.idx_d}" value="${k.vis_d}" ></td>				
						</c:forEach>					
					</tr>
					<tr><td>Molecular</td><td></td> 	 <!-- 6 -->
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="mol_d${k.idx_d}" value="${k.mol_d}" ></td>				
						</c:forEach>					
					</tr>
					<tr><td>Compress fact.(z)</td><td></td> 	 <!-- 6 -->
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="cmpz_d${k.idx_d}" value="${k.cmpz_d}" ></td>				
						</c:forEach>					
					</tr>
					<tr><td>Cp/Cv</td><td></td> 	 <!-- 6 -->
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="cpcv_d${k.idx_d}" value="${k.cpcv_d}" ></td>				
						</c:forEach>					
					</tr>
					<tr><td>Flow rate</td><td>kg/hr</td>  <!-- 7 -->
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="flow_d${k.idx_d}" value="${k.flow_d}" ></td>						
						</c:forEach>				
					</tr>
					<tr><td>Over Design</td><td>%</td>  	<!-- 8 -->
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="per_d${k.idx_d}" value="${k.per_d}" >	</td>					
						</c:forEach>					
					</tr>
					<tr><td>Complex factor</td><td></td>
						<!-- 9 -->
						<c:forEach var="k" items="${pdlist}">
							<td>			
								<select name="cfactor_d${k.idx_d}" id="combo1" onchange="rev_go(this.form)">
									<option value="fitting" <c:if test="${k.cfactor_d eq 'fitting'}"> selected </c:if>>Fitting (직접입력)</option>	
									<option value="utility" <c:if test="${k.cfactor_d eq 'utility'}"> selected </c:if>>Utility Supply Lines (1)</option>
									<option value="long" <c:if test="${k.cfactor_d eq 'long'}"> selected </c:if>>Long Straight Piping Runs (1) </option>
									<option value="norpipe" <c:if test="${k.cfactor_d eq 'norpipe'}"> selected </c:if>>Normal Piping (1.5)</option>
									<option value="manifold" <c:if test="${k.cfactor_d eq 'manifold'}"> selected </c:if>>Normal Manifold-type Piping (2)</option>
									<option value="complex"<c:if test="${k.cfactor_d eq 'complex'}"> selected </c:if>>Very Complex Manifolds (3)</option>
								</select>
							</td>
						</c:forEach>					
					</tr>
					<tr><td>Line Size</td><td></td> 	<!-- 10 -->
						<c:forEach var="k" items="${pdlist}">
							<td>
							<!-- 리스트를 따로 만들어서 For문 처리  -->
								<select name="dout_d${k.idx_d}" id="combo1" onchange="rev_go(this.form)">
									<c:forEach var="i" items="${k.size}">
										<option value="${i}" <c:if test="${k.dout_d eq i}"> selected </c:if>>${i}</option>					
									</c:forEach>
								</select>
							</td>
						</c:forEach>					
					</tr>
					<tr><td>Schedule or Class</td><td></td>
						<c:forEach var="k" items="${pdlist}">
							<td>
								<select name="schd_d${k.idx_d}" id="combo1" onchange="rev_go(this.form)">
									<c:forEach var="i" items="${k.schedule}">
										<option value="${i}" <c:if test="${k.schd_d eq i}"> selected </c:if>>${i}</option>					
									</c:forEach>								  	
								</select>
							</td>
						</c:forEach>						
					</tr>
					<tr><td>Inside of Dia</td><td>m</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="din_d${k.idx_d}" value="${k.din_d}" readonly></td>						
						</c:forEach>						
					</tr>
					<tr><td>Length of Pipe</td><td>m</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="plen_d${k.idx_d}" value="${k.plen_d}"  ></td>
						</c:forEach>						
					</tr>
					<tr><td>Wall Roughness</td><td>mm</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="wall_d${k.idx_d}" value="${k.wall_d}"  ></td>
						</c:forEach>						
					</tr>
					<tr><td>Elevation Change</td><td>m</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elchange_d${k.idx_d}" value="${k.elchange_d}"  ></td>
						</c:forEach>					
					</tr>
					<tr><td>Equivalent Length</td><td>m</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="eqvlen_d${k.idx_d}" value="${k.eqvlen_d}"  ></td>
						</c:forEach>					
					</tr>
					<tr><td>Reynold.no</td><td>m</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="reynold_d${k.idx_d}" value="${k.reynold_d}"  ></td>
						</c:forEach>					
					</tr>
					<tr><td>Fitting</td><td colspan="${pnum2 + 1}"></td></tr>
					<tr><td>90 Elbow</td><td colspan="${pnum2 + 1}"></td></tr>
					<tr><td style="position: relative; left:10px">- Threaded 
						<span style="position: relative; left:10px">Std</span></td>
						<td>(R/D=1)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elbow90_1_d${k.idx_d}" value="${k.elbow90_1_d}"    
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>							
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=1.5)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elbow90_2_d${k.idx_d}" value="${k.elbow90_2_d}"    
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					<tr>
					<tr><td style="position: relative; left:10px">- Flanged 
						<span style="position: relative; left:21px">Std</span></td>
						<td>(R/D=1)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elbow90_3_d${k.idx_d}" value="${k.elbow90_3_d}"   
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>							
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=2)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elbow90_4_d${k.idx_d}" value="${k.elbow90_4_d}"    
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>						
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=4)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elbow90_5_d${k.idx_d}" value="${k.elbow90_5_d}"    
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>						
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=6)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elbow90_6_d${k.idx_d}" value="${k.elbow90_6_d}"    
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Welded
						<span style="position: relative; left:65px">1</span></td>
						<td> weld 90</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elbow90_7_d${k.idx_d}" value="${k.elbow90_7_d}"   
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>						
					</tr>
					<tr><td style="position: relative; left:10px"><span style="position: relative; left:170px">2</span></td>
						<td>weld 45</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elbow90_8_d${k.idx_d}" value="${k.elbow90_8_d}"    
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px"><span style="position: relative; left:170px">3</span></td>
						<td>weld 30</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elbow90_9_d${k.idx_d}" value="${k.elbow90_9_d}"    
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>						
					</tr>
					<tr><td>45 Elbow</td><td></td><td colspan="${pnum + 1}"></td></tr>				
					<tr><td style="position: relative; left:10px">- Threaded 
						<span style="position: relative; left:10px">Std</span></td>
						<td>(R/D=1)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elbow45_1_d${k.idx_d}" value="${k.elbow45_1_d}"    
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=1.5)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elbow45_2_d${k.idx_d}" value="${k.elbow45_2_d}"   
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					<tr>
					<tr><td>45 Elbow Mitered</td></tr>				
					<tr><td style="position: relative; left:10px">- Threaded <span style="position: relative; left:10px">Std</span></td>
						<td>(R/D=1)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elbow45_3_d${k.idx_d}" value="${k.elbow45_3_d}"  
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>
					</tr>
					<tr><td style="position: relative; left:127px">Long</td><td>(R/D=1.5)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="elbow45_4_d${k.idx_d}" value="${k.elbow45_4_d}"  
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>
					<tr>
					<tr><td>180 Bend</td><td></td><td colspan="${pnum + 1}"></td></tr>		
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="bend_1_d${k.idx_d}" value="${k.bend_1_d}"    
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>						
					</tr>
					<tr><td style="position: relative; left:10px">- Flanged</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="bend_2_d${k.idx_d}" value="${k.bend_2_d}"    
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- All types</td><td>(R/D=1.5)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="bend_3_d${k.idx_d}" value="${k.bend_3_d}"    
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td colspan="2">Tee (branch as Elbow)</td></tr>
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="tee_1_d${k.idx_d}" value="${k.tee_1_d}"   
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1.5)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="tee_2_d${k.idx_d}" value="${k.tee_2_d}"    
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Flanged</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="tee_3_d${k.idx_d}" value="${k.tee_3_d}"   
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					<tr>
					<tr><td colspan="2" style="position: relative; left:10px">- Stub-in branch</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="tee_4_d${k.idx_d}" value="${k.tee_4_d}"    
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					<tr>
					<tr><td colspan="2">Tee (Run-Through)</td></tr>
					<tr><td style="position: relative; left:10px">- Threaded</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="tee_5_d${k.idx_d}" value="${k.tee_5_d}"    
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Flanged</td><td>(R/D=1)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="tee_6_d${k.idx_d}" value="${k.tee_6_d}"   
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					<tr>
					<tr><td colspan="2" style="position: relative; left:10px">- Stub-in branch</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="tee_7_d${k.idx_d}" value="${k.tee_7_d}"   
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					<tr>
					<tr><td>Valve</td><td></td></tr>
					<tr><td style="position: relative; left:10px">- Gate valve</td><td></td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="gtvalve_d${k.idx_d}" value="${k.gtvalve_d}"   
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td style="position: relative; left:10px">- Globe valve</td><td></td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="gbvalve_d${k.idx_d}" value="${k.gbvalve_d}"   
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Ball valve</td><td></td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="bvalve_d${k.idx_d}" value="${k.bvalve_d}"    
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td style="position: relative; left:10px">- Check valve</td><td>(Swing)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="cvalve_1_d${k.idx_d}" value="${k.cvalve_1_d}"    
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td></td><td>(Lift)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="cvalve_2_d${k.idx_d}" value="${k.cvalve_2_d}"    
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>
					</tr>
					
					<tr><td style="position: relative; left:10px">- Angle valve</td><td>(45)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="avalve_1_d${k.idx_d}" value="${k.avalve_1_d}"   
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td></td><td>(90)</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="avalve_2_d${k.idx_d}" value="${k.avalve_2_d}"   
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px;">- Plug valve
						<span style="position: relative; left:10px">(branch flow)</span></td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="pvalve_1_d${k.idx_d}" value="${k.pvalve_1_d}"    
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>						
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px;">
						<span style="position: relative; left:100px">(straight flow)</span></td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="pvalve_2_d${k.idx_d}" value="${k.pvalve_2_d}"    
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>						
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px;">
						<span style="position: relative; left:100px">(three-way)</span></td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="pvalve_3_d${k.idx_d}" value="${k.pvalve_3_d}"    
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px;">- Diaphragm valve</td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="dvalve_d${k.idx_d}" value="${k.dvalve_d}"    
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px">Reducer
						<span style="position: relative; left:65px">Diameter</span></td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="redd_d${k.idx_d}" value="${k.redd_d}"     
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>					
					</tr>
					<tr><td colspan="2"><span style="position: relative; left:100px">theta</span></td>
						<c:forEach var="k" items="${pdlist}">
							<td><input type="number" name="redth_d${k.idx_d}" value="${k.redth_d}"    
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td colspan="2" style="position: relative; left:10px">Expander
						<span style="position: relative; left:65px">Diameter</span></td>
						<c:forEach var="k" items="${pdlist}">
							<td>
								<input type="number" name="expd_d${k.idx_d}" value="${k.expd_d}"     
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
							</td>
						</c:forEach>				
					</tr>
					<tr><td colspan="2"><span style="position: relative; left:100px">theta</span></td>
						<c:forEach var="k" items="${pdlist}">
							<td>
								<input type="number" name="expth_d${k.idx_d}" value="${k.expth_d}"     
								<c:if test="${k.cfactor_d ne 'fitting'}"> disabled </c:if>>
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