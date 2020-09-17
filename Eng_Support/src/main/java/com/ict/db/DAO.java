package com.ict.db;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.ict.model.Paging;

public class DAO {
	private SqlSessionTemplate sqlSessionTemplate;
	
	public DAO() {}

	public DAO(SqlSessionTemplate sqlSessionTemplate) {
		super();
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	
	public int getMcount() {
		int count = sqlSessionTemplate.selectOne("mcount");
 		return count;
	}
		
	// member_admin 
	public List<MVO> getmlist(Paging paging) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", paging.getBegin());
		map.put("end", paging.getEnd());
		
		List<MVO> mlist = sqlSessionTemplate.selectList("mlist", map);
		
		return mlist;
	}

	
	public MVO getMonelist(String idx) {
		MVO mvo = sqlSessionTemplate.selectOne("monelist", idx);
		return mvo;
	}
	
	// login
	
	public MVO getMember(String m_id) {
		MVO mvo = sqlSessionTemplate.selectOne("onelist_m", m_id);
		return mvo;
	}
	
	// 회원가입
	public int getmIDU(MVO mvo, String mth) {
		int result = 0;
		
		switch (mth) {
			case "Insert": result = sqlSessionTemplate.insert("pinsert", mvo); break;
			case "Update": result = sqlSessionTemplate.update("pupdate", mvo); break;
			case "Delete": result = sqlSessionTemplate.delete("pdelete", mvo); break;
		}
	
		return result;
	}
	
	
	
	//Petroleum
	
	public List<VO2> getPlist(){
		List<VO2> list = sqlSessionTemplate.selectList("plist_u");
		return list;
	}
	
	public List<VO2> getPlist(Paging paging){
		List<VO2> list = null;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", paging.getBegin());
		map.put("end", paging.getEnd());
		
		list = sqlSessionTemplate.selectList("plist_a", map);
		
		return list;
	}
	
	public int getPcount() {
		int count = sqlSessionTemplate.selectOne("pcount");
 		return count;
	}
	
	public VO2 getPonelist(String unit) {	
		VO2 vo2 = sqlSessionTemplate.selectOne("onelist_u",unit);
		return vo2;
	}
	
	public VO2 getPonelist2(String idx) {
		VO2 vo2 = sqlSessionTemplate.selectOne("onelist_a", idx);
		return vo2;
	}

	public int getpIDU(VO2 vo2, String mth) {
		int result = 0;
		
		switch (mth) {
			case "Insert": result = sqlSessionTemplate.insert("pinsert", vo2); break;
			case "Update": result = sqlSessionTemplate.update("pupdate", vo2); break;
			case "Delete": result = sqlSessionTemplate.delete("pdelete", vo2); break;
		}
	
		return result;
	}
	

	
}


















