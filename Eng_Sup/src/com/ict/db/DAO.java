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
		
		//vo = getSession().selectOne("mapper�쓽 id");
		//vo= getSession().selectOne("mapper�쓽 id", "�뙆�씪誘명꽣");	
		
		vo = getSession().selectOne("onepick", idx);
		
		return vo;
	}
	
	public static int getIDU(VO2 pvo, String mth) {
		int result = 0;
		
		switch (mth) {
			case "Insert": result = getSession().insert("pinsert", pvo); break;
			case "Update": result = getSession().update("pupdate", pvo); break;
			case "Delete": result = getSession().delete("pdelete", pvo); break;
			
		}
		
		return result;
		
	}
	
}
