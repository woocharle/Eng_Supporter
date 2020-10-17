<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>Engineering Support</title>
	<style type="text/css">	
		.intro{width: 75%; height: 1400px; position: relative; left: 400px; bottom: 1430px; overflow: auto;}
		.intro h3{position: relative; left: 50px; font-size: 30px; margin-bottom: 40px;}
		.intro table{position: relative; left: 60px; font-size: 20px; margin-bottom: 40px;}
	
		#add_chart1{position: relative; left: 950px; font-size: 20px; height: 30px; width: 100px;}
		#lhyd{position: relative; left: 50px; overflow: scroll; width: 1000px; height: 450px; border: 1px solid black;}
		#lhyd td{padding: 2px 4px; font-size: 20px; height:30px; }
		#lhyd input{font-size: 16px;}
		
		.process input{width: 75px;}
		#dp input{width: 80px;}
		
		#linehyd4{position: relative; left: 50px; bottom:20px; width:1600px;}	
		#linehyd4 td {height: 30px;  font-size: 20px; vertical-align: middle; padding: 2px;}
		.fitting input{width: 40px; font-size: 16px;}
		.fitting2 {position:relative; left:10px;}

		
	</style>
	<script type="text/javascript">
 		function add_go(f) {
			f.action="lineadd.do";
			f.submit();
		}
	
		function del_go(f) {
			f.action="linedel.do";
			f.submit();
		}
	
		function rev_go(f){	
			f.action="linerev.do";
			f.submit();
		}
		
		function cal_go(f){
			alert("작업중");
		}
	</script>
</head>
<body>
	<div class="intro">
		<h3>Line Hydraulic</h3>
		
		<c:forEach var="n" items="${list}">
		<form method="post">
			<input id="add_chart1" type="button" value="Add" onclick="add_go(this.form)"> 
			<input type="hidden" name ="cal" value="${cal}">

			<br><br>
			
			<div id="lhyd">
				<table style="position: relative; left: 40px; margin-top: 20px; width: 1550px;">
					<tbody>
						<tr> <!--1  -->
							<td style="width: 170px; height:40px;">Line.No</td>
							<td colspan="2">
								<input type="text" name="lineno" value="${n.lineno}" style="width: 150px">
								<input type="hidden" name ="cal" value="${cal}">
								<input type="hidden" name="idx" value="${n.idx}"/>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" value="Calculate" style="width:100px; font-size: 18px;" onclick="cal_go(this.form)">
							</td>
							<td>
								<c:if test="${n.idx ne '1'}">
									<input type="button" value="Delete" style="width:100px; font-size: 18px;" onclick="del_go(this.form)">									
								</c:if>
							</td>
							<td colspan="6"></td>
							<!-- delete 버튼은 기능 설정 쯤 개시 -->
						</tr>
						<tr style="font-size: 20px;"> <!-- 2 -->
							<td>Process</td>
							<td>Phase</td>
							<td style="width:250px;">
								<select style="width: 100px; font-size: 16px;" name="phase" onchange="rev_go(this.form)">
									<option value="liquid" <c:if test="${n.phase eq 'liquid'}">selected </c:if>>Liquid</option>
									<option value="vapor" <c:if test="${n.phase eq 'vapor'}">selected </c:if>>Vapor </option>
								</select>
							</td>
							<td colspan="3">							
								<input type="radio" id="Inlet" name="press"  value="Inlet" onclick="rev_go(this.form)"
								<c:if test="${n.press eq 'Inlet'}">checked </c:if>> 
								<label for="Inlet">Inlet</label>
								&nbsp;&nbsp;
								<input type="radio" id="Outlet" name="press" value="Outlet" onclick="rev_go(this.form)" 
								<c:if test="${n.press eq 'Outlet'}">checked </c:if>>
								<label for="Outlet">Outlet</label>
							</td>
							<td colspan="3"></td>

							<!-- jstl로 readonly 지정  -->
						</tr>
						<tr class="process"> <!-- 3 -->
							<td>Flow rate (kg/hr)  </td>
							<td><input type="number" name="flow" value="${n.flow}" > </td>								
							<td>Inlet Press (kg/cm<sup>2</sup>G)</td>
							<td><input type="number" name="pin" value="${n.pin}" > </td>
							<td>Temperature (C)</td>
							<td style="width:90px; "><input type="number" name="temp" value="${n.temp}" > </td>
							<td>Viscosity (cP)</td>
							<td><input type="number" name="vis" value="${n.vis}" > </td>
							<td>Compress fact (Z)</td>
							<td><input type="number" name="compress" value="${n.compress}"> </td>								


						</tr>
						<tr class="process"> <!-- 4 -->
							<td>Over Design (%)</td>
							<td><input type="number" name="over" value="${n.over}" > </td>
							<td>Outlet Press (kg/cm<sup>2</sup>G)</td>
							<td><input type="number" name="pout" value="${n.pout}"> </td>
							<td>Density (kg/m<sup>3</sup>)</td>
							<td><input type="number" name="den" value="${n.den}" > </td>
							<td>Molecular</td>
							<td><input type="number" name="mol" value="${n.mol}" > </td>
							<td>Cp/Cv</td>
						    <td><input type="number" name="cpcv" value="${n.cpcv}" > </td>	
					
	
						</tr>
						<tr id="dp"> 
							<td>Press drop (kg/cm<sup>2</sup>G)</td>
							<td>Total: </td>
							<td><input type="number" name="tdp" value="${n.tdp}" disabled="disabled"></td>
							<td colspan="7">	
								Friction: &nbsp;&nbsp;&nbsp;&nbsp;
								<input type="number" name="fdp" value="${n.fdp}" disabled="disabled">
								&nbsp;&nbsp;&nbsp;&nbsp;
								Gravity: &nbsp;&nbsp;&nbsp;&nbsp;
								<input type="number" name="gdp" value="${n.gdp}" disabled="disabled">
								&nbsp;&nbsp;&nbsp;&nbsp;
								press/100m: &nbsp;&nbsp;&nbsp;
								<input type="number" name="dplen" value="${n.dplen}" disabled="disabled"> 
							</td>

						</tr>
						<tr><td colspan="10">Pipe Spec.</td></tr>
						<tr class="process"> 
							<td>Complex Factor</td>
							<td colspan="2">
								<select  style="width: 250px; font-size: 16px;" name="cfactor" onchange="rev_go(this.form)">
									<option value="fitting" <c:if test="${n.cfactor eq 'fitting'}">selected </c:if>>Fitting (직접입력)</option>	
									<option value="utility" <c:if test="${n.cfactor eq 'utility'}">selected </c:if>>Utility Supply Lines (1)</option>
									<option value="long" <c:if test="${n.cfactor eq 'long'}">selected </c:if>>Long Straight Piping Runs (1) </option>
									<option value="norpipe" <c:if test="${n.cfactor eq 'norpipe'}">selected </c:if>>Normal Piping (1.5)</option>
									<option value="manifold" <c:if test="${n.cfactor eq 'manifold'}">selected </c:if>>Normal Manifold-type Piping (2)</option>
									<option value="complex" <c:if test="${n.cfactor eq 'complex'}">selected </c:if>>Very Complex Manifolds (3)</option>
								</select>
							</td>
							<td colspan="2">
								Equivalent Length
								&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="number" name="eqvlen" value="${n.eqvlen}" disabled="disabled">
							</td>
							<td colspan="4"></td>
						</tr>
						<tr class="process">
							<td>Line Size (inch)</td>
							<td>
								<select style="width: 100px; font-size: 16px;" name="dout" onchange="rev_go(this.form)" >
									<c:forEach var="k" items="${n.dlist}">
										<option value="${k}" <c:if test="${k eq n.dout}">selected </c:if> >${k}</option>
									</c:forEach>
								</select>
							</td>
							<td>Inside of Dia (m) </td>
							<td><input type="number" name="din" value="${n.din}" disabled="disabled"></td>
							<td>Wall Roughness</td>
							<td><input type="number" name="wall" value="${n.wall}" onkeyup="rev_go(this.form)"></td>			
							<td colspan="4"></td>
						</tr>
						<tr class="process">
							<td>schedule or Class</td>
							<td>
								<select style="width: 100px; font-size: 16px;" name="sch" onchange="rev_go(this.form)" >
									<c:forEach var="k" items="${n.slist}">
										<option value="${k}" <c:if test="${k eq n.sch}">selected </c:if>>${k}</option>
									</c:forEach>
								</select>
							</td>
							<td>Length of Pipe (m)</td>
							<td><input type="number" name="pipelen" value="${n.pipelen}" onkeyup="rev_go(this.form)"></td>	
							<td>Elevation Change</td>					
							<td><input type="number" name="ellen" value="${n.ellen}" disabled="disabled"></td>						
							<td colspan="4"></td>
						</tr>
					</tbody>
					
				</table>			
				<c:if test="${n.cfactor eq 'fitting'}">
					<table id="linehyd4">
						<thead>
							<tr>
								<th style="width: 10%"></th><th style="width: 4%"></th><th style="width: 10%"></th><th style="width: 4%"></th>
								<th style="width: 8%"></th><th style="width: 4%"></th><th style="width: 10%"></th><th style="width: 4%"></th>
								<th style="width: 14%"></th><th style="width: 4%"></th><th></th><th></th>
								<th></th><th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="14">Fitting</td>
							</tr>
							<tr class="fitting">
								<td colspan="4"> 90&deg; Elbow Threaded</td>
								<td colspan="4"> 45&deg; Elbow Threaded</td>
								<td colspan="2">Tee(Through-branch as Elbow)</td>
								<td class="fitting2">Gate Valve</td>
								<td><input type="number" name="gtvalve" value="${n.gtvalve}"></td>
								<td class="fitting2">Ball Valve</td>
								<td><input type="number" name="bvalve" value="${n.bvalve}" ></td>
							</tr>
							<tr class="fitting">
								<td class="fitting2">Std(R/D=1)</td>
								<td><input type="number" name="elbow90_1" value="${n.elbow90_1}" ></td>
								<td class="fitting2">Long(R/D=1.5)</td>
								<td><input type="number" name="elbow90_2" value="${n.elbow90_2}" ></td>
								<td class="fitting2">Std(R/D=1)</td>
								<td><input type="number" name="elbow45_1" value="${n.elbow45_1}" ></td>
								<td class="fitting2">Long(R/D=1.5)</td>
								<td><input type="number" name="elbow45_2" value="${n.elbow45_2}" ></td>
								<td class="fitting2">- Threaded (R/D=1)</td>
								<td><input type="number" name="tee_1" value="${n.tee_1}" ></td>
								<td class="fitting2">Globe Valve</td>
								<td><input type="number" name="gbvalve" value="${n.gbvalve}" ></td>
								<td class="fitting2">Diaphragm</td>
								<td><input type="number" name="dvalve" value="${n.dvalve}"></td>							
								
							</tr>
							
							<tr class="fitting">
								<td colspan="4"> 90&deg; Elbow Flanged or Welded</td>
								<td colspan="4"> 45&deg; Elbow Mitered</td>
								<td class="fitting2">- Threaded (R/D=1.5)</td>
								<td><input type="number" name="tee_2" value="${n.tee_2}" ></td>
								<td class="fitting2">Angle Valve</td>
								<td colspan="3">
									<span style="position:relative; left:10px;">- 45&deg;: <input type="number" name="avalve_1" value="${n.avalve_1}" > </span>
									<span style="position:relative; left:40px;">- 90&deg;: <input type="number" name="avalve_2" value="${n.avalve_2}" > </span>
								</td>
							</tr>
							
							<tr class="fitting">
								<td class="fitting2">Std(R/D=1)</td>
								<td><input type="number" name="elbow90_3" value="${n.elbow90_3}" ></td>
								<td class="fitting2">Long(R/D=2)</td>
								<td><input type="number" name="elbow90_4" value="${n.elbow90_4}" ></td>						
								<td class="fitting2">1 weld 45&deg;</td>
								<td><input type="number" name="elbow45_3" value="${n.elbow45_3}" ></td>
								<td class="fitting2">2 weld 22.5&deg;</td>
								<td><input type="number" name="elbow45_4" value="${n.elbow45_4}" ></td>
								<td class="fitting2">- Flanged (R/D=1)</td>
								<td><input type="number" name="tee_3" value="${n.tee_3}"></td>
								<td class="fitting2" >check Valve</td>
								<td colspan="3">
									<span style="position:relative; left:10px;">- swing&deg;: <input type="number" name="cvalve_1" value="${n.cvalve_1}" > </span>
									<span style="position:relative; left:10px;">- left&deg;: <input type="number" name="cvalve_2" value="${n.cvalve_2}" > </span>							
								</td>
							</tr>
							<tr class="fitting">
								<td class="fitting2">Long(R/D=4)</td>
								<td><input type="number" name="elbow90_5" value="${n.elbow90_5}" ></td>
								<td class="fitting2">Long(R/D=6)</td>
								<td><input type="number" name="elbow90_6" value="${n.elbow90_6}" ></td>	
								<td colspan="4"> </td>						
								<td class="fitting2">- Stub in branch</td>
								<td><input type="number" name="tee_4" value="${n.tee_4}"></td>	
								<td class="fitting2" colspan="4">Plug Valve </td>
							</tr>
							<tr class="fitting">
								<td colspan="4"> 90&deg; Elbow Mitered</td>
								<td colspan="4"> 180&deg; Bend </td>	
								<td colspan="2">Tee (Run-Through)</td>
								<td class="fitting2">- branch flow</td>
								<td><span style="position:relative; left:10px;"><input type="number" name="pvalve_1" value="${n.pvalve_1}" ></span></td>
								<td class="fitting2">- three way</td>
								<td><input type="number" name="pvalve_3" value="${n.pvalve_3}" ></td>							
							</tr>
							<tr class="fitting">
								<td class="fitting2">1 weld 90&deg; </td>
								<td><input type="number" name="elbow90_7" value="${n.elbow90_7}" ></td>
								<td colspan="2"></td>
								<td colspan="3" class="fitting2">- Threaded, closed-return (R/D=1)</td>
								<td><input type="number" name="bend_1" value="${n.bend_1}" ></td>														
								<td class="fitting2">- Threaded (R/D=1)</td>
								<td><input type="number" name="tee_5" value="${n.tee_5}" ></td>	
								<td class="fitting2" colspan="2">- Straight though </td>	
								<td colspan="2"><input type="number" name="pvalve_2" value="${n.pvalve_2}"></td>
							</tr>
							<tr class="fitting">
								<td class="fitting2">2 weld 45&deg; </td>
								<td><input type="number" name="elbow90_8" value="${n.elbow90_8}" ></td>							
								<td colspan="2"></td>
								<td colspan="3" class="fitting2">- Flanged (R/D=1)</td>
								<td><input type="number" name="bend_2" value="${n.bend_2}"></td>
								<td class="fitting2">- Flanged (R/D=1)</td>
								<td><input type="number" name="tee_6" value="${tee_6}" ></td>
								<td class="fitting2">Reducer: </td>
								<td colspan="3">
									<span style="position:relative; right:10px;">diameter(inch) <input type="number" name="redd" value="${n.redd}" > </span>
									<span style="position:relative; left:5px;"> theta <input type="number" name="redth" value="${n.redth}" > </span>							
								</td>														
							</tr>
							<tr class="fitting">
								<td class="fitting2">3 weld 30&deg; </td>
								<td><input type="number" name="elbow90_9" value="${n.elbow90_9}" ></td>							
								<td colspan="2"></td>
								<td colspan="3" class="fitting2">- All types (R/D=1.5)</td>
								<td><input type="number" name="bend_2" value="${n.bend_3}"></td>							
								<td><span style="position:relative; left:10px;">- Stub in branch</span></td>
								<td><span style="float: left;"><input type="number" name="tee_7" value="${n.tee_7}" onkeyup="rev_go(this.form)"></span></td>	
								<td class="fitting2">Expander: </td>
								<td colspan="3">
									<span style="position:relative; right:10px;">diameter(inch) <input type="number" name="expd" value="${n.expd}" > </span>
									<span style="position:relative; left:5px;"> theta <input type="number" name="expth" value="${n.expth}" > </span>							
								</td>							
							</tr>
						</tbody>
					</table>	
				</c:if>			
	
			</div>
			<br><br>
			</form>

			</c:forEach>

	</div>

	
</body>
</html>