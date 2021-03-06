package com.my.shop;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class BoardBean {
	int bid;
	int mid;
	String board_subject;
	String board_contents;
	int board_like;
	int board_hate;
	String member_id;
	String board_created;
	String board_updated;
	String board_delyn;
	int board_hits;
	String board_address;
	String subway_linenumber;
	String subway_name;
	String board_shopname;
	String board_lat;
	String board_lng;
	String searchT;
	String searchName;

	
	
	public String getBoard_shopname() {
		return board_shopname;
	}
	public void setBoard_shopname(String board_shopname) {
		this.board_shopname = board_shopname;
	}
	public String getBoard_lat() {
		return board_lat;
	}
	public void setBoard_lat(String board_lat) {
		this.board_lat = board_lat;
	}
	public String getBoard_lng() {
		return board_lng;
	}
	public void setBoard_lng(String board_lng) {
		this.board_lng = board_lng;
	}
	public String getSubway_linenumber() {
		return subway_linenumber;
	}
	public void setSubway_linenumber(String subway_linenumber) {
		this.subway_linenumber = subway_linenumber;
	}
	public String getSubway_name() {
		return subway_name;
	}
	public void setSubway_name(String subway_name) {
		this.subway_name = subway_name;
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
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_contents() {
		return board_contents;
	}
	public void setBoard_contents(String board_contents) {
		this.board_contents = board_contents;
	}
	public int getBoard_like() {
		return board_like;
	}
	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}
	public int getBoard_hate() {
		return board_hate;
	}
	public void setBoard_hate(int board_hate) {
		this.board_hate = board_hate;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getBoard_created() {
		return board_created;
	}
	public void setBoard_created(String board_created) {
		this.board_created = board_created;
	}
	public String getBoard_updated() {
		return board_updated;
	}
	public void setBoard_updated(String board_updated) {
		this.board_updated = board_updated;
	}
	public String getBoard_delyn() {
		return board_delyn;
	}
	public void setBoard_delyn(String board_delyn) {
		this.board_delyn = board_delyn;
	}
	public int getBoard_hits() {
		return board_hits;
	}
	public void setBoard_hits(int board_hits) {
		this.board_hits = board_hits;
	}
	public String getBoard_address() {
		return board_address;
	}
	public void setBoard_address(String board_address) {
		this.board_address = board_address;
	}
	public String getSearchT() {
		return searchT;
	}
	public void setSearchT(String searchT) {
		this.searchT = searchT;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	
}
