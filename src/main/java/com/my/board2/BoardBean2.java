package com.my.board2;

import org.springframework.stereotype.Repository;

@Repository
public class BoardBean2 {
	int qid;
	int mid;
	String qna_subject;
	String qna_contents;	
	int qna_hits;
	String qna_delyn;
	String qna_created;
	String member_id;
	
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getQna_subject() {
		return qna_subject;
	}
	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}
	public String getQna_contents() {
		return qna_contents;
	}
	public void setQna_contents(String qna_contents) {
		this.qna_contents = qna_contents;
	}
	public int getQna_hits() {
		return qna_hits;
	}
	public void setQna_hits(int qna_hits) {
		this.qna_hits = qna_hits;
	}
	public String getQna_delyn() {
		return qna_delyn;
	}
	public void setQna_delyn(String qna_delyn) {
		this.qna_delyn = qna_delyn;
	}
	public String getQna_created() {
		return qna_created;
	}
	public void setQna_created(String qna_created) {
		this.qna_created = qna_created;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}
