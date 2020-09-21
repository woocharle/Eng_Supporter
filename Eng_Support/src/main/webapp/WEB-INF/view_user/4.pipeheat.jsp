<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Engineering Support</title>
	<style type="text/css">
		.pipeheat{width: 75%; height: 1400px; position: relative; left: 400px; bottom: 1430px; overflow: auto;}
		.pipeheat h3{position: relative; left: 50px; font-size: 30px; margin-bottom: 40px;}

		#add_chart1{position: relative; left: 950px; font-size: 20px; height: 30px; width: 100px;}
		#pheat{position: relative; left: 50px; overflow: scroll; width: 1000px; height: 450px; border: 1px solid black;}
		
		#pheat1{position: relative; left: 50px; margin-top: 40px; margin-bottom: 10px; width:1150px;}
		#pheat td {height: 40px;  font-size: 24px; vertical-align: middle; padding: 3px;}
		#lineno {width:200px; font-size:20px;}
		#calculation{width: 100px; font-size:20px;}
		#delete{width: 100px; font-size:20px;}
		#phase{width:180px; font-size: 22px;}	
		
		#pheat2{position: relative; left: 50px; margin-bottom: 10px; width:1600px;}
		#pheat2 td {height: 30px; font-size: 20px; vertical-align: middle; padding: 2px;}
		#pheat2 input {width: 90px; font-size:16px;}
		#season{width: 95px; font-size:18px;}
		
		#pheat3{position: relative; left: 50px; margin-bottom: 10px; width:1100px;}	
		#pheat3 td {height: 30px;  font-size: 20px; vertical-align: middle; padding: 2px;}
		#pheat3 input {width: 90px; font-size:16px;}
		#pheat3 select {font-size:19px;}
		
		#pheat4{position: relative; left: 50px; margin-bottom: 10px; width:1600px;}	
		#pheat4 td {height: 30px;  font-size: 20px; vertical-align: middle; padding: 2px;}
		.fitting input{width: 40px; font-size: 16px;}
		.fitting2 {position:relative; left:10px;}
		
		#pheat5{position: relative; left: 50px; margin-bottom: 10px; width:1000px;}		
		#pheat5 td {height: 30px;  font-size: 22px; vertical-align: middle; padding: 3px;}
		#pheat5 input{width: 100px;font-size: 20px;}
		
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
	<div class="pipeheat">
		<h3> Pipe Heat Transfer </h3>
		
		<form method="post">
			<input id="add_chart1" type="button" value="Add" onclick="add_go(this.form)"> 
			<input type="hidden" name ="cal" value="${cal}">

			<br><br>
			<c:forEach var="n" items="${list}">
			<div id="pheat">

				<table id="pheat1">
					<thead>
						<tr>
							<th style="width: 15%;"></th><th style="width: 5%;"></th><th style="width: 8%;"></th><th  style="width: 8%;"></th><th></th>
							<th></th><th></th><th></th><th></th><th></th><th></th><th></th>
						</tr>
					</thead>
					<tbody>
						<tr> <!--1  -->
							<td colspan="2">Line.No</td>
							<td colspan="2">
								<input type="text" id="lineno" name="lineno" value="${n.lineno}">
								<input type="hidden" name="idx" value="${n.idx}"/>
							</td>
							<td><input type="button" id="calculation" value="Calculate" onclick="cal_go(this.form)"></td>
							<td><c:if test="${n.idx ne '1'}"><input type="button" value="Delete" onclick="del_go(this.form)"></c:if></td>	
							<td colspan="8"></td>
							<!-- delete 버튼은 기능 설정 쯤 개시 -->
						</tr>
						<tr> <!-- 2 -->
							<td colspan="2">Phase</td>
							<td colspan="2">
								<select name="phase" id="phase" onchange="rev_go(this.form)">
									<option value="liquid" <c:if test="${n.phase eq 'liquid'}">selected </c:if>>Liquid</option>
									<option value="vapor" <c:if test="${n.phase eq 'vapor'}">selected </c:if>>Vapor </option>
									<option value="2phase" <c:if test="${n.phase eq '2phase'}">selected </c:if>>2Phase </option>
								</select>
							</td>
							<td >Environment:</td>
							<td colspan="5">							
								<input type="radio" name="ev"  value="Bare" onclick="rev_go(this.form)"<c:if test="${n.ev eq 'Bare'}">checked </c:if>> 
								<label for="Bare">Bare</label>
								&nbsp;&nbsp;
								<input type="radio" name="ev" value="Buried" onclick="rev_go(this.form)" <c:if test="${n.ev eq 'Buried'}">checked </c:if>>
								<label for="Buried">Buried</label>
							</td>
							<td>Over Design:</td>
							<td><input type="number" name="over" style="width: 100px; font-size:20px;" value="${n.over}" ></td>
							<td>%</td>
						</tr>	
					</tbody>
				</table>
				
				<table id="pheat2">
					<thead>
						<tr>
							<th style="width: 10%;"></th><th style="width: 6%;"></th><th style="width: 7%;"></th><th  style="width: 7%;"></th><th style="width: 12%;"></th><th></th><th style="width: 7%;"></th>
							<th></th><th></th><th></th><th></th><th></th><th></th><th></th>
						</tr>
					</thead>
					<tbody>
						<tr style="height: 40px; font-style: bold;"> <!-- 3 --> 
							<td colspan="2" >Property  </td>  
							<td style="text-align: center;">Liquid</td>
							<td style="text-align: center;">Vapor</td>
							<td colspan="3">Process</td>
							<td >Type of Surface</td>
							<td colspan="3">
								<select style="font-size:20px;" name="stype">
									<option value="centri" <c:if test="${n.stype eq 'common'}"> selected </c:if>> Commonly used </option>					
				               		<option value="rotary" <c:if test="${n.stype eq '-'}"> selected </c:if>> - </option>		  	
								</select>
							</td>												
							<td>Air Temp </td>
							<td style="font-size: 18px;" >F</td>
							<td style="width:90px; "><input type="number" name="temp_air" value="${n.temp_air}" > </td> <!--14 -->
	
						</tr>
						<tr> <!-- 4 -->
							<td>Temperature </td>
							<td style="font-size: 18px; vertical-align: middle;">&deg;C </td>
							<td style="text-align: center;"><input type="number" name="temp" value="${n.temp_liq}" > </td>								
							<td style="text-align: center;"><input type="number" name="temp" value="${n.temp_vapor}" > </td>
							<td>Flow rate</td>
							<td style="font-size: 18px;" >kg/h</td>
							<td style="text-align: center;"><input type="number" name="flow" value="${n.flow}" > </td>
							<td>Emissivity</td>
							<td colspan="3"><input type="number" name="em" value="${n.em}" ></td>
							<td>Wind Velocity</td>
							<td style="font-size: 18px;" >mph</td>
							<td><input type="number" name="wind_vel" value="${n.wind_vel}"> </td>
						</tr>
						<tr> <!-- 4 -->
							<td>Density</td>
							<td style="font-size: 18px; vertical-align: middle;">kg/m<sup>3</sup></td>
							<td style="text-align: center;"><input type="number" name="den_liq" value="${n.den_liq}" > </td>
							<td style="text-align: center;"><input type="number" name="den_vapor" value="${n.den_vapor}" > </td>
							<td colspan="2">vapor fraction</td>
							<td style="text-align: center;"><input type="number" name="vapor_fr" value="${n.vapor_fr}" <c:if test="${n.phase eq '2phase'}">readonly </c:if>> </td>
							<td colspan="4">Shape & Condition </td>
							<td colspan="2">Season</td>
						    <td>
								<select id="season" name="season" onchange="rev_go(this.form)">
									<option value="liquid" <c:if test="${n.season eq 'Spring'}">selected </c:if>>Spring</option>
									<option value="vapor" <c:if test="${n.season eq 'Summer'}">selected </c:if>>Summer </option>
									<option value="2phase" <c:if test="${n.season eq 'Autumn'}">selected </c:if>>Autumn </option>
								</select>					    
						    </td>	
						</tr>
						<tr> 
							<td>Viscosity</td>
							<td style="font-size: 18px; vertical-align: middle;">cP</td>
							<td style="text-align: center;"><input type="number" name="vis_liq" value="${n.vis_liq}" > </td>
							<td style="text-align: center;"><input type="number" name="vis_vapor" value="${n.vis_vapor}" > </td>
							<td>&nbsp;- Flow rate (liquid)</td>
							<td style="font-size: 18px;">kg/h</td>
							<td style="text-align: center;"><input type="number" name="flow_liq" value="${n.flow_liq}" <c:if test="${n.phase eq 'vapor'}">readonly </c:if>> </td>
							<td colspan="4">
								<select style="width:320px; font-size:20px;"  name="condition" onchange="rev_go(this.form)">
									<option value="liquid" <c:if test="${n.condition eq 'Spring'}">selected </c:if>>Spring</option>
									<option value="vapor" <c:if test="${n.condition eq 'Summer'}">selected </c:if>>Summer </option>
									<option value="2phase" <c:if test="${n.condition eq 'Autumn'}">selected </c:if>>Autumn </option>
								</select>							
							</td>
							<td>Burial Depth</td>
							<td style="font-size: 18px;" >inch</td>
							<td><input type="number" name="depth" value="${n.depth}"> </td>
	
						</tr>
						<tr> 
							<td>Heat Capacity</td>
							<td style="font-size: 18px; vertical-align: middle;">Btu/lb F</td>
							<td style="text-align: center;"><input type="number" name="heat_liq" value="${n.heat_liq}" > </td>
							<td style="text-align: center;"><input type="number" name="heat_vapor" value="${n.heat_vapor}" > </td>
							<td>&nbsp;- Flow rate (vapor)</td>
							<td style="font-size: 18px;">kg/h</td>
							<td style="text-align: center;"><input type="number" name="flow_vapor" value="${n.flow_vapor}" <c:if test="${n.phase eq 'liquid'}">readonly </c:if>> </td>
							<td colspan="3">Convection Equation</td>
							<td><input type="number" name="convection" value="${n.convection}" > </td>	
							<td>Soil Conductivity</td>
							<td style="font-size: 18px;" >Btu/lb F ft</td>
							<td><input type="number" name="soil" value="${n.soil}"> </td>
	
						</tr>
						<tr> 
							<td>Thermal Conductivity</td>
							<td style="font-size: 18px; vertical-align: middle;">Btu/lb F ft</td>
							<td style="text-align: center;"><input type="number" name="thcon_liq" value="${n.thcon_liq}" > </td>
							<td style="text-align: center;"><input type="number" name="thcon_vapor" value="${n.thcon_vapor}" > </td>
							<td colspan="7"></td>
							<td>Heated Soil Dia</td>
							<td style="font-size: 18px;" >inch</td>
							<td><input type="number" name="heat_dia" value="${n.heat_dia}"> </td>
						</tr>

					</tbody>
				</table>
				<table id="pheat3">
					<thead>
						<tr>
							<th style="width: 15%;"></th><th style="width:6%;"></th><th style="width:12%;"></th><th style="width:16%;"></th><th style="width: 5%;"></th><th></th><th></th>
							<th></th><th></th>
						</tr>
					</thead>				
					<tbody>
						<tr>
							<td colspan="3">Pipe Spec.</td>
							<td>Complex Factor</td>
							<td colspan="3">
								<select  style="width: 280px; font-size: 18px;" name="cfactor" onchange="rev_go(this.form)">
									<option value="fitting" <c:if test="${n.cfactor eq 'fitting'}">selected </c:if>>Fitting (직접입력)</option>	
									<option value="utility" <c:if test="${n.cfactor eq 'utility'}">selected </c:if>>Utility Supply Lines (1)</option>
									<option value="long" <c:if test="${n.cfactor eq 'long'}">selected </c:if>>Long Straight Piping Runs (1) </option>
									<option value="norpipe" <c:if test="${n.cfactor eq 'norpipe'}">selected </c:if>>Normal Piping (1.5)</option>
									<option value="manifold" <c:if test="${n.cfactor eq 'manifold'}">selected </c:if>>Normal Manifold-type Piping (2)</option>
									<option value="complex" <c:if test="${n.cfactor eq 'complex'}">selected </c:if>>Very Complex Manifolds (3)</option>
								</select>
							</td>
							<td>Reynold no.</td>
							<td><input type="number" name="re" value="${n.re}" disabled="disabled"></td>
						</tr>
						<tr > 
							<td>Wall Roughness</td>
							<td>m</td>
							<td><input type="number" name="wall" value="${n.wall}"></td>	
							<td>Inside of Dia</td>
							<td>m</td>
							<td><input type="number" name="din" value="${n.din}" disabled="disabled"></td>
							<td colspan="3">Insulation</td>
							
						</tr>
						<tr >
							<td>Line Size</td>
							<td>inch</td>
							<td>
								<select name="dout" onchange="rev_go(this.form)" >
									<c:forEach var="k" items="${n.dlist}">
										<option value="${k}" <c:if test="${k eq n.dout}">selected </c:if> >${k}</option>
									</c:forEach>
								</select>
							</td>
							<td>Outside of Dia</td>
							<td>m</td>
							<td><input type="number" name="din" value="${n.din}" disabled="disabled"></td>
							<td>&nbsp;-Thickness</td>
							<td>inch</td>
							<td><input type="number" name="insul_thick" value="${n.insul_thick}" ></td>
		
						</tr>
						<tr >
							<td colspan="2">schedule or Class</td>
							<td>
								<select name="sch" onchange="rev_go(this.form)" >
									<c:forEach var="k" items="${n.slist}">
										<option value="${k}" <c:if test="${k eq n.sch}">selected </c:if>>${k}</option>
									</c:forEach>
								</select>
							</td>
							<td>Length of Pipe</td>
							<td>m</td>
							<td><input type="number" name="pipelen" value="${n.pipelen}"></td>						
							<td>&nbsp;-Conductivity</td>
							<td>Btu/lb F ft</td>
							<td><input type="number" name="insul_con" value="${n.insul_con}" ></td>			
						</tr>
					</tbody>
				</table>
				
				<c:if test="${n.cfactor eq 'fitting'}">
				<table id="pheat4">
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
			
				<table id="pheat5">
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