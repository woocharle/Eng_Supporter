package com.ict.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class DAO {
	private static SqlSession ss;
	
	private synchronized static SqlSession getSession() {
		if (ss == null) {
			ss = DBService.getFactory().openSession(false);
			
		}
		return ss;
	}
	
	public static List<VO2> getPlist(){
		List<VO2> list = null;
		list = getSession().selectList("plist");
		return list;
	}
	
	public static VO2 getOnepick(String idx) {
		VO2 vo = null;
		
		//vo = getSession().selectOne("mapper의 id");
		//vo= getSession().selectOne("mapper의 id", "파라미터");	
		
		vo = getSession().selectOne("onepick", idx);
		
		return vo;
	}
	
}
