package com.my.member;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 //Service Ŭ������ Repository�� ��������μ� ��(bean) Ŭ������ ����ϴ��ϰ��Ѵ�. 
@Repository
public class MemberDAOService implements MemberDAO {
 
 //Autowired�� ����Ͽ� sqlSession�� ����Ҽ� �ִ�.
    @Autowired
    private SqlSession sqlSession;
    
    @Override
    public ArrayList<Member> getMembers() {
        ArrayList<Member> result = new ArrayList<Member>();
        //sqlSession�� ���Ͽ� �����Ѵ�.
             MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
        //getMember()�� �޼ҵ��� mapper.mxl�� id�� �����ؾ��Ѵ�.
        result = memberMapper.getMembers();
        
        return result;
    }
    @Override
    public void insertMember(Member member) {
        MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
        memberMapper.insertMember(member);
    }
 //�Ʒ��κ��� �ڵ��ϴ� ������
    @Override
    public void updateMember(String name) {
    }
    @Override
    public void deleteMember(String name) {
        MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
        memberMapper.deleteMember(name);
    }
	@Override
	public int JoinIdCheck(String name) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
       int result = 0;
		
       result = memberMapper.JoinIdCheck(name);
       return result;
       
        
	}
	@Override
	public int LoginCheck(Member member) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int result;
		result = memberMapper.LoginCheck(member);
		
		System.out.println("LoginCheck result :  " + result);
		
		return result;
	}
}
 


