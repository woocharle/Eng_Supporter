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
		#lhyd td{padding: 4px 8px; font-size: 16px; }
		
		.process input{width: 75px;}
		.fitting input{width: 40px;}
		#dp input{width: 80px;}
		
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
			f.action="linerev.do";
			f.submit();
		}
	</script>
</head>
<body>
	<div class="intro">
		<h3>Line Hydraulic</h3>
		
		<form method="post">
			<input id="add_chart1" type="button" value="Add" onclick="add_go(this.form)"> 
			<input type="hidden" name ="cal" value="${cal}">
		</form>
			<br><br>
			
			<c:forEach var="n" items="${list}">
			<form method="post">
			<div id="lhyd">
				<table style="position: relative; left: 30px; margin-top: 20px; width: 1550px;">
					<tbody>
						<tr> <!--1  -->
							<td style="width: 170px;">Line.No</td>
							<td colspan="2">
								<input type="text" name="lineno" value="${n.lineno}" style="width: 150px">
								<input type="hidden" name ="cal" value="${cal}">
								<input type="hidden" name="idx" value="${n.idx}"/>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" value="Calculate" style="width:80px;" onclick="cal_go(this.form)">
							</td>
							<td>
								<c:if test="${n.idx ne '1'}">
									<input type="button" value="Delete" style="width:80px;" onclick="del_go(this.form)">									
								</c:if>
							</td>
							<td colspan="6"></td>
							<!-- delete 버튼은 기능 설정 쯤 개시 -->
						</tr>
						<tr style="font-size: 20px;"> <!-- 2 -->
							<td>Process</td>
							<td>Phase</td>
							<td style="width:190px;">
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
							<td><input type="number" name="over" value="${n.over}" onkeyup="rev_go(this.form)"> </td>
							<td>Outlet Press (kg/cm<sup>2</sup>G)</td>
							<td><input type="number" name="pout" value="${n.pout}" onkeyup="rev_go(this.form)"> </td>
							<td>Density (kg/m<sup>3</sup>)</td>
							<td><input type="number" name="den" value="${n.den}" onkeyup="rev_go(this.form)"> </td>
							<td>Molecular</td>
							<td><input type="number" name="mol" value="${n.mol}" onkeyup="rev_go(this.form)"> </td>
							<td>Cp/Cv</td>
						    <td><input type="number" name="cpcv" value="${n.cpcv}" onkeyup="rev_go(this.form)"> </td>	
					
	
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
						
						<c:if test="${n.cfactor eq 'fitting'}">
						<tr>
							<td colspan="10">Fitting</td>
						</tr>
						<tr class="fitting">
							<td colspan="2"> 90 Elbow Threaded</td>
							<td colspan="2"> 45 Elbow Threaded</td>
							<td colspan="2">Tee(Through-branch as Elbow)</td>
							<td>Gate Valve</td>
							<td><span style="float: left;"><input type="number" name="gtvalve" value="${n.gtvalve}" onkeyup="rev_go(this.form)"></span></td>
							<td>Ball Valve</td>
							<td><span style="float: left;"><input type="number" name="bvalve" value="${n.bvalve}" onkeyup="rev_go(this.form)"></span></td>
						</tr>
						<tr class="fitting">
							<td colspan="2">
								Std(R/D=1)&nbsp;<input type="number" name="elbow90_1" value="${n.elbow90_1}" onkeyup="rev_go(this.form)">
								<span style="position:relative; left:10px;">Long(R/D=1.5)&nbsp;
								<input type="number" name="elbow90_2" value="${n.elbow90_2}" onkeyup="rev_go(this.form)"></span>  
							</td>
							<td colspan="2">
								Std(R/D=1)&nbsp;<input type="number" name="elbow45_1" value="${n.elbow45_1}" onkeyup="rev_go(this.form)">
								<span style="position:relative; left:10px;">Long(R/D=1.5)&nbsp;
								<input type="number" name="elbow45_2" value="${n.elbow45_2}" onkeyup="rev_go(this.form)"></span>  		
							</td>
							<td><span style="position:relative; left:10px;">- Threaded (R/D=1)</span></td>
							<td><span style="float: left;"><input type="number" name="tee_1" value="${n.tee_1}" onkeyup="rev_go(this.form)"></span></td>
							<td>Globe Valve</td>
							<td><span style="float: left;"><input type="number" name="gbvalve" value="${n.gbvalve}" onkeyup="rev_go(this.form)"></span></td>
							<td>Diaphragm</td>
							<td><span style="float: left;"><input type="number" name="dvalve" value="${n.dvalve}" onkeyup="rev_go(this.form)"></span></td>

						</tr>
						

						<tr class="fitting">
							<td colspan="2"> 90 Elbow Flanged</td>
							<td colspan="2"> 180 Bend </td>
							<td><span style="position:relative; left:10px;">- Threaded (R/D=1.5)</span></td>
							<td><span style="float: left;"><input type="number" name="tee_2" value="${n.tee_2}" onkeyup="rev_go(this.form)"></span></td>
							<td colspan="2">Angle Valve</td>
							<td colspan="2">check Valve</td>
						</tr>
						
						<tr class="fitting">
							<td colspan="2">
								Std(R/D=1)&nbsp;<input type="number" name="elbow90_3" value="${n.elbow90_3}" onkeyup="rev_go(this.form)">
								<span style="position:relative; left:22px;">Long(R/D=2)&nbsp;
								<input type="number" name="elbow90_4" value="${n.elbow90_4}" onkeyup="rev_go(this.form)"></span>  
							</td>
							<td colspan="2">
								- Threaded, closed-return (R/D=1)&nbsp;<span style="position:relative; left:8px;">
								<input type="number" name="bend_1" value="${n.bend_1}" onkeyup="rev_go(this.form)"></span>
							</td>
							<td><span style="position:relative; left:10px;">- Flanged (R/D=1)</span></td>
							<td><span style="float: left;"><input type="number" name="tee_3" value="${n.tee_3}" onkeyup="rev_go(this.form)"></span></td>
							<td colspan="2">
								<span style="position:relative; left:10px;">- 45&ordm;&nbsp;&nbsp;
								<input type="number" name="avalve_1" value="${n.avalve_1}" onkeyup="rev_go(this.form)"></span>
								<span style="position:relative; left:20px;">- 90&ordm;&nbsp;&nbsp;
								<input type="number" name="avalve_2" value="${n.avalve_2}" onkeyup="rev_go(this.form)"></span>  		
							</td>
							<td colspan="2">
								<span style="position:relative; left:10px;">- swing&nbsp;&nbsp;
								<input type="number" name="cvalve_1" value="${n.cvalve_1}" onkeyup="rev_go(this.form)"></span>
								<span style="position:relative; left:20px;">- left&nbsp;&nbsp;
								<input type="number" name="cvalve_2" value="${n.cvalve_2}" onkeyup="rev_go(this.form)"></span>  		
							</td>

						</tr>
									
						<tr class="fitting">
							<td colspan="2">
								Std(R/D=4)&nbsp;<input type="number" name="elbow90_5" value="${n.elbow90_5}" onkeyup="rev_go(this.form)">
								<span style="position:relative; left:22px;">Long(R/D=6)&nbsp;
								<input type="number" name="elbow90_6" value="${n.elbow90_6}" onkeyup="rev_go(this.form)"></span>  
							</td>
							<td colspan="2">
								- Flanged (R/D=1)&nbsp;
								<span style="position:relative; left:124px;">
								<input type="number" name="bend_2" value="${n.bend_2}" onkeyup="rev_go(this.form)"></span>
							</td>
							<td><span style="position:relative; left:10px;">- Stub in branch</span></td>
							<td><span style="float: left;"><input type="number" name="tee_4" value="${n.tee_4}" onkeyup="rev_go(this.form)"></span></td>
							<td colspan="2">
								Plug Valve 
							</td>
							<td colspan="2">
								Reducer & Expander
							</td>

						</tr>	
						
						<tr class="fitting">
							<td colspan="2">90 Elbow Welded</td>
							<td colspan="2">
								- All types (R/D=1.5)&nbsp;
								<span style="position:relative; left:107px;">
								<input type="number" name="bend_2" value="${n.bend_3}" onkeyup="rev_go(this.form)"></span>
							</td>
							<td colspan="2">Tee (Run-Through)</td>
							<td><span style="position:relative; left:10px;">- branch flow</span></td>
							<td><span style="float: left;"><input type="number" name="pvalve_1" value="${n.pvalve_1}" onkeyup="rev_go(this.form)"></span></td>
							<td colspan="2">
								<span style="position:relative; left:5px;">Reducer</span> 
							</td>	

						</tr>	
						
						<tr class="fitting">
							<td colspan="2">
								<span style="position:relative; left:181px;">1 Weld 90&nbsp;
								<input type="number" name="elbow90_7" value="${n.elbow90_7}" onkeyup="rev_go(this.form)"></span>
							</td>
							<td colspan="2"></td>
							<td><span style="position:relative; left:10px;">- Threaded (R/D=1)</span></td>
							<td><span style="float: left;"><input type="number" name="tee_5" value="${n.tee_5}" onkeyup="rev_go(this.form)"></span></td>
							<td><span style="position:relative; left:10px;">- Straight though</span></td>
							<td><span style="float: left;"><input type="number" name="pvalve_2" value="${n.pvalve_2}" onkeyup="rev_go(this.form)"></span></td>
							<td colspan="2">
								<span style="position:relative; left:10px;">- dia.(in)&nbsp;
								<input type="number" name="redd" value="${n.redd}" onkeyup="rev_go(this.form)"></span>
								<span style="position:relative; left:10px;">- theta&nbsp;
								<input type="number" name="redth" value="${n.redth}" onkeyup="rev_go(this.form)"></span>  		
							</td>	
						</tr>	
											
						<tr class="fitting">
							<td colspan="2">
								<span style="position:relative; left:181px;">2 Weld 45&nbsp;
								<input type="number" name="elbow90_8" value="${n.elbow90_8}" onkeyup="rev_go(this.form)"></span>
							</td>
							<td colspan="2"></td>
							<td><span style="position:relative; left:10px;">- Flanged (R/D=1)</span></td>
							<td><span style="float: left;"><input type="number" name="tee_6" value="${tee_6}" onkeyup="rev_go(this.form)"></span></td>
							<td><span style="position:relative; left:10px;">- three way</span></td>
							<td rowspan="2"><span style="float: left;">
							<input type="number" name="pvalve_3" value="${n.pvalve_3}" onkeyup="rev_go(this.form)"></span></td>
							<td colspan="2">
								<span style="position:relative; left:5px;">Expander</span>
							</td>
						</tr>	
											
						<tr class="fitting">
							<td colspan="2">
								<span style="position:relative; left:181px;">3 Weld 30&nbsp;
								<input type="number" name="elbow90_9" value="${n.elbow90_9}" onkeyup="rev_go(this.form)"></span>
							</td>
							<td colspan="2"></td>
							<td><span style="position:relative; left:10px;">- Stub in branch</span></td>
							<td><span style="float: left;"><input type="number" name="tee_7" value="${n.tee_7}" onkeyup="rev_go(this.form)"></span></td>
							<td><span style="position:relative; left:20px;">(flow though)</span></td>
							<td colspan="2">
								<span style="position:relative; left:10px;">- dia.(in)&nbsp;
								<input type="number" name="expd" value="${n.expd}" onkeyup="rev_go(this.form)"></span>
								<span style="position:relative; left:10px;">- theta&nbsp;
								<input type="number" name="expth" value="${n.expth}" onkeyup="rev_go(this.form)"></span> 
							</td>
						</tr>	
						</c:if>			

					</tbody>
					
				</table>
				
			</div>
			<br><br>
			</form>

			</c:forEach>

	</div>

	
</body>
</html>