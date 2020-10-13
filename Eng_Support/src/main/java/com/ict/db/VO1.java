package com.ict.db;

public class VO1 {
	private String idx, m_name, m_com, m_phone, m_email, m_id, m_pw, m_content, req_del, req_find;
	
	public VO1() {}

	public VO1(String idx, String m_name, String m_com, String m_phone, String m_email, String m_id, String m_pw,
			String m_content, String req_del, String req_find) {
		super();
		this.idx = idx;
		this.m_name = m_name;
		this.m_com = m_com;
		this.m_phone = m_phone;
		this.m_email = m_email;
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_content = m_content;
		this.req_del = req_del;
		this.req_find = req_find;
	}


	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_com() {
		return m_com;
	}

	public void setM_com(String m_com) {
		this.m_com = m_com;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_id() {
		return m_id;
	}

	public String getReq_del() {
		return req_del;
	}

	public void setReq_del(String req_del) {
		this.req_del = req_del;
	}

	public String getReq_find() {
		return req_find;
	}

	public void setReq_find(String req_find) {
		this.req_find = req_find;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_content() {
		return m_content;
	}

	public void setM_content(String m_content) {
		this.m_content = m_content;
	}
	
	
	
}
