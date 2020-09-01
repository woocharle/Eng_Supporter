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
		
		.process input{width: 80px;}
		.fitting input{width: 40px;}
		#dp input{width: 80px;}
		
	</style>
	<script type="text/javascript">
		function add_go(f) {
			f.action="lineadd.do";
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
			<input type="hidden" name = "idx" value="${hvo.idx}">
			<br><br>
			
			<c:forEach var="i" begin="1" end="${num}">
			<div id="lhyd">
				<table style="position: relative; left: 30px; margin-top: 20px; width: 1500px;">
					<tbody>
						<tr> <!--1  -->
							<td style="width: 165px;">Line.No</td>
							<td colspan="2">
								<input type="text" name="lineno" style="width: 150px">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" value="Calculate" style="width:80px;">
							</td>
							<td><input type="button" value="Delete" style="width:80px;"></td>
							<td colspan="6"></td>
							<!-- delete 버튼은 기능 설정 쯤 개시 -->
						</tr>
						<tr style="font-size: 20px;"> <!-- 2 -->
							<td>Process</td>
							<td>Phase</td>
							<td style="width:180px;">
								<select style="width: 100px; font-size: 16px;">
									<option>Liquid</option>
									<option>Vapor </option>
								</select>
							</td>
							<td colspan="3">
								Press &nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" id="Inlet"name="press" value="Inlet" onclick=""> 
								<label for="Inlet">Inlet</label>
								&nbsp;&nbsp;
								<input type="radio" id="Outlet" name="press" value="Outlet" onclick="">
								<label for="Outlet">Outlet</label>
							</td>
							<td colspan="3"></td>

							<!-- jstl로 readonly 지정  -->
						</tr>
						<tr class="process"> <!-- 3 -->
							<td>Flow rate (kg/hr)  </td>
							<td><input type="number" name="flow" onchange="#"> </td>								
							<td>Inlet Press (kg/cm<sup>2</sup>G)</td>
							<td><input type="number" name="pin"> </td>
							<td>Temperature (C)</td>
							<td><input type="number" name="temp"> </td>
							<td>Viscosity (cP)</td>
							<td><input type="number" name="vis"> </td>
							<td>Compress fact</td>
							<td><input type="number" name="compfact"> </td>								


						</tr>
						<tr class="process"> <!-- 4 -->
							<td>Over Design (%)</td>
							<td><input type="number" name="over"> </td>
							<td>Outlet Press (kg/cm<sup>2</sup>G)</td>
							<td><input type="number" name="pout"> </td>
							<td>Density (kg/m<sup>3</sup>)</td>
							<td><input type="number" name="den"> </td>
							<td>Molecular</td>
							<td><input type="number" name="mol"> </td>
							<td>Cp/Cv</td>
						    <td><input type="number" name="cpcv"> </td>	
					
	
						</tr>
						<tr id="dp"> 
							<td>Press drop (kg/cm<sup>2</sup>G)</td>
							<td>Total: </td>
							<td><input type="number" name="tdp" value="#" disabled="disabled"></td>
							<td colspan="7">	
								Friction: &nbsp;&nbsp;&nbsp;&nbsp;
								<input type="number" name="fdp" value="#" disabled="disabled">
								&nbsp;&nbsp;&nbsp;&nbsp;
								Gravity: &nbsp;&nbsp;&nbsp;&nbsp;
								<input type="number" name="gdp" value="#" disabled="disabled">
								&nbsp;&nbsp;&nbsp;&nbsp;
								press/100m: &nbsp;&nbsp;&nbsp;
								<input type="number" name="dplenth" value="#" disabled="disabled"> 
							</td>

						</tr>
						<tr><td colspan="10">Pipe Spec.</td></tr>
						<tr class="process"> 
							<td>Complex Factor</td>
							<td colspan="2">
								<select name="cfactor" onchange="#" style="width: 250px; font-size: 16px;">
									<option value="fitting">Fitting (직접입력)</option>	
									<option value="utility">Utility Supply Lines (1)</option>
									<option value="long">Long Straight Piping Runs (1) </option>
									<option value="norpipe">Normal Piping (1.5)</option>
									<option value="manifold">Normal Manifold-type Piping (2)</option>
									<option value="complex">Very Complex Manifolds (3)</option>
								</select>
							</td>
							<td colspan="2">
								Equivalent Length
								&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="number" name="id" value="#" disabled="disabled">
							</td>
							<td colspan="4"></td>
						</tr>
						<tr class="process">
							<td>Line Size (inch)</td>
							<td>
								<select name="linesize" onchange="#"  style="width: 100px; font-size: 16px;">
									<option value="">Liquid</option>
									<option value="">Vapor</option>
								</select>
							</td>
							<td>Inside of Dia (m) </td>
							<td><input type="number" name="id" value="#" disabled="disabled"></td>
							<td>Wall Roughness</td>
							<td><input type="number" name="wall"></td>			
							<td colspan="4"></td>
						</tr>
						<tr class="process">
							<td>schedule or Class</td>
							<td>
								<select name="sch" onchange="#"  style="width: 100px; font-size: 16px;">
									<option>Liquid</option>
									<option>Vapor</option>
									<option>2 Phase (1)</option>
									<option>2 Phase (2)</option>
									<option>2 Phase (3)</option>
								</select>
							</td>
							<td>Length of Pipe (m)</td>
							<td><input type="number" name="pipelen"></td>	
							<td>Elevation Change</td>					
							<td><input type="number" name="Ele"></td>						
							<td><input type="number" name="Eqlenth" value="#" disabled="disabled"></td>						
							<td colspan="3"></td>
						</tr>
						<tr>
							<td colspan="10">Fitting</td>
						</tr>
						<tr class="fitting">
							<td colspan="2"> 90 Elbow Threaded</td>
							<td colspan="2"> 45 Elbow Threaded</td>
							<td colspan="2">Tee(Through-branch as Elbow)</td>
							<td>Gate Valve</td>
							<td><span style="float: left;"><input type="number" name="gvalve_1"></span></td>
							<td>Ball Valve</td>
							<td><span style="float: left;"><input type="number" name="bvalve"></span></td>
						</tr>
						<tr class="fitting">
							<td colspan="2">
								Std(R/D=1)&nbsp;<input type="number" name="elbow90_1" value="">
								<span style="position:relative; left:10px;">Long(R/D=1.5)&nbsp;<input type="number" name="elbow90_2" value=""></span>  
							</td>
							<td colspan="2">
								Std(R/D=1)&nbsp;<input type="number" name="elbow45_1" value="">
								<span style="position:relative; left:10px;">Long(R/D=1.5)&nbsp;<input type="number" name="elbow45_2" value=""></span>  		
							</td>
							<td><span style="position:relative; left:10px;">- Threaded (R/D=1)</span></td>
							<td><span style="float: left;"><input type="number" name="tee_1"></span></td>
							<td>Globe Valve</td>
							<td><span style="float: left;"><input type="number" name="gvalve_2"></span></td>
							<td>Diaphragm</td>
							<td><span style="float: left;"><input type="number" name="diaphragm"></span></td>

						</tr>
						
						<tr class="fitting">
							<td colspan="2"> 90 Elbow Flanged</td>
							<td colspan="2"> 180 Bend </td>
							<td><span style="position:relative; left:10px;">- Threaded (R/D=1.5)</span></td>
							<td><span style="float: left;"><input type="number" name="tee_2"></span></td>
							<td colspan="2">Angle Valve</td>
							<td colspan="2">check Valve</td>
						</tr>
						
						<tr class="fitting">
							<td colspan="2">
								Std(R/D=1)&nbsp;<input type="number" name="elbow90_3" value="">
								<span style="position:relative; left:22px;">Long(R/D=2)&nbsp;<input type="number" name="elbow90_4" value=""></span>  
							</td>
							<td colspan="2">
								- Threaded, closed-return (R/D=1)&nbsp;<span style="position:relative; left:6px;"><input type="number" name="bend_1" value=""></span>
							</td>
							<td><span style="position:relative; left:10px;">- Flanged (R/D=1)</span></td>
							<td><span style="float: left;"><input type="number" name="tee_3"></span></td>
							<td colspan="2">
								<span style="position:relative; left:10px;">- 45&ordm;&nbsp;&nbsp;<input type="number" name="avalve_1" value=""></span>
								<span style="position:relative; left:20px;">- 90&ordm;&nbsp;&nbsp;<input type="number" name="avalve_2" value=""></span>  		
							</td>
							<td colspan="2">
								<span style="position:relative; left:10px;">- swing&nbsp;&nbsp;<input type="number" name="elbow45_1" value=""></span>
								<span style="position:relative; left:20px;">- left&nbsp;&nbsp;<input type="number" name="elbow45_2" value=""></span>  		
							</td>

						</tr>
									
						<tr class="fitting">
							<td colspan="2">
								Std(R/D=4)&nbsp;<input type="number" name="elbow90_5" value="">
								<span style="position:relative; left:22px;">Long(R/D=6)&nbsp;<input type="number" name="elbow90_6" value=""></span>  
							</td>
							<td colspan="2">
								- All types (R/D=1.5)&nbsp;
								<span style="position:relative; left:100px;"><input type="number" name="bend_1" value=""></span>
							</td>
							<td><span style="position:relative; left:10px;">- Stub in branch</span></td>
							<td><span style="float: left;"><input type="number" name="tee_4"></span></td>
							<td colspan="2">
								Plug Valve 
							</td>
							<td colspan="2">
								Reducer & Expander
							</td>

						</tr>	
						
						<tr class="fitting">
							<td colspan="2">90 Elbow Welded</td>
							<td colspan="2"></td>
							<td colspan="2">Tee (Run-Through)</td>
							<td><span style="position:relative; left:10px;">- branch flow</span></td>
							<td><span style="float: left;"><input type="number" name="pvalve_1"></span></td>
							<td colspan="2">
								<span style="position:relative; left:5px;">Reducer</span> 
							</td>	

						</tr>	
						
						<tr class="fitting">
							<td colspan="2">
								<span style="position:relative; left:181px;">1 Weld 90&nbsp;<input type="number" name="elbow90_7" value=""></span>
							</td>
							<td colspan="2"></td>
							<td><span style="position:relative; left:10px;">- Threaded (R/D=1)</span></td>
							<td><span style="float: left;"><input type="number" name="tee_5"></span></td>
							<td><span style="position:relative; left:10px;">- Straight though</span></td>
							<td><span style="float: left;"><input type="number" name="pvalve_2"></span></td>
							<td colspan="2">
								<span style="position:relative; left:10px;">- dia.(in)&nbsp;<input type="number" name="dred" value=""></span>
								<span style="position:relative; left:10px;">- theta&nbsp;<input type="number" name="thred" value=""></span>  		
							</td>	
						</tr>	
											
						<tr class="fitting">
							<td colspan="2">
								<span style="position:relative; left:181px;">2 Weld 45&nbsp;<input type="number" name="elbow90_8" value=""></span>
							</td>
							<td colspan="2"></td>
							<td><span style="position:relative; left:10px;">- Flanged (R/D=1)</span></td>
							<td><span style="float: left;"><input type="number" name="tee_6"></span></td>
							<td><span style="position:relative; left:10px;">- three way</span></td>
							<td rowspan="2"><span style="float: left;"><input type="number" name="pvalve_2"></span></td>
							<td colspan="2">
								<span style="position:relative; left:5px;">Expander</span>
							</td>
						</tr>	
											
						<tr class="fitting">
							<td colspan="2">
								<span style="position:relative; left:181px;">3 Weld 30&nbsp;<input type="number" name="elbow90_9" value=""></span>
							</td>
							<td colspan="2"></td>
							<td><span style="position:relative; left:10px;">- Stub in branch</span></td>
							<td><span style="float: left;"><input type="number" name="tee_7"></span></td>
							<td><span style="position:relative; left:20px;">(flow though)</span></td>
							<td colspan="2">
								<span style="position:relative; left:10px;">- dia.(in)&nbsp;<input type="number" name="dexp" value=""></span>
								<span style="position:relative; left:10px;">- theta&nbsp;<input type="number" name="thexp" value=""></span> 
							</td>
						</tr>	
											

					</tbody>
					
				</table>
				
			</div>
			<br><br>
			</c:forEach>
		</form>
	</div>

	
</body>
</html>