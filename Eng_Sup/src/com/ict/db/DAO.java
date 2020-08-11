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
	
	public static List<VO2> getList(){
		List<VO2> list = null;
		list = getSession().selectList("plist");
		return list;
	}
	
}
