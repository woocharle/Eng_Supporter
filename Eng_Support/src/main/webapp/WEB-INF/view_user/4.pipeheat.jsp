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
		.intro table{width:700px; margin-bottom: 20px;}
		.intro h3{position: relative; left: 50px; font-size: 30px; margin-bottom: 50px;}	
		.intro h4{position: relative; left: 60px; font-size: 25px; margin-bottom: 20px; font-weight: normal;}	


	</style>

    <script type="text/javascript">
		function rev_go(f) {
			f.action="pipeheat_rev.do";
			f.submit(); 
		}
		
		function add_go(f) {
			f.action="pipeheat_add.do";
			f.submit(); 
		}
				
		function del_go(f) {
			if(f.section1.value == 0){
				alert("section값을 선택하시오.");
				return;
		
			} else {
				f.action="pipeheat_del.do";
				f.submit(); 
			}

		}
		
		function cal_go(f) {
			alert("작업중");
		}
		
	
	</script>
</head>
<body>
	<div class="intro">
		<h3> Pipe Heat Transfer </h3>
		
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
						<td colspan="2">Phase</td>
						<td style="width:190px;">
							<select style="width: 100px; font-size: 16px;" name="phase" onchange="rev_go(this.form)">
								<option value="liquid" <c:if test="${n.phase eq 'liquid'}">selected </c:if>>Liquid</option>
								<option value="vapor" <c:if test="${n.phase eq 'vapor'}">selected </c:if>>Vapor </option>
								<option value="2phase" <c:if test="${n.phase eq '2phase'}">selected </c:if>>2Phase </option>
							</select>
						</td>
						<td colspan="3">							
							<input type="radio" name="ev"  value="Bare" onclick="rev_go(this.form)"<c:if test="${n.ev eq 'Bare'}">checked </c:if>> 
							<label for="Inlet">Inlet</label>
							&nbsp;&nbsp;
							<input type="radio" name="ev" value="Buried" onclick="rev_go(this.form)" <c:if test="${n.ev eq 'Buried'}">checked </c:if>>
							<label for="Outlet">Buried</label>
						</td>
						<td colspan="8"></td>

						<!-- jstl로 readonly 지정  -->
					</tr>					
					
					<tr class="process"> <!-- 3 --> 
						<td colspan="2">Property  </td>  
						<td>Liquid</td>
						<td>Vapor</td>
						<td colspan="3">Process</td>
						<td>Type of Surface</td>
						<td colspan="3">
							<select name="stype">
								<option value="centri" <c:if test="${n.stype eq 'common'}"> selected </c:if>> Commonly used </option>					
			               		<option value="rotary" <c:if test="${n.stype eq '-'}"> selected </c:if>> - </option>		  	
							</select>
						</td>												
						<td>Air Temp </td>
						<td>F</td>
						<td style="width:90px; "><input type="number" name="temp_air" value="${n.temp_air}" > </td> <!--14 -->

					</tr>
					<tr class="process"> <!-- 4 -->
						<td>Temperature </td>
						<td>C </td>
						<td><input type="number" name="temp" value="${n.temp_liq}" > </td>								
						<td><input type="number" name="temp" value="${n.temp_vapor}" > </td>
						<td>Flow rate</td>
						<td>kg/h</td>
						<td style="width:90px; "><input type="number" name="flow" value="${n.flow}" > </td>
						<td>Emissivity</td>
						<td colspan="3"><input type="number" name="em" value="${n.em}" ></td>
						<td>Wind Velocity</td>
						<td>mph</td>
						<td><input type="number" name="wind_vel" value="${n.wind_vel}"> </td>
					</tr>
					<tr class="process"> <!-- 4 -->
						<td>Density</td>
						<td>kg/m<sup>3</sup></td>
						<td><input type="number" name="den_liq" value="${n.den_liq}" > </td>
						<td><input type="number" name="den_vapor" value="${n.den_vapor}" > </td>
						<td>OverDesign</td>
						<td>%</td>
						<td style="width:90px; "><input type="number" name="over" value="${n.over}" > </td>
						<td colspan="4">Shape & Condition </td>
						<td>Season</td>
					    <td colspan="2">
							<select style="width: 100px; font-size: 16px;" name="season" onchange="rev_go(this.form)">
								<option value="liquid" <c:if test="${n.season eq 'Spring'}">selected </c:if>>Spring</option>
								<option value="vapor" <c:if test="${n.season eq 'Summer'}">selected </c:if>>Summer </option>
								<option value="2phase" <c:if test="${n.season eq 'Autumn'}">selected </c:if>>Autumn </option>
							</select>					    
					    </td>	
					</tr>
					<tr id="process"> 
						<td>Viscosity</td>
						<td>cP</td>
						<td><input type="number" name="vis_liq" value="${n.vis_liq}" > </td>
						<td><input type="number" name="vis_vapor" value="${n.vis_vapor}" > </td>
						<td colspan="2">vapor fraction</td>
						<td><input type="number" name="vapor_fr" value="${n.vapor_fr}" <c:if test="${n.phase eq '2phase'}">readonly </c:if>> </td>
						<td colspan="4">
							<select style="width: 100px; font-size: 16px;" name="condition" onchange="rev_go(this.form)">
								<option value="liquid" <c:if test="${n.condition eq 'Spring'}">selected </c:if>>Spring</option>
								<option value="vapor" <c:if test="${n.condition eq 'Summer'}">selected </c:if>>Summer </option>
								<option value="2phase" <c:if test="${n.condition eq 'Autumn'}">selected </c:if>>Autumn </option>
							</select>							
						</td>
						<td>Burial Depth</td>
						<td>inch</td>
						<td><input type="number" name="depth" value="${n.depth}"> </td>

					</tr>
					<tr id="process"> 
						<td>Heat Capacity</td>
						<td>Btu/lb F</td>
						<td><input type="number" name="heat_liq" value="${n.heat_liq}" > </td>
						<td><input type="number" name="heat_vapor" value="${n.heat_vapor}" > </td>
						<td>&nbsp;- Flow rate (liquid)</td>
						<td>kg/h</td>
						<td><input type="number" name="flow_liq" value="${n.flow_liq}" <c:if test="${n.phase eq 'vapor'}">readonly </c:if>> </td>
						<td colspan="3">Convection Equation</td>
						<td><input type="number" name="convection" value="${n.convection}" > </td>	
						<td colspan="2">Soil Conductivity</td>
						<td rowspan="2"><input type="number" name="soil" value="${n.soil}"> </td>

					</tr>
					<tr id="process"> 
						<td colspan="2">Thermal Conductivity</td>
						<td rowspan="2"><input type="number" name="thcon_liq" value="${n.thcon_liq}" > </td>
						<td rowspan="2"><input type="number" name="thcon_vapor" value="${n.thcon_vapor}" > </td>
						<td>&nbsp;- Flow rate (vapor)</td>
						<td>kg/h</td>
						<td><input type="number" name="flow_vapor" value="${n.flow_vapor}" <c:if test="${n.phase eq 'liquid'}">readonly </c:if>> </td>
						<td colspan="4"></td>
						<td>Heated Soil Dia</td>
						<td>inch</td>
						<td><input type="number" name="heat_dia" value="${n.heat_dia}"> </td>
					</tr>
					<tr id="process"> 
						<td colspan="2">(Btu/ft h F)</td>
						<td colspan="10"></td>
					</tr>
				</tbody>
			</table>
			<table>
				<tbody>
					<tr>
						<td colspan="2">Pipe Spec.</td>
						<td>Insulation</td>
						<td>-Thickness</td>
						<td>inch</td>
						<td><input type="number" name="insul_thick" value="${n.insul_thick}" ></td>
						<td>-Conductivity</td>
						<td>Btu/lb F ft</td>
						<td><input type="number" name="insul_con" value="${n.insul_con}" ></td>
						<td></td>
					</tr>
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
							Reynold Number
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="number" name="re" value="${n.re}" disabled="disabled">
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
						<td colspan="6"></td>
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
		<table>
			<tbody>
				<tr><td colspan="8">Result</td></tr>
				<tr>
					<td>Equivalent Length</td>
					<td>m</td>
					<td><input type="number" name="eql_len" value="${n.eql_len}" ></td>
					<td></td>
					<td>Soil Thermal Coefficient</td>
					<td>Btu/lb F ft<sup>2</sup></td>
					<td><input type="number" name="soil_temp" value="${n.soil_temp}" ></td>
					<td></td>
				</tr>
				<tr>
					<td>Inside Flim Coefficient</td>
					<td>Btu/lb F ft<sup>2</sup></td>
					<td><input type="number" name="in_coeff" value="${n.in_coeff}" ></td>
					<td></td>
					<td>Ground Temperature</td>
					<td>F</td>
					<td><input type="number" name="g_temp" value="${n.g_temp}" ></td>
					<td></td>
				</tr>
				<tr>
					<td>Outside Flim Coefficient</td>
					<td>Btu/lb F ft<sup>2</sup></td>
					<td><input type="number" name="out_coeff" value="${n.out_coeff}" ></td>
					<td></td>
					<td>Outlet Temperature</td>
					<td>F</td>
					<td><input type="number" name="out_temp" value="${n.out_temp}" ></td>
					<td></td>
				</tr>
				<tr>
					<td>&nbsp;- by convection</td>
					<td>Btu/lb F ft<sup>2</sup></td>
					<td><input type="number" name="in_coeff_1" value="${n.in_coeff_1}" ></td>
					<td></td>
					<td>Surface Temperature</td>
					<td>F</td>
					<td><input type="number" name="sur_temp" value="${n.sur_temp}" ></td>
					<td></td>
				</tr>
				<tr>
					<td>&nbsp;- by convection</td>
					<td>Btu/lb F ft<sup>2</sup></td>
					<td><input type="number" name="in_coeff_2" value="${n.in_coeff_2}" ></td>
					<td></td>
					<td>Diff Temperature</td>
					<td>F</td>
					<td><input type="number" name="diff_temp" value="${n.diff_temp}" ></td>
					<td></td>
				</tr>
				
			
			</tbody>
		</table>
		</div>
		<br><br>
		</form>
		</c:forEach>

	</div>
</body>
</html>