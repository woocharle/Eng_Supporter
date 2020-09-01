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
	
	//Petroleum
	
	public List<VO2> getlist(){
		List<VO2> list = sqlSessionTemplate.selectList("plist");
		
		return list;
	}
	
	public VO2 getOnelist(String unit) {	
		VO2 pvo = sqlSessionTemplate.selectOne("onelist_u",unit);
		
		return pvo;
	}

	
}
