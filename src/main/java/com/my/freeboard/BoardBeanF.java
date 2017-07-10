package com.my.freeboard;

import org.springframework.stereotype.Repository;

@Repository
public class BoardBeanF {
	int fbid;
	int mid;
	String free_subject;
	String free_contents;	
	int free_hits;
	String free_delyn;
	String free_created;
	String member_id;
	
	public int getFbid() {
		return fbid;
	}
	public void setFbid(int fbid) {
		this.fbid = fbid;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getFree_subject() {
		return free_subject;
	}
	public void setFree_subject(String free_subject) {
		this.free_subject = free_subject;
	}
	public String getFree_contents() {
		return free_contents;
	}
	public void setFree_contents(String free_contents) {
		this.free_contents = free_contents;
	}
	public int getFree_hits() {
		return free_hits;
	}
	public void setFree_hits(int free_hits) {
		this.free_hits = free_hits;
	}
	public String getFree_delyn() {
		return free_delyn;
	}
	public void setFree_delyn(String free_delyn) {
		this.free_delyn = free_delyn;
	}
	public String getFree_created() {
		return free_created;
	}
	public void setFree_created(String free_created) {
		this.free_created = free_created;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}
