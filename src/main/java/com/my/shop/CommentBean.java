package com.my.shop;

public class CommentBean {
	private int cid;
	private int bid;
	private int mid;
	private int ref;
	private String comment;
	private String member_id;
	private String comment_created;
	private String comment_delyn;
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getComment_created() {
		return comment_created;
	}
	public void setComment_created(String comment_created) {
		this.comment_created = comment_created;
	}
	public String getComment_delyn() {
		return comment_delyn;
	}
	public void setComment_delyn(String comment_delyn) {
		this.comment_delyn = comment_delyn;
	}
}
