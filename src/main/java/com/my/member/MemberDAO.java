package com.my.member;

import java.util.ArrayList;

public interface MemberDAO {
	public ArrayList<Member> getMembers();
    public void insertMember(Member member);
    public void updateMember(String name);
    public void deleteMember(String name);
    public int JoinIdCheck(String name);
    public String LoginCheck(Member member);


}
