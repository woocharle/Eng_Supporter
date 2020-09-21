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
				<table style="width:600px;">
					<tbody>
						<tr><td>Item No.</td> <td colspan="3"></td></tr>
						<tr><td colspan="4">Surrounding</td></tr>
						<tr>
							<td>Wind Velocity</td>
							<td>mph</td>
							<td><input type="number" name="vel_wind" value=""></td>
							<td rowspan="6"><img alt="sphere" src="/resources/upload/sphere.png"></td>
						</tr>	
						<tr>
							<td>Type of Surface</td>
							<td colspan="2">
								<select name="stype">
									<option value="centri" <c:if test="${tvo.stype eq 'common'}"> selected </c:if>> Commonly used </option>					
				               		<option value="rotary" <c:if test="${tvo.stype eq 'rotary'}"> selected </c:if>> - </option>		  	
								</select>
							</td>
						</tr>
						<tr>
							<td>Emissivity</td>
							<td colspan="2"><input type="number" name="em" value=""></td>
						</tr>	
						<tr>							
							<td colspan="3">Ground</td>
						</tr>	
						<tr>
							<td>Temperature</td>
							<td>F</td>
							<td><input type="number" name="temp" value=""></td>
						</tr>	
						<tr>
							<td>Conductivity</td>
							<td>Btu/ft h F</td>
							<td><input type="number" name="con" value=""></td>
						</tr>							
					</tbody>
				
				</table>
				<table style="width:600px;">
					<tbody>
						<tr>
							<td>Type of Tank</td>
							<td>
								<select name="ttype">
									<option value="centri" <c:if test="${tvo.ttype eq 'common'}"> selected </c:if>> Commonly used </option>					
				               		<option value="rotary" <c:if test="${tvo.ttype eq 'rotary'}"> selected </c:if>> - </option>		  	
								</select>
							</td>	
							<td>Diameter</td>
							<td>m</td>
							<td><input type="number" name="dia" value=""></td>						
						</tr>
						<tr>
							<td>Type of Body</td>
							<td>
								<select name="btype">
									<option value="centri" <c:if test="${tvo.btype eq 'common'}"> selected </c:if>> Commonly used </option>					
				               		<option value="rotary" <c:if test="${tvo.btype eq 'rotary'}"> selected </c:if>> - </option>		  	
								</select>
							</td>	
							<td>Length (Total)</td>
							<td>m</td>
							<td><input type="number" name="tlen" value=""></td>						
						</tr>				
						<tr>
							<td>Type of Head</td>
							<td>
								<select name="htype">
									<option value="centri" <c:if test="${tvo.htype eq 'common'}"> selected </c:if>> Commonly used </option>					
				               		<option value="rotary" <c:if test="${tvo.htype eq 'rotary'}"> selected </c:if>> - </option>		  	
								</select>
							</td>	
							<td>Length (Wet)</td>
							<td>m</td>
							<td><input type="number" name="wlen" value=""></td>						
						</tr>				
						<tr>
							<td>Equip on Leg</td>
							<td>
								<select name="ltype">
									<option value="centri" <c:if test="${tvo.ltype eq 'common'}"> selected </c:if>> Commonly used </option>					
				               		<option value="rotary" <c:if test="${tvo.ltype eq 'rotary'}"> selected </c:if>> - </option>		  	
								</select>
							</td>	
							<td>Height of Roof Center</td>
							<td>m</td>
							<td><input type="number" name="hroof" value=""></td>						
						</tr>
					</tbody>		
				</table>
				<table>
					<thead>
						<tr>
							<td></td><td></td><td>Body</td><td>Insulation of Side</td><td>Insulation of Roof</td><td>Insulation of Bottom</td>
							<!-- <td></td><td></td><td>of Side</td>Insulation<td></td><td></td>		 -->				
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Material</td>
							<td>m</td>
							<td><input type="number" name="mtl_body" value=""></td>
							<td><input type="number" name="mtl_sinsul" value=""></td>
							<td><input type="number" name="mtl_rinsul" value=""></td>
							<td><input type="number" name="mtl_binsul" value=""></td>
						</tr>
						<tr>
							<td>Thickness</td>
							<td>inch</td>
							<td><input type="number" name="thick_body" value=""></td>
							<td><input type="number" name="thick_sinsul" value=""></td>
							<td><input type="number" name="thick_rinsul" value=""></td>
							<td><input type="number" name="thick_binsul" value=""></td>
						</tr>
						<tr>
							<td>Thermal Conductivity</td>
							<td>m</td>
							<td><input type="number" name="thcon_body" value=""></td>
							<td><input type="number" name="thcon_sinsul" value=""></td>
							<td><input type="number" name="thcon_rinsul" value=""></td>
							<td><input type="number" name="thcon_binsul" value=""></td>
						</tr>
					</tbody>
				</table>
				<table>
					<thead>
						<tr>
							<td></td><td></td><td>Dry wall</td><td>Wet wall</td><td>Roof</td><td>Bottom</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Assume Fouling Coefficients</td>
							<td>ft<sup>2</sup> h F/Btu</td>
							<td><input type="number" name="fcoeff_drywall" value=""></td>
							<td><input type="number" name="fcoeff_wetwall" value=""></td>
							<td><input type="number" name="fcoeff_roof" value=""></td>
							<td><input type="number" name="fcoeff_bottom" value=""></td>
						</tr>
					</tbody>
				</table>
				<table>
					<thead>
						<tr><td colspan="5">Property of Tank</td></tr>
						<tr><td></td><td></td><td>Liquid</td><td>Vapor</td><td>Air</td></tr>
					</thead>
					<tbody>
						<tr>
							<td>Temperature</td>
							<td>C</td>
							<td><input type="number" name="temp_liq" value=""></td>
							<td><input type="number" name="temp_vap" value=""></td>
							<td><input type="number" name="temp_air" value=""></td>
						</tr>
						<tr>
							<td>Thermal Conductivity</td>
							<td>Btu/ft h</td>
							<td><input type="number" name="temp_liq" value=""></td>
							<td><input type="number" name="temp_vap" value=""></td>
							<td><input type="number" name="temp_air" value=""></td>
						</tr>
						<tr>
							<td>Specific Heat</td>
							<td>Btu/lb F</td>
							<td><input type="number" name="temp_liq" value=""></td>
							<td><input type="number" name="temp_vap" value=""></td>
							<td><input type="number" name="temp_air" value=""></td>
						</tr>
						<tr>
							<td>Viscosity</td>
							<td>cP</td>
							<td><input type="number" name="vis_liq" value=""></td>
							<td><input type="number" name="vis_vap" value=""></td>
							<td><input type="number" name="vis_air" value=""></td>
						</tr>
						<tr>
							<td>Density</td>
							<td>Btu/lb F</td>
							<td><input type="number" name="den_liq" value=""></td>
							<td><input type="number" name="den_vap" value=""></td>
							<td><input type="number" name="den_air" value=""></td>
						</tr>
						<tr>
							<td>Coefficient of<br>Volumetric Expansion </td>
							<td>1 / F</td>
							<td><input type="number" name="exp_liq" value=""></td>
							<td><input type="number" name="exp_vap" value=""></td>
							<td><input type="number" name="exp_air" value=""></td>
						</tr>

					</tbody>
				</table>
				
				
				
			</form>
	</div>
</body>
</html>