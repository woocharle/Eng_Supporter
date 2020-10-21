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
		#savedata{position: relative; right: 20px; width: 120px; font-size:20px;}
		#delete{width: 100px; font-size:20px;}
		#phase{width:180px; font-size: 22px;}	
		
		#pheat2{position: relative; left: 50px; margin-bottom: 10px; width:1680px;}
		#pheat2 td {height: 30px; font-size: 20px; vertical-align: middle; padding: 2px;}
		#pheat2 input {width: 90px; font-size:16px;}
		#season{width: 95px; font-size:18px;}
		
		#pheat3{position: relative; left: 50px; margin-bottom: 10px; width:1600px;}	
		#pheat3 td {height: 30px;  font-size: 20px; vertical-align: middle; padding: 2px;}
		#pheat3 input {width: 90px; font-size:16px;}
		#pheat3 select {font-size:19px;}
		
		#pheat4{position: relative; left: 50px; margin-bottom: 10px; width:1600px;}	
		#pheat4 td {height: 30px;  font-size: 20px; vertical-align: middle; padding: 2px;}
		.fitting input{width: 40px; font-size: 16px;}
		.fitting2 {position:relative; left:10px;}
		
		#pheat5{position: relative; left: 50px; margin-bottom: 20px; width:1600px;}		
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
			var chk = confirm("정말 삭제할까요?")
			if(chk){
				f.action="pipeheat_del.do";
				f.submit(); 
		
			} else {
				return;
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
			<br><br>
		</form>

		<c:forEach var="n" items="${list}">	
		<c:if test="${idx eq n.idx}">
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
			<script type="text/javascript">
				$(function() {
					$("#auto").on("click", function() {
						var num = ${idx};
						$("#"+num).focus();
					});
					
					$("#auto").trigger("click");
				});

			</script>
			<div id="auto"></div>
			
		</c:if>
		<form method="post">
			<input type="hidden" name ="cal" value="${cal}">		
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
							<td></td>
							<td><c:if test="${n.idx ne '1'}"><input type="button" id="delete" value="Delete" onclick="del_go(this.form)"></c:if></td>	
							<td colspan="7"></td>
							<!-- delete 버튼은 기능 설정 쯤 개시 -->
						</tr>
						<tr> <!-- 2 -->
							<td colspan="2">Phase</td>
							<td colspan="2">
								<select name="phase${n.idx}" id="phase" onchange="rev_go(this.form)">
									<option value="liquid" <c:if test="${n.phase eq 'liquid'}">selected </c:if>>Liquid</option>
									<option value="vapor" <c:if test="${n.phase eq 'vapor'}">selected </c:if>>Vapor </option>
									<option value="2phase" <c:if test="${n.phase eq '2phase'}">selected </c:if>>2Phase </option>
								</select>
							</td>
							<td >Environment:</td>
							<td colspan="5">							
								<input type="radio" name="ev${n.idx}"  value="bare" onclick="rev_go(this.form)"<c:if test="${n.ev eq 'bare'}">checked </c:if>> 
								<label for="bare">Bare</label>
								&nbsp;&nbsp;
								<input type="radio" name="ev${n.idx}" value="buried" onclick="rev_go(this.form)" <c:if test="${n.ev eq 'buried'}">checked </c:if>>
								<label for="buried">Buried</label>
							</td>
							<td>Over Design:</td>
							<td><input type="text" name="over${n.idx}" style="width: 100px; font-size:20px;" value="${n.over}" ></td>
							<td>%</td>
						</tr>	
					</tbody>
				</table>
				
				<table id="pheat2">
					<thead>
						<tr>
							<th style="width: 10%;"></th><th style="width: 7%;"></th><th style="width: 7%;"></th><th  style="width: 7%;"></th><th style="width: 12%;"></th><th></th><th style="width: 7%;"></th>
							<th></th><th></th><th></th><th></th><th></th><th style="width: 7%;"></th><th></th>
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
								<select style="font-size:20px;" name="stype${n.idx}" onchange="rev_go(this.form)">
									<option value="common" <c:if test="${n.stype eq 'common'}"> selected </c:if>> Commonly used </option>					
				               		<option value="roofing" <c:if test="${n.stype eq 'roofing'}"> selected </c:if>> Roofing </option>		  	
				               		<option value="alumi1" <c:if test="${n.stype eq 'alumi1'}"> selected </c:if>> Aluminum </option>		  	
				               		<option value="alumi2" <c:if test="${n.stype eq 'alumi2'}"> selected </c:if>> Aluminum Paint</option>		  	
				               		<option value="oxi1" <c:if test="${n.stype eq 'oxi1'}"> selected </c:if>> Oxidized 1 </option>		  	
				               		<option value="oxi2" <c:if test="${n.stype eq 'oxi2'}"> selected </c:if>> Oxidized 2 </option>		  	
				               		<option value="white" <c:if test="${n.stype eq 'white'}"> selected </c:if>> White Painted Canvas </option>		  	
								</select>
							</td>												
							<td>Air Temp </td>
							<td style="font-size: 18px;" >F</td>
							<td style="width:90px; "><input type="text" name="temp_air${n.idx}" value="${n.temp_air}" > </td> <!--14 -->
	
						</tr>
						<tr> <!-- 4 -->
							<td>Temperature </td>
							<td style="font-size: 18px; vertical-align: middle;">&deg;C </td>
							<td style="text-align: center;"><input type="text" name="temp_liq${n.idx}" value="${n.temp_liq}" <c:if test="${n.phase eq 'vapor'}">disabled </c:if>> </td>								
							<td style="text-align: center;"><input type="text" name="temp_vapor${n.idx}" value="${n.temp_vapor}" <c:if test="${n.phase eq 'liquid'}">disabled </c:if>> </td>
							<td>Flow rate</td>
							<td style="font-size: 18px;" >kg/h</td>
							<td style="text-align: center;"><input type="text" name="flow${n.idx}" value="${n.flow}" > </td>
							<td>Emissivity</td>
							<td colspan="3"><input type="text" name="em${n.idx}" value="${n.em}" readonly="readonly" ></td>
							<td>Wind Velocity</td>
							<td style="font-size: 18px;" >mph</td>
							<td><input type="text" name="wind_vel${n.idx}" value="${n.wind_vel}"> </td>
						</tr>
						<tr> <!-- 4 -->
							<td>Density</td>
							<td style="font-size: 18px; vertical-align: middle;">kg/m<sup>3</sup></td>
							<td style="text-align: center;"><input type="text" name="den_liq${n.idx}" value="${n.den_liq}" > </td>
							<td style="text-align: center;"><input type="text" name="den_vapor${n.idx}" value="${n.den_vapor}" > </td>
							<td colspan="2">vapor fraction</td>
							<td style="text-align: center;"><input type="text" name="vapor_fr${n.idx}" value="${n.vapor_fr}" <c:if test="${n.phase ne '2phase'}">disabled </c:if>> </td>
							<td colspan="4">Shape & Condition </td>
							<td colspan="2">Season</td>
						    <td>
								<select id="season" name="season${n.idx}" onchange="rev_go(this.form)">
									<option value="liquid" <c:if test="${n.season eq 'Spring'}">selected </c:if>>Spring</option>
									<option value="vapor" <c:if test="${n.season eq 'Summer'}">selected </c:if>>Summer </option>
									<option value="2phase" <c:if test="${n.season eq 'Autumn'}">selected </c:if>>Autumn </option>
								</select>					    
						    </td>	
						</tr>
						<tr> 
							<td>Viscosity</td>
							<td style="font-size: 18px; vertical-align: middle;">cP</td>
							<td style="text-align: center;"><input type="text" name="vis_liq${n.idx}" value="${n.vis_liq}" > </td>
							<td style="text-align: center;"><input type="text" name="vis_vapor${n.idx}" value="${n.vis_vapor}" > </td>
							<td>&nbsp;- Flow rate (liquid)</td>
							<td style="font-size: 18px;">kg/h</td>
							<td style="text-align: center;"><input type="text" name="flow_liq${n.idx}" value="${n.flow_liq}" <c:if test="${n.phase eq 'vapor'}">disabled </c:if>> </td>
							<td colspan="4">
								<select style="width:410px; font-size:20px;"  name="condition${n.idx}" onchange="rev_go(this.form)">
									<option value="hcyd" <c:if test="${n.condition eq 'hcyd'}">selected </c:if>>Horizontal Cylinder</option>
									<option value="vcyd" <c:if test="${n.condition eq 'vcyd'}">selected </c:if>>Longer Vertical Cylinder </option>
									<option value="hplate1" <c:if test="${n.condition eq 'hplate1'}">selected </c:if>>Horizontal Plate (facing upward)</option>
									<option value="hplate2" <c:if test="${n.condition eq 'hplate2'}">selected </c:if>>Horizontal Plate (facing downward)</option>
									<option value="vplate" <c:if test="${n.condition eq 'vplate'}">selected </c:if>>Vertical Plate </option>
								</select>							
							</td>
							<td>Burial Depth</td>
							<td style="font-size: 18px;" >inch</td>
							<td><input type="text" name="depth${n.idx}" value="${n.depth}"  <c:if test="${n.ev eq 'bare'}"> disabled="disabled" </c:if>> </td>
	
						</tr>
						<tr> 
							<td>Heat Capacity</td>
							<td style="font-size: 18px; vertical-align: middle;">kcal/lb F</td>
							<td style="text-align: center;"><input type="text" name="heat_liq${n.idx}" value="${n.heat_liq}" > </td>
							<td style="text-align: center;"><input type="text" name="heat_vapor${n.idx}" value="${n.heat_vapor}" <c:if test="${n.phase eq 'liquid'}">disabled </c:if>> </td>
							<td>&nbsp;- Flow rate (vapor)</td>
							<td style="font-size: 18px;">kg/h</td>
							<td style="text-align: center;"><input type="text" name="flow_vapor${n.idx}" value="${n.flow_vapor}" <c:if test="${n.phase eq 'liquid'}">disabled </c:if>> </td>
							<td colspan="3">Convection Equation</td>
							<td><input type="text" name="convection${n.idx}" value="${n.convection}" readonly="readonly"> </td>	
							<td>Soil Conductivity</td>
							<td style="font-size: 18px;" >kcal/m h &deg;C</td>
							<td><input type="text" name="soil${n.idx}" value="${n.soil}"<c:if test="${n.ev eq 'bare'}"> disabled="disabled" </c:if>> </td>
	
						</tr>
						<tr> 
							<td>Thermal Conductivity</td>
							<td style="font-size: 18px; vertical-align: middle;">kcal/m h &deg;C</td>
							<td style="text-align: center;"><input type="text" name="thcon_liq${n.idx}" value="${n.thcon_liq}" > </td>
							<td style="text-align: center;"><input type="text" name="thcon_vapor${n.idx}" value="${n.thcon_vapor}" > </td>
							<td colspan="7"></td>
							<td>Heated Soil Dia</td>
							<td style="font-size: 18px;" >inch</td>
							<td><input type="text" name="heat_dia${n.idx}" value="${n.heat_dia}" <c:if test="${n.ev eq 'bare'}"> disabled="disabled" </c:if>> </td>
						</tr>

					</tbody>
				</table>
				<table id="pheat3">
					<thead>
						<tr>
							<th style="width: 12%;"></th><th style="width:6%;"></th><th style="width:8%;"></th><th style="width:12%;"></th><th style="width: 5%;"></th><th></th><th></th>
							<th></th><th></th><th></th><th></th><th></th>
						</tr>
					</thead>				
					<tbody>
						<tr>
							<td colspan="3" style="height: 50px;">Pipe Spec.</td>
							<td>Complex Factor</td>
							<td colspan="3">
								<select  style="width: 280px; font-size: 18px;" name="cfactor${n.idx}" onchange="rev_go(this.form)">
									<option value="fitting" <c:if test="${n.cfactor eq 'fitting'}">selected </c:if>>Fitting (직접입력)</option>	
									<option value="utility" <c:if test="${n.cfactor eq 'utility'}">selected </c:if>>Utility Supply Lines (1)</option>
									<option value="long" <c:if test="${n.cfactor eq 'long'}">selected </c:if>>Long Straight Piping Runs (1) </option>
									<option value="norpipe" <c:if test="${n.cfactor eq 'norpipe'}">selected </c:if>>Normal Piping (1.5)</option>
									<option value="manifold" <c:if test="${n.cfactor eq 'manifold'}">selected </c:if>>Normal Manifold-type Piping (2)</option>
									<option value="complex" <c:if test="${n.cfactor eq 'complex'}">selected </c:if>>Very Complex Manifolds (3)</option>
								</select>
							</td>
							<td>Reynold no.</td>
							<td><input type="text" name="re${n.idx}" value="${n.re}" readonly="readonly"></td>
							<td></td>
							<td>Equivalent Length</td>
							<td>m</td>
							<td><input type="text" name="eql_len${n.idx}" value="${n.eql_len}" readonly="readonly"></td>						
						</tr>
						<tr > 
							<td>Line Size</td>
							<td>inch</td>
							<td>
								<select name="dia${n.idx}" onchange="rev_go(this.form)" >
									<c:forEach var="k" items="${n.dlist}">
										<option value="${k}" <c:if test="${k eq n.dia}">selected </c:if> >${k}</option>
									</c:forEach>
								</select>
							</td>
							<td>Inside of Dia</td>
							<td>inch</td>
							<td><input type="text" name="din${n.idx}" value="${n.din}" readonly="readonly"></td>													
							<td colspan="2">Pipe Material</td>
							<td><input type="text" name="insul_thick${n.idx}" value="${n.pipe_mtl}" ></td>
							<td colspan="2">Insulation Material</td>
							<td><input type="text" name="insul_thick${n.idx}" value="${n.insul_mtl}" ></td>
						</tr>
						<tr>
							<td colspan="2">schedule or Class</td>
							<td>
								<select name="sch${n.idx}" onchange="rev_go(this.form)" >
									<c:forEach var="k" items="${n.slist}">
										<option value="${k}" <c:if test="${k eq n.sch}">selected </c:if>>${k}</option>
									</c:forEach>
								</select>
							</td>
							<td>Outside of Dia</td>
							<td>inch</td>
							<td><input type="text" name="dout${n.idx}" value="${n.dout}" readonly="readonly"></td>		
							<td>&nbsp;-Thickness</td>
							<td>inch</td>
							<td><input type="text" name="pipe_thick${n.idx}" value="${n.pipe_thick}" readonly="readonly"></td>
							<td>&nbsp;-Thickness</td>
							<td>inch</td>
							<td><input type="text" name="insul_thick${n.idx}" value="${n.insul_thick}" ></td>
		
						</tr>
						<tr >
							<td>Wall Roughness</td>
							<td>m</td>
							<td><input type="text" name="wall${n.idx}" value="${n.wall}"></td>	
							<td>Length of Pipe</td>
							<td>m</td>
							<td><input type="text" name="pipelen${n.idx}" value="${n.pipelen}"></td>		
							<td>&nbsp;-Conductivity</td>
							<td>kcal/m h &deg;C</td>
							<td><input type="text" name="pipe_con${n.idx}" value="${n.pipe_con}" ></td>			
							<td>&nbsp;-Conductivity</td>
							<td>kcal/m h &deg;C</td>
							<td><input type="text" name="insul_con${n.idx}" value="${n.insul_con}" ></td>			
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
							<td><input type="text" name="gtvalve${n.idx}" value="${n.gtvalve}"></td>
							<td class="fitting2">Ball Valve</td>
							<td><input type="text" name="bvalve${n.idx}" value="${n.bvalve}" ></td>
						</tr>
						<tr class="fitting">
							<td class="fitting2">Std(R/D=1)</td>
							<td><input type="text" name="elbow90_1${n.idx}" value="${n.elbow90_1}" ></td>
							<td class="fitting2">Long(R/D=1.5)</td>
							<td><input type="text" name="elbow90_2${n.idx}" value="${n.elbow90_2}" ></td>
							<td class="fitting2">Std(R/D=1)</td>
							<td><input type="text" name="elbow45_1${n.idx}" value="${n.elbow45_1}" ></td>
							<td class="fitting2">Long(R/D=1.5)</td>
							<td><input type="text" name="elbow45_2${n.idx}" value="${n.elbow45_2}" ></td>
							<td class="fitting2">- Threaded (R/D=1)</td>
							<td><input type="text" name="tee_1${n.idx}" value="${n.tee_1}" ></td>
							<td class="fitting2">Globe Valve</td>
							<td><input type="text" name="gbvalve${n.idx}" value="${n.gbvalve}" ></td>
							<td class="fitting2">Diaphragm</td>
							<td><input type="text" name="dvalve${n.idx}" value="${n.dvalve}"></td>							
							
						</tr>
						
						<tr class="fitting">
							<td colspan="4"> 90&deg; Elbow Flanged or Welded</td>
							<td colspan="4"> 45&deg; Elbow Mitered</td>
							<td class="fitting2">- Threaded (R/D=1.5)</td>
							<td><input type="text" name="tee_2" value="${n.tee_2}" ></td>
							<td class="fitting2">Angle Valve</td>
							<td colspan="3">
								<span style="position:relative; left:10px;">- 45&deg;: <input type="text" name="avalve_1${n.idx}" value="${n.avalve_1}" > </span>
								<span style="position:relative; left:40px;">- 90&deg;: <input type="text" name="avalve_2${n.idx}" value="${n.avalve_2}" > </span>
							</td>
						</tr>
						
						<tr class="fitting">
							<td class="fitting2">Std(R/D=1)</td>
							<td><input type="text" name="elbow90_3${n.idx}" value="${n.elbow90_3}" ></td>
							<td class="fitting2">Long(R/D=2)</td>
							<td><input type="text" name="elbow90_4${n.idx}" value="${n.elbow90_4}" ></td>						
							<td class="fitting2">1 weld 45&deg;</td>
							<td><input type="text" name="elbow45_3${n.idx}" value="${n.elbow45_3}" ></td>
							<td class="fitting2">2 weld 22.5&deg;</td>
							<td><input type="text" name="elbow45_4${n.idx}" value="${n.elbow45_4}" ></td>
							<td class="fitting2">- Flanged (R/D=1)</td>
							<td><input type="text" name="tee_3" value="${n.tee_3}"></td>
							<td class="fitting2" >check Valve</td>
							<td colspan="3">
								<span style="position:relative; left:10px;">- swing&deg;: <input type="text" name="cvalve_1" value="${n.cvalve_1}" > </span>
								<span style="position:relative; left:10px;">- left&deg;: <input type="text" name="cvalve_2" value="${n.cvalve_2}" > </span>							
							</td>
						</tr>
						<tr class="fitting">
							<td class="fitting2">Long(R/D=4)</td>
							<td><input type="text" name="elbow90_5${n.idx}" value="${n.elbow90_5}" ></td>
							<td class="fitting2">Long(R/D=6)</td>
							<td><input type="text" name="elbow90_6${n.idx}" value="${n.elbow90_6}" ></td>	
							<td colspan="4"> </td>						
							<td class="fitting2">- Stub in branch</td>
							<td><input type="text" name="tee_4${n.idx}" value="${n.tee_4}"></td>	
							<td class="fitting2" colspan="4">Plug Valve </td>
						</tr>
						<tr class="fitting">
							<td colspan="4"> 90&deg; Elbow Mitered</td>
							<td colspan="4"> 180&deg; Bend </td>	
							<td colspan="2">Tee (Run-Through)</td>
							<td class="fitting2">- branch flow</td>
							<td><span style="position:relative; left:10px;"><input type="text" name="pvalve_1${n.idx}" value="${n.pvalve_1}" ></span></td>
							<td class="fitting2">- three way</td>
							<td><input type="text" name="pvalve_3${n.idx}" value="${n.pvalve_3}" ></td>							
						</tr>
						<tr class="fitting">
							<td class="fitting2">1 weld 90&deg; </td>
							<td><input type="text" name="elbow90_7${n.idx}" value="${n.elbow90_7}" ></td>
							<td colspan="2"></td>
							<td colspan="3" class="fitting2">- Threaded, closed-return (R/D=1)</td>
							<td><input type="text" name="bend_1${n.idx}" value="${n.bend_1}" ></td>														
							<td class="fitting2">- Threaded (R/D=1)</td>
							<td><input type="text" name="tee_5${n.idx}" value="${n.tee_5}" ></td>	
							<td class="fitting2" colspan="2">- Straight though </td>	
							<td colspan="2"><input type="text" name="pvalve_2${n.idx}" value="${n.pvalve_2}"></td>
						</tr>
						<tr class="fitting">
							<td class="fitting2">2 weld 45&deg; </td>
							<td><input type="text" name="elbow90_8${n.idx}" value="${n.elbow90_8}" ></td>							
							<td colspan="2"></td>
							<td colspan="3" class="fitting2">- Flanged (R/D=1)</td>
							<td><input type="text" name="bend_2${n.idx}" value="${n.bend_2}"></td>
							<td class="fitting2">- Flanged (R/D=1)</td>
							<td><input type="text" name="tee_6${n.idx}" value="${tee_6}" ></td>
							<td class="fitting2">Reducer: </td>
							<td colspan="3">
								<span style="position:relative; right:10px;">diameter(inch) <input type="text" name="redd${n.idx}" value="${n.redd}" > </span>
								<span style="position:relative; left:5px;"> theta <input type="text" name="redth${n.idx}" value="${n.redth}" > </span>							
							</td>														
						</tr>
						<tr class="fitting">
							<td class="fitting2">3 weld 30&deg; </td>
							<td><input type="text" name="elbow90_9${n.idx}" value="${n.elbow90_9}" ></td>							
							<td colspan="2"></td>
							<td colspan="3" class="fitting2">- All types (R/D=1.5)</td>
							<td><input type="text" name="bend_3${n.idx}" value="${n.bend_3}"></td>							
							<td><span style="position:relative; left:10px;">- Stub in branch</span></td>
							<td><span style="float: left;"><input type="text" name="tee_7${n.idx}" value="${n.tee_7}"></span></td>	
							<td class="fitting2">Expander: </td>
							<td colspan="3">
								<span style="position:relative; right:10px;">diameter(inch) <input type="text" name="expd${n.idx}" value="${n.expd}" > </span>
								<span style="position:relative; left:5px;"> theta <input type="text" name="expth${n.idx}" value="${n.expth}" > </span>							
							</td>							
						</tr>
					</tbody>
				</table>
				</c:if>	
			
				<table id="pheat5">
					<tbody>
						<tr>
							<td colspan="3">Common</td>
							<td colspan="3">Bare</td>
							<td colspan="3">Buried</td>
						</tr>
						<tr>
							<td>Inside Flim Coefficient</td>
							<td>kcal/m<sup>2</sup> h &deg;C</td>
							<td><input type="text" name="in_coeff${n.idx}" value="${n.in_coeff}" readonly="readonly"></td>
							<td>Outside Flim Coefficient</td>
							<td>kcal/m<sup>2</sup> h &deg;C</td>
							<td><input type="text" name="out_coeff${n.idx}" value="${n.out_coeff}" 
								<c:if test="${n.ev eq 'bare'}"> readonly="readonly" </c:if>
								<c:if test="${n.ev eq 'buried'}"> disabled="disabled" </c:if>>
							</td>
							<td>Soil Coefficient</td>
							<td>kcal/m<sup>2</sup> h &deg;C</td>
							<td><input type="text" name="soil_coeff${n.idx}" value="${n.soil_coeff}" 
								<c:if test="${n.ev eq 'bare'}">disabled="disabled" </c:if>
								<c:if test="${n.ev eq 'buried'}">readonly="readonly" </c:if>>
							</td>

						</tr>
						<tr>
							<td>Surface Temperature</td>
							<td>&deg;C</td>
							<td><input type="text" name="sur_temp${n.idx}" value="${n.sur_temp}" readonly="readonly"></td>
							<td>&nbsp;- by convection</td>
							<td>kcal/m<sup>2</sup> h &deg;C</td>
							<td><input type="text" name="in_coeff_1${n.idx}" value="${n.in_coeff_1}" 
								<c:if test="${n.ev eq 'bare'}"> readonly="readonly" </c:if>
								<c:if test="${n.ev eq 'buried'}"> disabled="disabled" </c:if>>
							</td>
							<td>Diff Temperature</td>
							<td>&deg;C</td>
							<td><input type="text" name="diff_temp${n.idx}" value="${n.diff_temp}" 
								<c:if test="${n.ev eq 'bare'}">disabled="disabled" </c:if>
								<c:if test="${n.ev eq 'buried'}">readonly="readonly" </c:if>>
							</td>

						</tr>
						<tr>
							<td>Outlet Temperature</td>
							<td>&deg;C</td>
							<td><input type="text" name="out_temp${n.idx}" value="${n.out_temp}" readonly="readonly"></td>
							<td>&nbsp;- by radiation</td>
							<td>kcal/m<sup>2</sup> h &deg;C</td>
							<td><input type="text" name="in_coeff_2${n.idx}" value="${n.in_coeff_2}" 
								<c:if test="${n.ev eq 'bare'}"> readonly="readonly" </c:if>
								<c:if test="${n.ev eq 'buried'}"> disabled="disabled" </c:if>>
							</td>
							<td>Ground Temperature</td>
							<td>F</td>
							<td><input type="text" name="g_temp${n.idx}" value="${n.g_temp}"  
								<c:if test="${n.ev eq 'bare'}">disabled="disabled" </c:if>
								<c:if test="${n.ev eq 'buried'}">readonly="readonly" </c:if>>
							</td>
						</tr>
						<tr><td colspan="9">Result</td></tr>
						<tr>
							<td>Overall Coefficient</td>
							<td>kcal/m<sup>2</sup> h &deg;C</td>
							<td><input type="text" name="over_coeff${n.idx}" value="${n.over_coeff}" readonly="readonly"></td>						
							<td>Total heat/loss gain</td>
							<td>kcal/h</td>
							<td><input type="text" name="heattrans${n.idx}" value="${n.heattrans}" readonly="readonly"></td>						
							<td colspan="3"></td>
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