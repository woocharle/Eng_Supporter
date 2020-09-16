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

	
	// member_admin 
	public List<MVO> getmlist() {
		List<MVO> mlist = sqlSessionTemplate.selectList("mlist");
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

	public int getIDU(VO2 vo2, String mth) {
		int result = 0;
		
		switch (mth) {
			case "Insert": result = sqlSessionTemplate.insert("pinsert", vo2); break;
			case "Update": result = sqlSessionTemplate.insert("pupdate", vo2); break;
			case "Delete": result = sqlSessionTemplate.insert("pdelete", vo2); break;
		}
	
		return result;
	}
	

	
}


















