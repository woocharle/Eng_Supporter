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
		.intro table{position: relative; left: 60px; margin-bottom: 20px;}
		.intro h3{position: relative; left: 50px; font-size: 30px; margin-bottom: 50px;}	
		.intro td{height: 40px;}

		#tbutton {position:relative; left: 200px; width:150px; height:35px; font-size: 20px;}
		#itemno{width: 180px; font-size:22px; text-align: center;}
		.tank1_ip{width:80px; font-size:20px; text-align: center;}
		.tank1_ip2{width:100px; font-size:20px; text-align: center;}
		.tank1_txt{font-size: 24px;}
		.tank1_txt1{width:205px; font-size:20px; padding-left:10px;}
		.tank1_txt2{width:150px; font-size:20px;}
		.tank1_txt3{width:280px; font-size:22px;}
		.tank1_txt4{width:220px; font-size:22px;}
		.tank1_txt5{width:40px; font-size:20px;}
		.tank1_txt6{width:150px; text-align:center; font-size:20px;}
	
		#tank2 input{width:100px; font-size:20px; text-align: center;}
		
		#cal_res{position:relative;}
		
	</style>

    <script type="text/javascript">
		function cal_go(f) {
			f.action="tankheat_cal.do";
			f.submit(); 
		}
		
		function rev_go(f) {
			f.action="tankheat_rev.do";
			f.submit(); 
		}
		
	</script>
</head>
<body>
	<div class="intro">
		<h3>Tank HeatTransfer</h3>
		<form method="post">
			<table id="tank1">
				<tbody>
					<tr>
						<td class="tank1_txt">Item No.</td>
						<td><input type="text" id="itemno" name="itemno" value="${tvo.itemno}"/></td> 
						<td colspan="2"><input id="tbutton" type="button" value="Calculate" onclick="cal_go(this.form)" /></td>
					</tr>
					<tr><td colspan="4" class="tank1_txt">Surrounding</td></tr>
					<tr>
						<td class="tank1_txt1">Wind Velocity</td>
						<td class="tank1_txt2">m/s</td>
						<td><input type="number" class="tank1_ip" name="vel_wind" value="${tvo.vel_wind}"></td>
						<td rowspan="6" style="width:300px;"><img style="position: relative; left:80px;" alt="sphere" src="/resources/upload/sphere.png"></td>
					</tr>	
					<tr>
						<td class="tank1_txt1">Type of Surface</td>
						<td colspan="2">
							<select name="stype" class="tank1_txt3" onchange="rev_go(this.form)">
								<option value="common" <c:if test="${tvo.stype eq 'common'}"> selected </c:if>> Commonly used </option>					
								<option value="alumi" <c:if test="${tvo.stype eq 'alumi'}"> selected </c:if>> Aluminum </option>					
								<option value="steel" <c:if test="${tvo.stype eq 'steel'}"> selected </c:if>> Steel, Oxidized </option>					
								<option value="paper" <c:if test="${tvo.stype eq 'paper'}"> selected </c:if>> Asbestos cloth or paper</option>					
								<option value="enamel" <c:if test="${tvo.stype eq 'enamel'}"> selected </c:if>> Porcelain enamel, white </option>					
								<option value="wood" <c:if test="${tvo.stype eq 'wood'}"> selected </c:if>> Wood </option>					
								<option value="black1" <c:if test="${tvo.stype eq 'black1'}"> selected </c:if>> Paints: Black, shiny </option>					
								<option value="black2" <c:if test="${tvo.stype eq 'black2'}"> selected </c:if>> Paints: Black, flat </option>					
								<option value="black3" <c:if test="${tvo.stype eq 'black3'}"> selected </c:if>> Paints: Oil paints </option>					
								<option value="black4" <c:if test="${tvo.stype eq 'black4'}"> selected </c:if>> Paints: Aluminum </option>					
								<option value="black5" <c:if test="${tvo.stype eq 'black5'}"> selected </c:if>> Paints: Bronze </option>					
			       	
							</select>
						</td>
					</tr>
					<tr>
						<td class="tank1_txt1" colspan="2">Emissivity
						 <span style="position: relative; left:110px;">Guide:&nbsp;&#40;${tvo.em1}&#41;</span>
						<td><input type="number" name="em2" class="tank1_ip" value="${tvo.em2}"></td>
					</tr>	
					<tr>							
						<td colspan="3" class="tank1_txt">Ground</td>
					</tr>	
					<tr>
						<td class="tank1_txt1">Temperature</td>
						<td class="tank1_txt2">&deg;C</td>
						<td><input type="number" name="temp_sur" class="tank1_ip" value="${tvo.temp_sur}"></td>
					</tr>	
					<tr>
						<td class="tank1_txt1">Conductivity</td>
						<td class="tank1_txt2">kcal/m h &deg;C</td>
						<td><input type="number" name="con_sur" class="tank1_ip" value="${tvo.con_sur}"></td>
					</tr>							
				</tbody>
			
			</table>
			<table>
				<thead><tr><td colspan="5" class="tank1_txt">Tank Specification</td></tr></thead>
				<tbody>
					<tr>
						<td class="tank1_txt1">Type of Tank</td>
						<td>
							<select name="ttype" class="tank1_txt4">
								<option value="tank" <c:if test="${tvo.ttype eq 'tank'}"> selected </c:if>> Tank </option>					
			               		<option value="vessel" <c:if test="${tvo.ttype eq 'vessel'}"> selected </c:if>> Vessel </option>		  	
							</select>
						</td>	
						<td class="tank1_txt1" style="width:230px;">Diameter</td>
						<td class="tank1_txt5">m</td>
						<td><input type="number" class="tank1_ip" name="tdia" value="${tvo.tdia}"></td>						
					</tr>
					<tr>
						<td class="tank1_txt1">Type of Body</td>
						<td>
							<select name="btype" class="tank1_txt4">
								<option value="vertical1" <c:if test="${tvo.btype eq 'vertical1'}"> selected </c:if>> Vertical plate </option>					
			               		<option value="vertical2" <c:if test="${tvo.btype eq 'vertical2'}"> selected </c:if>> Vertical Cylinder </option>		  	
			               		<option value="horizontal" <c:if test="${tvo.btype eq 'horizontal'}"> selected </c:if>> Horizontal Cylinder </option>		  	
			               		<option value="sphere" <c:if test="${tvo.btype eq 'sphere'}"> selected </c:if>> Sphere </option>		  	
							</select>
						</td>	
						<td class="tank1_txt1">Length (Total)</td>
						<td class="tank1_txt5">m</td>
						<td><input type="number" class="tank1_ip"  name="tlen" value="${tvo.tlen}"></td>						
					</tr>				
					<tr>
						<td class="tank1_txt1">Type of Head</td>
						<td>
							<select name="htype" class="tank1_txt4" onchange="rev_go(this.form)">
								<option value="plate" <c:if test="${tvo.htype eq 'plate'}"> selected </c:if>> PLATE </option>					
			               		<option value="roof" <c:if test="${tvo.htype eq 'roof'}"> selected </c:if>> Roof </option>		  	
			               		<option value="ellips1" <c:if test="${tvo.htype eq 'ellips1'}"> selected </c:if>> 2:1 ELLIPS </option>		  	
			               		<option value="ellips2" <c:if test="${tvo.htype eq 'ellips2'}"> selected </c:if>> 3:1 ELLIPS </option>		  	
							</select>
						</td>	
						<td class="tank1_txt1">Length (Wet)</td>
						<td class="tank1_txt5">m</td>
						<td><input type="number" class="tank1_ip" name="wtlen" value="${tvo.wtlen}"></td>						
					</tr>				
					<tr>
						<td class="tank1_txt1">Equip on Leg</td>
						<td>
							<select name="ltype" class="tank1_txt4" onchange="rev_go(this.form)">
								<option value="yes" <c:if test="${tvo.ltype eq 'yes'}"> selected </c:if>> Yes </option>					
			               		<option value="no" <c:if test="${tvo.ltype eq 'no'}"> selected </c:if>> No </option>		  	
							</select>
						</td>	
						<td class="tank1_txt1">Height of Roof Center</td>
						<td class="tank1_txt5">m</td>
						<td><input type="number" class="tank1_ip" name="troof" value="${troof}" <c:if test="${tvo.htype ne 'roof'}"> readonly </c:if>></td>						
					</tr>
				</tbody>		
			</table>
			<table>
				<thead>
					<tr>
						<td></td><td></td><td rowspan="2" class="tank1_txt6">Body</td>
						<td colspan="3" class="tank1_txt6">Insulation</td>
					</tr>
					<tr>
						<td></td><td></td><td class="tank1_txt6" >Side</td>
						<td class="tank1_txt6">Roof</td><td class="tank1_txt6">Bottom</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="tank1_txt1">Material</td>
						<td style="width: 120px; font-size:20px;">m</td>
						<td style="text-align: center;"><input type="number" class="tank1_ip2" name="mtl_body" value="${tvo.mtl_body}"></td>
						<td style="text-align: center;"><input type="number" class="tank1_ip2" name="mtl_sinsul" value="${tvo.mtl_sinsul}"></td>
						<td style="text-align: center;">
							<c:if test="${tvo.htype eq 'roof'}"><input type="number" class="tank1_ip2" name="mtl_rinsul" value="${tvo.mtl_rinsul}"></c:if>
						</td>
						<td style="text-align: center;">
							<c:if test="${tvo.ltype eq 'no'}"><input type="number" class="tank1_ip2" name="mtl_binsul" value="${tvo.mtl_binsul}"></c:if>
						</td>
					</tr>
					<tr>
						<td class="tank1_txt1">Thickness</td>
						<td style="width: 120px; font-size:20px;">mm</td>
						<td style="text-align: center;"><input type="number" class="tank1_ip2" name="thick_body" value="${tvo.thick_body}"></td>
						<td style="text-align: center;"><input type="number" class="tank1_ip2" name="thick_sinsul" value="${tvo.thick_sinsul}"></td>
						<td style="text-align: center;">
							<c:if test="${tvo.htype eq 'roof'}"><input type="number" class="tank1_ip2" name="thick_rinsul" value="${tvo.thick_rinsul}"></c:if>
						</td>
						<td style="text-align: center;">
							<c:if test="${tvo.ltype eq 'no'}"><input type="number" class="tank1_ip2" name="thick_binsul" value="${tvo.thick_binsul}"></c:if>
						</td>
					</tr>
					<tr>
						<td class="tank1_txt1">Thermal Conductivity</td>
						<td style="width: 120px; font-size:20px;">m</td>
						<td style="text-align: center;"><input type="number" class="tank1_ip2" name="thcon_body" value="${tvo.thcon_body}"></td>
						<td style="text-align: center;"><input type="number" class="tank1_ip2"  name="thcon_sinsul" value="${tvo.thcon_sinsul}"></td>
						<td style="text-align: center;">
							<c:if test="${tvo.htype eq 'roof'}"><input type="number" class="tank1_ip2" name="thcon_rinsul" value="${tvo.thcon_rinsul}"></c:if>
						</td>
						<td style="text-align: center;">
							<c:if test="${tvo.ltype eq 'no'}"><input type="number" class="tank1_ip2" name="thcon_binsul" value="${tvo.thcon_binsul}"></c:if>
						</td>
					</tr>
					<tr>
						<td></td><td></td><td class="tank1_txt6">Dry wall</td><td class="tank1_txt6">Wet wall</td>
						<td class="tank1_txt6">Roof</td><td class="tank1_txt6">Bottom</td>
					</tr>
					<tr>
						<td class="tank1_txt1">Assume Fouling <br>Coefficients</td>
						<td style="width: 120px; font-size:20px;">m<sup>2</sup> h &deg;C/kcal</td>
						<td style="text-align: center;"><input type="number" class="tank1_ip2" name="fcoeff_drywall" value="${tvo.fcoeff_drywall}"></td>
						<td style="text-align: center;"><input type="number" class="tank1_ip2" name="fcoeff_wetwall" value="${tvo.fcoeff_wetwall}"></td>
						<td style="text-align: center;">
							<c:if test="${tvo.htype eq 'roof'}"><input type="number" class="tank1_ip2" name="fcoeff_roof" value="${tvo.fcoeff_roof}"></c:if>
						</td>
						<td style="text-align: center;">
							<c:if test="${tvo.ltype eq 'no'}"><input type="number" class="tank1_ip2" name="fcoeff_bottom" value="${tvo.fcoeff_bottom}"></c:if>
						</td>
					</tr>						
				</tbody>
			</table>

			<table id="tank2">
				<thead>
					<tr><td colspan="10" class="tank1_txt">Property of Tank</td></tr>
					<tr><td colspan="2"></td><td class="tank1_txt6">Liquid</td><td class="tank1_txt6">Vapor</td><td class="tank1_txt6">Air</td></tr>
				</thead>
				<tbody>
					<tr>
						<td class="tank1_txt1">Temperature</td>
						<td style="width: 120px; font-size:20px;">&deg;C</td>
						<td style="text-align: center;"><input type="number" name="temp_liq" value="${tvo.temp_liq}"></td>
						<td style="text-align: center;"><input type="number" name="temp_vap" value="${tvo.temp_vap}"></td>
						<td style="text-align: center;"><input type="number" name="temp_air" value="${tvo.temp_air}"></td>
					</tr>
					<tr>
						<td class="tank1_txt1">Thermal Conductivity</td>
						<td style="width: 120px; font-size:20px;">kcal/m h &deg;C</td>
						<td style="text-align: center;"><input type="number" name="thm_liq" value="${tvo.thm_liq}"></td>
						<td style="text-align: center;"><input type="number" name="thm_vap" value="${tvo.thm_vap}"></td>
						<td style="text-align: center;"><input type="number" name="thm_air" value="${tvo.thm_air}"></td>
					</tr>
					<tr>
						<td class="tank1_txt1">Specific Heat</td>
						<td style="width: 120px; font-size:20px;">kcal/kg &deg;C</td>
						<td style="text-align: center;"><input type="number" name="spheat_liq" value="${tvo.spheat_liq}"></td>
						<td style="text-align: center;"><input type="number" name="spheat_vap" value="${tvo.spheat_vap}"></td>
						<td style="text-align: center;"><input type="number" name="spheat_air" value="${tvo.spheat_air}"></td>
					</tr>
					<tr>
						<td class="tank1_txt1">Viscosity</td>
						<td style="width: 120px; font-size:20px;">cP</td>
						<td style="text-align: center;"><input type="number" name="vis_liq" value="${tvo.vis_liq}"></td>
						<td style="text-align: center;"><input type="number" name="vis_vap" value="${tvo.vis_vap}"></td>
						<td style="text-align: center;"><input type="number" name="vis_air" value="${tvo.vis_air}"></td>
					</tr>
					<tr>
						<td class="tank1_txt1">Density</td>
						<td style="width: 120px; font-size:20px;">Btu/lb F</td>
						<td style="text-align: center;"><input type="number" name="den_liq" value="${tvo.den_liq}"></td>
						<td style="text-align: center;"><input type="number" name="den_vap" value="${tvo.den_vap}"></td>
						<td style="text-align: center;"><input type="number" name="den_air" value="${tvo.den_air}"></td>
					</tr>
					<tr>
						<td class="tank1_txt1">Coefficient of<br>Volumetric Expansion </td>
						<td style="width: 120px; font-size:20px;">1 / &deg;C</td>
						<td style="text-align: center;"><input type="number" name="ceff_liq" value="${tvo.ceff_liq}"></td>
						<td style="text-align: center;"><input type="number" name="ceff_vap" value="${tvo.ceff_vap}"></td>
						<td style="text-align: center;"><input type="number" name="ceff_air" value="${tvo.ceff_air}"></td>
					</tr>

				</tbody>
			</table>
			<table style="margin-top: 50px;">
				<thead>
					<tr>
						<td colspan="6" class="tank1_txt">Calculate Result</td>
					</tr>

				</thead>
				<tbody>
					<tr>
						<td></td><td></td>
						<td class="tank1_txt6" >Drywall</td>
						<td class="tank1_txt6">Wetwall</td>
						<td class="tank1_txt6">Roof</td>
						<td class="tank1_txt6">Bottom</td>
					</tr>
					<tr>
						<td class="tank1_txt1">Temperature</td>
						<td style="width: 120px; font-size:20px;">&deg;C</td>
						<td style="text-align: center;"><input type="number" class="tank1_ip2" name="temp_dry" value="${tvo.temp_dry}" readonly="readonly"></td>
						<td style="text-align: center;"><input type="number" class="tank1_ip2" name="temp_wet" value="${tvo.temp_wet}" readonly="readonly"></td>
						<td style="text-align: center;">
							<c:if test="${tvo.htype eq 'roof'}"><input type="number" class="tank1_ip2" name="temp_roof" value="${tvo.temp_roof}" readonly="readonly"></c:if>
						</td>
						<td style="text-align: center;">
							<c:if test="${tvo.ltype eq 'no'}"><input type="number" class="tank1_ip2" name="temp_btm" value="${tvo.temp_btm}" readonly="readonly"></c:if>
						</td>
					</tr>
					<tr>
						<td class="tank1_txt1">U&nbsp;&#40;Overall Coefficient&#41;</td>
						<td style="width: 120px; font-size:20px;">kcal/m<sup>2</sup> h &deg;C</td>
						<td style="text-align: center;"><input type="number" class="tank1_ip2" name="ocf_dry" value="${tvo.ocf_dry}" readonly="readonly"></td>
						<td style="text-align: center;"><input type="number" class="tank1_ip2" name="ocf_wet" value="${tvo.ocf_wet}" readonly="readonly"></td>
						<td style="text-align: center;">
							<c:if test="${tvo.htype eq 'roof'}"><input type="number" class="tank1_ip2" name="ocf_roof" value="${tvo.ocf_roof}" readonly="readonly"></c:if>
						</td>
						<td style="text-align: center;">
							<c:if test="${tvo.ltype eq 'no'}"><input type="number" class="tank1_ip2" name="ocf_btm" value="${tvo.ocf_btm}" readonly="readonly"></c:if>
						</td>
					</tr>
					<tr>
						<td class="tank1_txt1">A&nbsp;&#40;Area&#41;</td>
						<td style="width: 120px; font-size:20px;">m<sup>2</sup> </td>
						<td style="text-align: center;"><input type="number" class="tank1_ip2" name="area_dry" value="${tvo.area_dry}" readonly="readonly"></td>
						<td style="text-align: center;"><input type="number" class="tank1_ip2"  name="area_wet" value="${tvo.area_wet}" readonly="readonly"></td>
						<td style="text-align: center;">
							<c:if test="${tvo.htype eq 'roof'}"><input type="number" class="tank1_ip2" name="area_roof" value="${tvo.area_roof}" readonly="readonly"></c:if>
						</td>
						<td style="text-align: center;">
							<c:if test="${tvo.ltype eq 'no'}"><input type="number" class="tank1_ip2" name="area_btm" value="${tvo.area_btm}" readonly="readonly"></c:if>
						</td>
					</tr>

					<tr>
						<td class="tank1_txt1">Q&nbsp;&#40;Heat Transfer&#41;</td>
						<td style="width: 120px; font-size:20px;">kcal/hr</td>
						<td style="text-align: center;"><input type="number" class="tank1_ip2" name="heat_dry" value="${tvo.heat_dry}" readonly="readonly"></td>
						<td style="text-align: center;"><input type="number" class="tank1_ip2" name="heat_wet" value="${tvo.heat_wet}" readonly="readonly"></td>
						<td style="text-align: center;">
							<c:if test="${tvo.htype eq 'roof'}"><input type="number" class="tank1_ip2" name="heat_roof" value="${tvo.heat_roof}" readonly="readonly"></c:if>
						</td>
						<td style="text-align: center;">
							<c:if test="${tvo.ltype eq 'no'}"><input type="number" class="tank1_ip2" name="heat_btm" value="${tvo.heat_btm}" readonly="readonly"></c:if>
						</td>
					</tr>						
				</tbody>
				<tfoot>
						<tr>
							<td colspan="6"> <p id="cal_res"> <c:if test="${tvo.heat_total ne null}">${tvo.heat_total}</c:if> </p></td>
						</tr>
				</tfoot>
			</table>			
		</form>
	</div>
</body>

</html>