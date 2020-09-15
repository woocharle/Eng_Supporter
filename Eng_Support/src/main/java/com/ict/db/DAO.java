package com.ict.db;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

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
	
	public List<VO2> getlist(){
		List<VO2> list = sqlSessionTemplate.selectList("plist");
		
		return list;
	}
	
	public VO2 getOnelist(String unit) {	
		VO2 pvo = sqlSessionTemplate.selectOne("onelist_u",unit);
		
		return pvo;
	}
	
	public VO2 getOnelist2(String idx) {
		VO2 pvo = sqlSessionTemplate.selectOne("onelist_i", idx);
		
		return pvo;
	}
	

	
}


















