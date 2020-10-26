package com.ict.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ict.db.HVO2;
import com.ict.db.TVO;
import com.ict.model.Pipespec;
import com.ict.model.Heats;

@Controller
public class Heat_Controller {
	private Pipespec pipespec;
	private Heats heats;
	private double[] dialist;
	private int select_sch;

	@Autowired
	public void setPipespec(Pipespec pipespec) {
		this.pipespec = pipespec;
	}
	
	@Autowired
	public void setHeats(Heats heats) {
		this.heats = heats;
	}
	
	//1.pipe

	@RequestMapping(value="pipeheat_add.do", method=RequestMethod.POST)
	public ModelAndView lineadd_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String cal = request.getParameter("cal");
		
		List<HVO2> list = (List<HVO2>)request.getSession().getAttribute("list");
		
		HVO2[] b_list = list.toArray(new HVO2[list.size()]);
		list.clear();
		
		for (int i = 0; i < b_list.length + 1; i++) {
			HVO2 hvo2 = new HVO2(); 
			
			if(i == b_list.length) {
				hvo2.setIdx(String.valueOf(i+1));
				hvo2.setEv("bare");
				hvo2.setPhase("liquid");
				hvo2.setStype("common");
				hvo2.setEm(String.valueOf(pipespec.getPipe_em().get(hvo2.getStype())));
				hvo2.setCfactor("fitting");
				hvo2.setDia("6");
				hvo2.setDlist(pipespec.getSize());
				hvo2.setSch("STD");
				hvo2.setSlist(pipespec.getSchedule());
				dialist = pipespec.getDialist(hvo2.getDia());
				select_sch = pipespec.getSch().get(hvo2.getSch());
				hvo2.setDin(String.valueOf(dialist[select_sch]));
				hvo2.setDout(String.valueOf(dialist[17]));
				
			} else {
				hvo2.setIdx(String.valueOf(i + 1));
				getPipedata(request, hvo2);
			
			}
			list.add(hvo2);
			
		}
		
		request.setAttribute("cal", cal);
		request.getSession().setAttribute("list", list);
		
		mv.setViewName("view_user/4.calculator");
		
		return mv;
	}
	
	
	@RequestMapping(value="pipeheat_del.do", method=RequestMethod.POST)
	public ModelAndView linedel_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String cal = request.getParameter("cal");
		
		List<HVO2> list = (List<HVO2>)request.getSession().getAttribute("list");
		
		for (HVO2 hvo2 : list) {
			getPipedata(request, hvo2);
		}
		
		String del_line = request.getParameter("del_line");
		HVO2[] b_list = list.toArray(new HVO2[list.size()]);
		int n = 1;
		list.clear();
		
		for (int i = 0; i < b_list.length; i++) {
			HVO2 hvo2 = new HVO2();
			
			if (del_line.equals(b_list[i].getLineno())) {
				continue;
			} else {
				hvo2.setIdx(String.valueOf(n));
				savePipedata(hvo2, b_list, i);
				
				n += 1;
			}

			list.add(hvo2);
		}
		
		request.setAttribute("cal", cal);
		request.getSession().setAttribute("list", list);
		
		mv.setViewName("view_user/4.calculator");
		
		return mv;
		
	}
	
	@RequestMapping(value="pipeheat_rev.do", method=RequestMethod.POST)
	public ModelAndView linerev_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String cal = request.getParameter("cal");
		List<HVO2> list = (List<HVO2>)request.getSession().getAttribute("list");
		
		for (HVO2 k : list) {
			getPipedata(request, k);
		}
		
		request.setAttribute("cal", cal);
		request.getSession().setAttribute("list", list);
		
		mv.setViewName("view_user/4.calculator");
		return mv;
	}
	
	
	@RequestMapping(value="pipeheat_cal.do", method=RequestMethod.POST)
	public ModelAndView linecal_Cmd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String cal = request.getParameter("cal");
		String idx;
	
		List<HVO2> list = (List<HVO2>)request.getSession().getAttribute("list");
		
		for (HVO2 k : list) {
	
			getPipedata(request, k);
		
			double[] fitting_n = new double[38];
			double[][] fitting_cal = {
				pipespec.getElbow90_1(), pipespec.getElbow90_2(), pipespec.getElbow90_3(),
				pipespec.getElbow90_4(), pipespec.getElbow90_5(), pipespec.getElbow90_6(),
				pipespec.getElbow90_7(), pipespec.getElbow90_8(), pipespec.getElbow90_9(),
				pipespec.getElbow45_1(), pipespec.getElbow45_2(), pipespec.getElbow45_3(), pipespec.getElbow45_4(),
				pipespec.getBend_1(), pipespec.getBend_2(), pipespec.getBend_3(), 
				pipespec.getTee_1(), pipespec.getTee_2(), pipespec.getTee_3(), pipespec.getTee_4(),
				pipespec.getTee_5(), pipespec.getTee_6(), pipespec.getTee_7(),
				pipespec.getGtvalve(), pipespec.getGbvalve(), pipespec.getBvalve(), pipespec.getDvalve(),
				pipespec.getCvalve_1(), pipespec.getCvalve_2(), pipespec.getAvalve_1(), pipespec.getAvalve_2(),
				pipespec.getPvalve_1(), pipespec.getPvalve_2(), pipespec.getPvalve_3()
				
			};

			try {
				
				double den_liq = change(k.getDen_liq());
				double vis_liq = change(k.getDen_liq()); 
				double den_vap = change(k.getDen_liq()); 
				double vis_vap = change(k.getDen_liq()); 
				
				double flow = change(k.getFlow()) * change(k.getOver());
				double din = change(k.getDin());
				double dia = change(k.getDia());
				double wall = change(k.getWall());
				double pipe = change(k.getPipelen());
				
				/*
				 * 2phase 문제 해결 하면 이용.
				double vapor_fr = change(k.getVapor_fr());
				
				double flow_liq;
				double flow_vap; 
				
				*/
				
				double re = pipespec.calRe(k.getPhase(), den_liq, vis_liq, flow, den_vap, vis_vap, flow, din);
				k.setRe(String.valueOf((int)re));
				double ffactor = k.getPhase().equals("liquid") ? 
						pipespec.calFfactor_liq(re, din * 25.4 / 1000, wall) : pipespec.calFfactor_vap(re, din * 25.4 / 1000, wall);
				
				double eqv_len = 0;
				double kvalue = 0;
				
				if (k.getCfactor().equals("fitting")) {
										
					fitting_n[0] = ((int)change(k.getElbow90_1()) * 10) / 10 ;
					fitting_n[1] = ((int)change(k.getElbow90_2()) * 10) / 10 ;
					fitting_n[2] = ((int)change(k.getElbow90_3()) * 10) / 10 ;
					fitting_n[3] = ((int)change(k.getElbow90_4()) * 10) / 10 ;
					fitting_n[4] = ((int)change(k.getElbow90_5()) * 10) / 10 ;
					fitting_n[5] = ((int)change(k.getElbow90_6()) * 10) / 10 ;
					fitting_n[6] = ((int)change(k.getElbow90_7()) * 10) / 10 ;
					fitting_n[7] = ((int)change(k.getElbow90_8()) * 10) / 10 ;
					fitting_n[8] = ((int)change(k.getElbow90_9()) * 10) / 10 ;
	
					fitting_n[9] = ((int)change(k.getElbow45_1()) * 10) / 10 ;
					fitting_n[10] = ((int)change(k.getElbow45_2()) * 10) / 10 ;
					fitting_n[11] = ((int)change(k.getElbow45_3()) * 10) / 10 ;
					fitting_n[12] = ((int)change(k.getElbow45_4()) * 10) / 10 ;
										
					fitting_n[13] = ((int)change(k.getBend_1()) * 10) / 10 ;
					fitting_n[14] = ((int)change(k.getBend_2()) * 10) / 10 ;
					fitting_n[15] = ((int)change(k.getBend_3()) * 10) / 10 ;				
					
					fitting_n[16] = ((int)change(k.getTee_1()) * 10) / 10 ;
					fitting_n[17] = ((int)change(k.getTee_2()) * 10) / 10 ;
					fitting_n[18] = ((int)change(k.getTee_3()) * 10) / 10 ;	
					fitting_n[19] = ((int)change(k.getTee_4()) * 10) / 10 ;
					fitting_n[20] = ((int)change(k.getTee_5()) * 10) / 10 ;
					fitting_n[21] = ((int)change(k.getTee_6()) * 10) / 10 ;	
					fitting_n[22] = ((int)change(k.getTee_7()) * 10) / 10 ;	
					
					fitting_n[23] = ((int)change(k.getGtvalve()) * 10) / 10 ;				
					fitting_n[24] = ((int)change(k.getBvalve()) * 10) / 10 ;				
					fitting_n[25] = ((int)change(k.getGbvalve()) * 10) / 10 ;				
					fitting_n[26] = ((int)change(k.getDvalve()) * 10) / 10 ;				
					fitting_n[27] = ((int)change(k.getAvalve_1()) * 10) / 10 ;				
					fitting_n[28] = ((int)change(k.getAvalve_2()) * 10) / 10 ;				
					fitting_n[29] = ((int)change(k.getCvalve_1()) * 10) / 10 ;				
					fitting_n[30] = ((int)change(k.getCvalve_2()) * 10) / 10 ;				
					fitting_n[31] = ((int)change(k.getPvalve_1()) * 10) / 10 ;				
					fitting_n[32] = ((int)change(k.getPvalve_2()) * 10) / 10 ;				
					fitting_n[33] = ((int)change(k.getPvalve_3()) * 10) / 10 ;				
					
					fitting_n[34] = ((int)change(k.getRedd()) * 10) / 10 ;				
					fitting_n[35] = ((int)change(k.getRedth()) * 10) / 10 ;				
	
					fitting_n[36] = ((int)change(k.getExpd()) * 10) / 10 ;				
					fitting_n[37] = ((int)change(k.getExpth()) * 10) / 10 ;		
					
					for (int i = 0; i < 38; i++) {
						if (fitting_n[i] != 0 ) {
							if (i == 35) {
								kvalue += pipespec.calReducer(dia, fitting_n[i - 1], fitting_n[i]);
							} else if (i == 37) {
								kvalue += pipespec.calExpander(dia, fitting_n[i - 1], fitting_n[i]);
							} else {
								kvalue += fitting_cal[i][0] / re + fitting_cal[i][1] * 
										(1 + fitting_cal[i][2] / Math.pow(dia, 0.3));
								
							}
						}
					}
					
					eqv_len = kvalue * (dia * 25.4 / 1000) / ffactor;
					eqv_len = pipe + eqv_len;
				
				}else {
					switch (k.getCfactor()) {
						case "utility":	
							eqv_len = 0.00002 * Math.pow(din, 3) - 0.00109 * Math.pow(din, 2)
									+ 0.03055 * din + 1.1164;
						break;
						case "long":	
							eqv_len = 0.00003 * Math.pow(din, 3) - 0.00219 * Math.pow(din, 2)
							+ 0.06114 * din + 1.2334;
						break;
						case "norpipe":	
							eqv_len = 0.00007 * Math.pow(din, 3) - 0.00439 * Math.pow(din, 2)
							+ 1.2242 * din + 1.4667;
						break;
						case "manifold":	
							eqv_len = 0.00016 * Math.pow(din, 3) - 0.00957 * Math.pow(din, 2)
							+ 2.5127 * din + 1.9249;
						break;
						case "complex":	
							eqv_len = 0.00034 * Math.pow(din, 3) - 0.01987 * Math.pow(din, 2)
							+ 5.0854 * din + 2.8417;
						break;
		
					}
					
					eqv_len = pipe * eqv_len;
					
				}
				
				k.setEql_len(String.valueOf(((int)(eqv_len * 100)) / 100.0));
				

				// SI => british
				double temp = k.getPhase().equals("liquid") ? 
						change(k.getTemp_liq()) : change(k.getTemp_vapor());   
				temp = temp * 9 / 5 + 32;
						
				double temp_air = change(k.getTemp_air()) * 9 / 5 + 32;
				double g_temp = 0;
				
				// 외부 지름.
				double dout = change(k.getDout());
				double d_insul = dout + 2 * change(k.getInsul_thick()); 
				double dsoil = 3 * dout;
				
				// conductivity
				
				double insul_con = change(k.getInsul_con()) / 1.488164;
				double pipe_con = change(k.getPipe_con()) / 1.488164;
				double ksoil = change(k.getSoil()) / 1.488164;
				double thcon = k.getPhase().equals("liquid") ? 
									change(k.getThcon_liq()) : change(k.getThcon_vapor());    
				thcon = thcon / 1.488164;
				
				//viscosity 
				double vis_in = k.getPhase().equals("liquid") ? 
									change(k.getVis_liq()) : change(k.getVis_vapor());   
				
				// Heat capacity
				double cp_in = k.getPhase().equals("liquid") ? 
						change(k.getHeat_liq()) : change(k.getHeat_vapor());   
									
				double pr = heats.calPr(cp_in, vis_in, thcon);
				
				double in_coeff = heats.calIFC(thcon, din, dout, re, pr);
				
				k.setIn_coeff(String.valueOf((int)(in_coeff * 100)/ 100.0));
				
				double em = change(k.getEm());
				double cnv = change(k.getConvection());
				double wind_vel = change(k.getWind_vel()) /0.44704;
				double depth = change(k.getDepth());
				
				
				if (k.getEv().equals("bare")) {
					
					// british => SI
					heats.calTs(temp, temp_air, thcon, din, dout, re, pr, cnv, wind_vel, em);
					
					k.setSur_temp(String.valueOf((int)((heats.getSur_temp() - 32) * 5 / 9 * 100) / 100.0));
					k.setOut_coeff(String.valueOf((int)(heats.getOut_coeff() * 4.882431 * 100) / 100.0));
					k.setOut_coeff_1(String.valueOf((int)(heats.getOut_coeff1() * 4.882431 * 100) / 100.0));
					k.setOut_coeff_2(String.valueOf((int)(heats.getOut_coeff2() * 4.882431 * 100) / 100.0));
					
					k.setG_temp("");
					k.setDiff_temp("");					
					
				} else {
					
					String season = k.getSeason();
				
					double diff_temp = heats.calDiff_temp(season, depth);
					
					k.setDiff_temp(String.valueOf((int)((diff_temp - 32) * 5 / 9 * 100) / 100.0));
					
					if(temp_air > temp) {
						g_temp = temp_air - diff_temp;
					}else {
						g_temp = temp_air + diff_temp;
					}
					
					k.setG_temp(String.valueOf((int)((g_temp - 32) * 5 / 9 * 100) / 100.0));
					
					k.setSur_temp("");
					k.setOut_coeff("");
					k.setOut_coeff_1("");
					k.setOut_coeff_2("");							
				}
				
				String ev = k.getEv();
				double out_coeff = heats.getOut_coeff();
				double temp_sur = heats.getSur_temp();
				double over_coeff = heats.calOVC(ev, d_insul, din, dout, dsoil, pipe_con, insul_con, ksoil, in_coeff, out_coeff);
				double heat_trans = heats.calHeattrans(ev, over_coeff, din, dout, eqv_len, temp_sur, g_temp, temp_air, temp_sur);
				double out_temp = temp - heat_trans / (flow / 0.45359) / cp_in; 
				
				k.setOver_coeff(String.valueOf((int)(over_coeff * 4.882431 * 100) / 100.0));
				k.setHeattrans(String.valueOf((int)(heat_trans / 3.96567 * 100) / 100.0));	
				k.setOut_temp(String.valueOf((int)((out_temp - 32) * 5 / 9 * 100) / 100.0));
				
			} catch (Exception e) {
				String finish ="ok"; 
				String msg = "데이터를 잘못 입력하셨습니다.";
				mv.addObject("finish", finish);
				
				mv.addObject("finish", finish);
				mv.addObject("msg", msg);
			}

		}
		
		request.setAttribute("cal", cal);
		request.getSession().setAttribute("list", list);
		
		mv.setViewName("view_user/4.calculator");
		return mv;
	}	
	
	public void getPipedata(HttpServletRequest request, HVO2 hvo2){
		
		hvo2.setLineno(request.getParameter("lineno".concat(hvo2.getIdx())));
		hvo2.setPhase(request.getParameter("phase".concat(hvo2.getIdx())));
		hvo2.setEv(request.getParameter("ev".concat(hvo2.getIdx())));
		hvo2.setOver(request.getParameter("over".concat(hvo2.getIdx())));
		hvo2.setStype(request.getParameter("stype".concat(hvo2.getIdx())));
		hvo2.setTemp_air(request.getParameter("temp_air".concat(hvo2.getIdx())));
		hvo2.setTemp_liq(request.getParameter("temp_liq".concat(hvo2.getIdx())));
		hvo2.setTemp_vapor(request.getParameter("temp_vapor".concat(hvo2.getIdx())));
		hvo2.setFlow(request.getParameter("flow".concat(hvo2.getIdx())));
		hvo2.setEm(pipespec.getPipe_em().get(hvo2.getStype()));
		hvo2.setWind_vel(request.getParameter("wind_vel".concat(hvo2.getIdx())));
		
		hvo2.setDen_liq(request.getParameter("den_liq".concat(hvo2.getIdx())));
		hvo2.setDen_vapor(request.getParameter("den_vapor".concat(hvo2.getIdx())));
		//hvo2.setVapor_fr(request.getParameter("vapor_fr".concat(hvo2.getIdx())));
		hvo2.setSeason(request.getParameter("season".concat(hvo2.getIdx())));
		
		hvo2.setVis_liq(request.getParameter("vis_liq".concat(hvo2.getIdx())));
		hvo2.setVis_vapor(request.getParameter("vis_vapor".concat(hvo2.getIdx())));
		//hvo2.setFlow_liq(request.getParameter("flow_liq".concat(hvo2.getIdx())));
		hvo2.setCondition(request.getParameter("condition".concat(hvo2.getIdx())));
		hvo2.setDepth(request.getParameter("depth".concat(hvo2.getIdx())));
		
		hvo2.setHeat_liq(request.getParameter("heat_liq".concat(hvo2.getIdx())));
		hvo2.setHeat_vapor(request.getParameter("heat_vapor".concat(hvo2.getIdx())));
		//hvo2.setFlow_vapor(request.getParameter("flow_vapor".concat(hvo2.getIdx())));
		hvo2.setConvection(pipespec.getPipe_shp().get(hvo2.getCondition()));
		hvo2.setSoil(request.getParameter("soil".concat(hvo2.getIdx())));
		
		hvo2.setThcon_liq(request.getParameter("thcon_liq".concat(hvo2.getIdx())));
		hvo2.setThcon_vapor(request.getParameter("thcon_vapor".concat(hvo2.getIdx())));
		hvo2.setHeat_dia(request.getParameter("heat_dia".concat(hvo2.getIdx())));
		
		hvo2.setCfactor(request.getParameter("cfactor".concat(hvo2.getIdx())));
		hvo2.setRe(request.getParameter("re".concat(hvo2.getIdx())));
		hvo2.setWall(request.getParameter("wall".concat(hvo2.getIdx())));
		hvo2.setDlist(pipespec.getSize());
		hvo2.setDia(request.getParameter("dia".concat(hvo2.getIdx())));
		hvo2.setSlist(pipespec.getSchedule());
		hvo2.setSch(request.getParameter("sch".concat(hvo2.getIdx())));
		
		dialist = pipespec.getDialist(hvo2.getDia());
		select_sch = pipespec.getSch().get(hvo2.getSch());
		hvo2.setDin(String.valueOf(dialist[select_sch]));
		hvo2.setDout(String.valueOf(dialist[17]));
	
		hvo2.setPipelen(request.getParameter("pipelen".concat(hvo2.getIdx())));
		
		hvo2.setPipe_mtl(request.getParameter("pipe_mtl".concat(hvo2.getIdx())));
		hvo2.setPipe_con(request.getParameter("pipe_con".concat(hvo2.getIdx())));
		
		hvo2.setPipe_thick(String.valueOf((change(hvo2.getDout())-change(hvo2.getDin()))/2));
		hvo2.setInsul_mtl(request.getParameter("insul_mtl".concat(hvo2.getIdx())));
		hvo2.setInsul_con(request.getParameter("insul_con".concat(hvo2.getIdx())));
		hvo2.setInsul_thick(request.getParameter("insul_thick".concat(hvo2.getIdx())));
		
		hvo2.setEql_len(request.getParameter("eql_len".concat(hvo2.getIdx())));
		
		//fitting
		hvo2.setElbow90_1(request.getParameter("elbow90_1".concat(hvo2.getIdx())));
		hvo2.setElbow90_2(request.getParameter("elbow90_2".concat(hvo2.getIdx())));
		hvo2.setElbow90_3(request.getParameter("elbow90_3".concat(hvo2.getIdx())));
		hvo2.setElbow90_4(request.getParameter("elbow90_4".concat(hvo2.getIdx())));
		hvo2.setElbow90_5(request.getParameter("elbow90_5".concat(hvo2.getIdx())));
		hvo2.setElbow90_6(request.getParameter("elbow90_6".concat(hvo2.getIdx())));
		hvo2.setElbow90_7(request.getParameter("elbow90_7".concat(hvo2.getIdx())));
		hvo2.setElbow90_8(request.getParameter("elbow90_8".concat(hvo2.getIdx())));
		hvo2.setElbow90_9(request.getParameter("elbow90_9".concat(hvo2.getIdx())));
		
		hvo2.setElbow45_1(request.getParameter("elbow45_1".concat(hvo2.getIdx())));
		hvo2.setElbow45_2(request.getParameter("elbow45_2".concat(hvo2.getIdx())));
		hvo2.setElbow45_3(request.getParameter("elbow45_3".concat(hvo2.getIdx())));
		hvo2.setElbow45_4(request.getParameter("elbow45_4".concat(hvo2.getIdx())));
		
		hvo2.setBend_1(request.getParameter("bend_1".concat(hvo2.getIdx())));
		hvo2.setBend_2(request.getParameter("bend_2".concat(hvo2.getIdx())));
		hvo2.setBend_3(request.getParameter("bend_3".concat(hvo2.getIdx())));
		
		hvo2.setTee_1(request.getParameter("tee_1".concat(hvo2.getIdx())));
		hvo2.setTee_2(request.getParameter("tee_2".concat(hvo2.getIdx())));
		hvo2.setTee_3(request.getParameter("tee_3".concat(hvo2.getIdx())));
		hvo2.setTee_4(request.getParameter("tee_4".concat(hvo2.getIdx())));
		hvo2.setTee_5(request.getParameter("tee_5".concat(hvo2.getIdx())));
		hvo2.setTee_6(request.getParameter("tee_6".concat(hvo2.getIdx())));
		hvo2.setTee_7(request.getParameter("tee_7".concat(hvo2.getIdx())));
		
		hvo2.setGtvalve(request.getParameter("gtvalve".concat(hvo2.getIdx())));
		hvo2.setBvalve(request.getParameter("bvalve".concat(hvo2.getIdx())));
		hvo2.setGbvalve(request.getParameter("gbvalve".concat(hvo2.getIdx())));
		hvo2.setDvalve(request.getParameter("dvalve".concat(hvo2.getIdx())));
		hvo2.setAvalve_1(request.getParameter("avalve_1".concat(hvo2.getIdx())));
		hvo2.setAvalve_2(request.getParameter("avalve_2".concat(hvo2.getIdx())));
		hvo2.setCvalve_1(request.getParameter("cvalve_1".concat(hvo2.getIdx())));
		hvo2.setCvalve_2(request.getParameter("cvalve_2".concat(hvo2.getIdx())));
		hvo2.setPvalve_1(request.getParameter("pvalve_1".concat(hvo2.getIdx())));
		hvo2.setPvalve_2(request.getParameter("pvalve_2".concat(hvo2.getIdx())));
		hvo2.setPvalve_3(request.getParameter("pvalve_3".concat(hvo2.getIdx())));
		
		hvo2.setRedd(request.getParameter("redd".concat(hvo2.getIdx())));
		hvo2.setRedth(request.getParameter("redth".concat(hvo2.getIdx())));
		
		hvo2.setExpd(request.getParameter("expd".concat(hvo2.getIdx())));
		hvo2.setExpth(request.getParameter("expth".concat(hvo2.getIdx())));		
		
		hvo2.setIn_coeff(request.getParameter("in_coeff".concat(hvo2.getIdx())));
		hvo2.setG_temp(request.getParameter("g_temp".concat(hvo2.getIdx())));
		hvo2.setOut_coeff(request.getParameter("out_coeff".concat(hvo2.getIdx())));
		hvo2.setOut_temp(request.getParameter("out_temp".concat(hvo2.getIdx())));
		hvo2.setOut_coeff_1(request.getParameter("out_coeff_1".concat(hvo2.getIdx())));
		hvo2.setSur_temp(request.getParameter("sur_temp".concat(hvo2.getIdx())));
		hvo2.setOut_coeff_2(request.getParameter("out_coeff_2".concat(hvo2.getIdx())));
		hvo2.setDiff_temp(request.getParameter("diff_temp".concat(hvo2.getIdx())));
		hvo2.setOver_coeff(request.getParameter("over_coeff".concat(hvo2.getIdx())));
		hvo2.setHeattrans(request.getParameter("heattrans".concat(hvo2.getIdx())));		
	}
	
	
	public void savePipedata(HVO2 hvo2, HVO2[] b_list, int i) {
		hvo2.setLineno(b_list[i].getLineno());
		hvo2.setPhase(b_list[i].getPhase());
		hvo2.setEv(b_list[i].getEv());
		hvo2.setOver(b_list[i].getOver());
		hvo2.setStype(b_list[i].getStype());
		hvo2.setTemp_air(b_list[i].getTemp_air());
		hvo2.setTemp_liq(b_list[i].getTemp_liq());
		hvo2.setTemp_vapor(b_list[i].getTemp_vapor());
		hvo2.setFlow(b_list[i].getFlow());
		hvo2.setEm(b_list[i].getEm());
		hvo2.setWind_vel(b_list[i].getWind_vel());
		
		hvo2.setDen_liq(b_list[i].getDen_liq());
		hvo2.setDen_vapor(b_list[i].getDen_vapor());
		//hvo2.setVapor_fr(b_list[i].getVapor_fr());
		hvo2.setSeason(b_list[i].getSeason());
		
		hvo2.setVis_liq(b_list[i].getVis_liq());
		hvo2.setVis_vapor(b_list[i].getVis_vapor());
		//hvo2.setFlow_liq(b_list[i].getFlow_liq());
		hvo2.setCondition(b_list[i].getCondition());
		hvo2.setDepth(b_list[i].getDepth());
		
		hvo2.setHeat_liq(b_list[i].getHeat_liq());
		hvo2.setHeat_vapor(b_list[i].getHeat_vapor());
		//hvo2.setFlow_vapor(b_list[i].getFlow());
		hvo2.setConvection(b_list[i].getConvection());
		hvo2.setSoil(b_list[i].getSoil());
		
		hvo2.setThcon_liq(b_list[i].getThcon_liq());
		hvo2.setThcon_vapor(b_list[i].getThcon_vapor());
		hvo2.setHeat_dia(b_list[i].getHeat_dia());
		
		hvo2.setCfactor(b_list[i].getCfactor());
		hvo2.setRe(b_list[i].getRe());
		hvo2.setWall(b_list[i].getWall());
		hvo2.setDin(b_list[i].getDin());
		hvo2.setDlist(pipespec.getSize());
		hvo2.setDia(b_list[i].getDia());
		hvo2.setDout(b_list[i].getDout());
		
		
		hvo2.setSch(b_list[i].getSch());
		hvo2.setSlist(pipespec.getSchedule());
		hvo2.setPipelen(b_list[i].getPipelen());
		
		hvo2.setPipe_mtl(b_list[i].getPipe_mtl());
		hvo2.setPipe_thick(b_list[i].getPipe_thick());
		hvo2.setPipe_con(b_list[i].getPipe_con());
		hvo2.setInsul_mtl(b_list[i].getInsul_mtl());
		hvo2.setInsul_con(b_list[i].getInsul_con());
		hvo2.setInsul_thick(b_list[i].getInsul_thick());
		
		hvo2.setEql_len(b_list[i].getEql_len());
		
		//fitting
		hvo2.setElbow90_1(b_list[i].getElbow90_1());
		hvo2.setElbow90_2(b_list[i].getElbow90_2());
		hvo2.setElbow90_3(b_list[i].getElbow90_3());
		hvo2.setElbow90_4(b_list[i].getElbow90_4());
		hvo2.setElbow90_5(b_list[i].getElbow90_5());
		hvo2.setElbow90_6(b_list[i].getElbow90_6());
		hvo2.setElbow90_7(b_list[i].getElbow90_7());
		hvo2.setElbow90_8(b_list[i].getElbow90_8());
		hvo2.setElbow90_9(b_list[i].getElbow90_9());
		
		hvo2.setElbow45_1(b_list[i].getElbow45_1());
		hvo2.setElbow45_2(b_list[i].getElbow45_2());
		hvo2.setElbow45_3(b_list[i].getElbow45_3());
		hvo2.setElbow45_4(b_list[i].getElbow45_4());
		
		hvo2.setBend_1(b_list[i].getBend_1());
		hvo2.setBend_2(b_list[i].getBend_2());
		hvo2.setBend_3(b_list[i].getBend_3());
		
		hvo2.setTee_1(b_list[i].getTee_1());
		hvo2.setTee_2(b_list[i].getTee_2());
		hvo2.setTee_3(b_list[i].getTee_3());
		hvo2.setTee_4(b_list[i].getTee_4());
		hvo2.setTee_5(b_list[i].getTee_5());
		hvo2.setTee_6(b_list[i].getTee_6());
		hvo2.setTee_7(b_list[i].getTee_7());
		
		hvo2.setGtvalve(b_list[i].getGtvalve());
		hvo2.setBvalve(b_list[i].getBvalve());
		hvo2.setGbvalve(b_list[i].getGbvalve());
		hvo2.setDvalve(b_list[i].getDvalve());
		hvo2.setAvalve_1(b_list[i].getAvalve_1());
		hvo2.setAvalve_2(b_list[i].getAvalve_2());
		hvo2.setCvalve_1(b_list[i].getCvalve_1());
		hvo2.setCvalve_2(b_list[i].getCvalve_2());
		hvo2.setPvalve_1(b_list[i].getPvalve_1());
		hvo2.setPvalve_2(b_list[i].getPvalve_2());
		hvo2.setPvalve_3(b_list[i].getPvalve_3());
		
		hvo2.setRedd(b_list[i].getRedd());
		hvo2.setRedth(b_list[i].getRedth());
		
		hvo2.setExpd(b_list[i].getExpd());
		hvo2.setExpth(b_list[i].getExpth());
		
		
		hvo2.setSoil_coeff(b_list[i].getSoil_coeff());
		hvo2.setIn_coeff(b_list[i].getIn_coeff());
		hvo2.setG_temp(b_list[i].getG_temp());
		hvo2.setOut_coeff(b_list[i].getOut_coeff());
		hvo2.setOut_temp(b_list[i].getOut_temp());
		hvo2.setOut_coeff_1(b_list[i].getOut_coeff_1());
		hvo2.setSur_temp(b_list[i].getSur_temp());
		hvo2.setOut_coeff_2(b_list[i].getOut_coeff_2());
		hvo2.setDiff_temp(b_list[i].getDiff_temp());
		hvo2.setOver_coeff(b_list[i].getOver_coeff());
		hvo2.setHeattrans(b_list[i].getHeattrans());		
	}
	
	// 2.Tank 
	
	@RequestMapping(value="tankheat_cal.do", method=RequestMethod.POST)
	public ModelAndView tankheat_cal_Cmd(HttpServletRequest request, TVO tvo) {
		ModelAndView mv = new ModelAndView();
		String cal = request.getParameter("cal");
		
		getTankdata(request, tvo);
				
		//계산하기
		//1. 변수명 짓기 및 데이터 가공 
		//온도
		double temp_liq = change(tvo.getTemp_liq()) * 9/5 + 32;   
		double temp_vap = change(tvo.getTemp_vap()) * 9/5 + 32;   
		double temp_air = change(tvo.getTemp_air()) * 9/5 + 32;   
		
		double thm_liq = change(tvo.getThm_liq())/1.488164;
		double thm_vap = change(tvo.getThm_vap())/1.488164;   
		double thm_air = change(tvo.getThm_air())/1.488164; 
		
		double spheat_liq = change(tvo.getSpheat_liq());
		double spheat_vap = change(tvo.getSpheat_vap());
		double spheat_air = change(tvo.getSpheat_air());
		
		double vis_liq = change(tvo.getVis_liq());
		double vis_vap = change(tvo.getVis_vap());
		double vis_air = change(tvo.getVis_air());
		
		double den_liq = change(tvo.getDen_liq())*Math.pow(0.3048, 3)/0.4536;
		double den_vap = change(tvo.getDen_vap())*Math.pow(0.3048, 3)/0.4536;
		double den_air = change(tvo.getDen_air())*Math.pow(0.3048, 3)/0.4536;
		
		double ceff_liq = change(tvo.getCeff_liq())/1.8;
		double ceff_vap = change(tvo.getCeff_vap())/1.8;
		double ceff_air = change(tvo.getCeff_air())/1.8;
		
		double vel_wind = change(tvo.getVel_wind())/0.44704;
		double em = change(tvo.getEm2());
		double temp_gr = change(tvo.getTemp_gr()) * 9/5 + 32;
		double con_gr = change(tvo.getCon_gr()) / 1.488164;
		
		double fcoeff_drywall = change(tvo.getFcoeff_drywall()) * 4.882431;
		double fcoeff_wetwall = change(tvo.getFcoeff_wetwall()) * 4.882431;
		double fcoeff_roof = change(tvo.getFcoeff_roof()) * 4.882431;
		double fcoeff_bottom = change(tvo.getFcoeff_bottom()) * 4.882431;
		
		double tdia = change(tvo.getTdia())/0.3048;
		double tlen = change(tvo.getTlen())/0.3048;
		double wtlen = change(tvo.getWtlen())/0.3048;
		double troof = change(tvo.getTroof())/0.3048;
		
		double thick_body =change(tvo.getThick_body())/25.4;
		double thick_sinsul = change(tvo.getThick_sinsul())/25.4;
		double thick_rinsul = change(tvo.getThick_rinsul())/25.4;
		double thick_binsul = change(tvo.getThick_binsul())/25.4;
		
		double thcon_body =change(tvo.getThcon_body())/1.488164;
		double thcon_sinsul = change(tvo.getThcon_sinsul())/1.488164;
		double thcon_rinsul = change(tvo.getThcon_rinsul())/1.488164;
		double thcon_binsul = change(tvo.getThcon_binsul())/1.488164;
		
		String body = tvo.getBtype();
		String head = tvo.getHtype();
		String ltype = tvo.getLtype();
		String htype = tvo.getHtype();
		
		//2. 계산하기
		try {
			//면적
			double area_dry = heats.calArea1(body, head, "dry", tdia, tlen, wtlen) ;
			double area_wet = heats.calArea1(body, head, "wet", tdia, tlen, wtlen) ;
			double area_roof = heats.calArea2(tdia, troof);
			double area_btm = heats.calArea3(tdia);
			
			tvo.setArea_dry(String.valueOf(area_dry));
			tvo.setArea_wet(String.valueOf(area_wet));
			tvo.setArea_roof(String.valueOf(htype.equals("roof") ? area_roof : ""));
			tvo.setArea_btm(String.valueOf(ltype.equals("no") ? area_btm : ""));
			
			double coeff_body = heats.calCoeff_tank(thcon_body, thick_body);
			double coeff_sinsul = heats.calCoeff_tank(thcon_sinsul, thick_sinsul);
			double coeff_rinsul = heats.calCoeff_tank(thcon_rinsul, thick_rinsul);
			double coeff_binsul = heats.calCoeff_tank(thcon_binsul, thick_binsul);
			
			//온도 및 총괄 열전달 계수
			
			heats.calResult_1(tlen, wtlen, coeff_body, coeff_sinsul, fcoeff_drywall, fcoeff_wetwall,
							temp_vap, vis_vap, den_vap, ceff_vap, spheat_vap, thm_vap, 
						    temp_air, vis_air, den_air, ceff_air, spheat_air, thm_air, 
						    temp_liq, vis_liq, den_liq, ceff_liq, spheat_liq, thm_liq, 
						    em, vel_wind);
			
			heats.calResult_2(tdia, coeff_body, coeff_rinsul, fcoeff_roof, 
						    temp_vap, vis_vap, den_vap, ceff_vap, spheat_vap, thm_vap, 
						    temp_air, vis_air, den_air, ceff_air, spheat_air, thm_air, 
						    temp_liq, vis_liq, den_liq, ceff_liq, spheat_liq, thm_liq, 
						    em, vel_wind);
					
			heats.calResult_3(tdia, coeff_body, coeff_binsul, fcoeff_bottom, temp_air, 
						    temp_liq, vis_liq, den_liq, ceff_liq, spheat_liq, thm_liq, temp_gr, con_gr);
			
			double temp_dry = heats.getTemp_dry();
			double temp_wet = heats.getTemp_wet();
			double temp_roof = heats.getTemp_roof();
			double temp_btm = heats.getTemp_btm();
			
			double ocf_dry = heats.getOcf_dry();
			double ocf_wet = heats.getOcf_wet();
			double ocf_roof = heats.getOcf_roof();
			double ocf_btm = heats.getOcf_btm();

			tvo.setTemp_dry(String.valueOf(((int)(100 * temp_dry))/100.0));
			tvo.setTemp_wet(String.valueOf(((int)(100 * temp_wet))/100.0));
			tvo.setTemp_roof(String.valueOf(htype.equals("roof") ? ((int)(100 * temp_roof))/100.0 : ""));
			tvo.setTemp_btm(String.valueOf(ltype.equals("no") ? ((int)(100 * temp_btm))/100.0 : ""));
			
			tvo.setOcf_dry(String.valueOf(((int)(10000 * ocf_dry))/10000.0));
			tvo.setOcf_wet(String.valueOf(((int)(10000 * ocf_wet))/10000.0));
			tvo.setOcf_roof(String.valueOf(htype.equals("roof") ? ((int)(10000 * ocf_roof))/10000.0 : ""));
			tvo.setOcf_btm(String.valueOf(ltype.equals("no") ? ((int)(10000 * ocf_btm))/10000.0 : ""));
			
			// 열량
			
			temp_liq = change(tvo.getTemp_liq());
			temp_vap = change(tvo.getTemp_vap());
			temp_air = change(tvo.getTemp_air());  
			temp_gr = change(tvo.getTemp_gr());
			
			double heat_dry = ((int)(100 * area_dry * ocf_dry * (temp_vap - temp_air)))/100.0;
			double heat_wet = ((int)(100 * area_wet * ocf_wet * (temp_liq - temp_air)))/100.0;
			double heat_roof = ((int)(100 * area_roof * ocf_roof * (temp_vap - temp_air)))/100.0;
			double heat_btm = ((int)(100 * area_btm * ocf_btm * (temp_liq - temp_gr)))/100.0;
			
			tvo.setHeat_dry(String.valueOf(heat_dry));
			tvo.setHeat_wet(String.valueOf(heat_wet));
			tvo.setHeat_roof(String.valueOf(heat_roof));
			tvo.setHeat_btm(String.valueOf(heat_btm));
			 
			// 총열량
			double heat_total = ((int)(heat_dry + heat_wet + heat_roof + heat_btm)*100)/100.0;
			tvo.setHeat_total(String.valueOf(heat_total));
			
		} catch (Exception e) {
			
		}
		
		request.setAttribute("cal", cal);
		request.getSession().setAttribute("tvo", tvo);
		
		mv.setViewName("view_user/4.calculator");
		
		return mv;
	}
	
	@RequestMapping(value="tankheat_rev.do", method=RequestMethod.POST)
	public ModelAndView tankheat_rev_Cmd(HttpServletRequest request, TVO tvo) {
		ModelAndView mv = new ModelAndView();
		String cal = request.getParameter("cal");
		tvo = (TVO)request.getSession().getAttribute("tvo");
		
		getTankdata(request, tvo);
		
		request.setAttribute("cal", cal);
		request.getSession().setAttribute("tvo", tvo);
		
		mv.setViewName("view_user/4.calculator");
		
		return mv;
	}
	
	
	//3. option
	
	public double change(String sth) {
		double num = 0;
		try {
			if(sth == null || sth.equals(null)) {
				num = 0;
			}else {
				num = Double.parseDouble(sth);
			}
		} catch (Exception e) {
			num = 0;
		}

		
		return num;
	}
	
	
	public void getTankdata(HttpServletRequest request, TVO tvo) {
		
		tvo.setItemno(request.getParameter("itemno"));
		tvo.setVel_wind(request.getParameter("vel_wind"));
		tvo.setStype(request.getParameter("stype"));
		tvo.setEm1(heats.getEm_map().get(tvo.getStype()));
		tvo.setEm2(request.getParameter("em2"));
		tvo.setTemp_gr(request.getParameter("temp_gr"));
		tvo.setCon_gr(request.getParameter("con_gr"));
		tvo.setTtype(request.getParameter("ttype"));
		tvo.setTdia(request.getParameter("tdia"));
		tvo.setBtype(request.getParameter("btype"));
		tvo.setTlen(request.getParameter("tlen"));
		tvo.setHtype(request.getParameter("htype"));
		tvo.setWtlen(request.getParameter("wtlen"));
		tvo.setLtype(request.getParameter("ltype"));
		tvo.setTroof(request.getParameter("troof"));
		
		tvo.setMtl_body(request.getParameter("mtl_body"));
		tvo.setMtl_sinsul(request.getParameter("mtl_sinsul"));
		tvo.setMtl_rinsul(request.getParameter("mtl_rinsul"));
		tvo.setMtl_binsul(request.getParameter("mtl_binsul"));
		
		tvo.setThick_body(request.getParameter("thick_body"));
		tvo.setThick_sinsul(request.getParameter("thick_sinsul"));
		tvo.setThick_rinsul(request.getParameter("thick_rinsul"));
		tvo.setThick_binsul(request.getParameter("thick_binsul"));
		
		tvo.setThcon_body(request.getParameter("thcon_body"));
		tvo.setThcon_sinsul(request.getParameter("thcon_sinsul"));
		tvo.setThcon_rinsul(request.getParameter("thcon_rinsul"));
		tvo.setThcon_binsul(request.getParameter("thcon_binsul"));
		
		tvo.setFcoeff_drywall(request.getParameter("fcoeff_drywall"));
		tvo.setFcoeff_wetwall(request.getParameter("fcoeff_wetwall"));
		tvo.setFcoeff_roof(request.getParameter("fcoeff_roof"));
		tvo.setFcoeff_bottom(request.getParameter("fcoeff_bottom"));
		
		tvo.setTemp_liq(request.getParameter("temp_liq"));
		tvo.setTemp_vap(request.getParameter("temp_vap"));
		tvo.setTemp_air(request.getParameter("temp_air"));
		
		tvo.setThm_liq(request.getParameter("thm_liq"));
		tvo.setThm_vap(request.getParameter("thm_vap"));
		tvo.setThm_air(request.getParameter("thm_air"));
		
		tvo.setSpheat_liq(request.getParameter("spheat_liq"));
		tvo.setSpheat_vap(request.getParameter("spheat_vap"));
		tvo.setSpheat_air(request.getParameter("spheat_air"));
		
		tvo.setVis_liq(request.getParameter("vis_liq"));
		tvo.setVis_vap(request.getParameter("vis_vap"));
		tvo.setVis_air(request.getParameter("vis_air"));
		
		tvo.setDen_liq(request.getParameter("den_liq"));
		tvo.setDen_vap(request.getParameter("den_vap"));
		tvo.setDen_air(request.getParameter("den_air"));
		
		tvo.setCeff_liq(request.getParameter("ceff_liq"));
		tvo.setCeff_vap(request.getParameter("ceff_vap"));
		tvo.setCeff_air(request.getParameter("ceff_air"));		
		
	}

}
