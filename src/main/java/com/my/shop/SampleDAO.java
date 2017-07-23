package com.my.shop;

import java.util.List;
import java.util.Map;
 
import org.springframework.stereotype.Repository; 
 
@Repository("sampleDAO")
public class SampleDAO extends AbstractDAO{
 
    @SuppressWarnings("unchecked")
    public List<BoardBean> selectBoardList(BoardBean boardBean) throws Exception{
        return (List<BoardBean>)selectList("sample.selectBoardList", boardBean);
    }
    
    public void insertBoard(BoardBean boardbean) throws Exception{
        insert("sample.insertBoard", boardbean);
    } 
    
    public void updateHitCnt(int bid) throws Exception{
        update("sample.updateHitCnt", bid);
    }
     
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectBoardDetail(int bid) throws Exception{
        return (Map<String, Object>) selectOne("sample.selectBoardDetail", bid);
    }
    
    public void updateBoard(BoardBean boardBean) throws Exception{
        update("sample.updateBoard", boardBean);
    }
    
    public void deleteBoard(int bid) throws Exception{
    	delete("sample.deleteBoard", bid);
    } 
    
    
    @SuppressWarnings("unchecked")
	public List<BoardBean> selectSubway(String subline) throws Exception{
        return (List<BoardBean>)selectList("sample.selectSubway", subline);
    }

	public void uploadFile(uploadFileVo uploadfilevo) {
		// TODO Auto-generated method stub
		insert("sample.uploadFile" , uploadfilevo);
		
	}
    
    @SuppressWarnings("unchecked")
    public List<CommentBean> selectComment(int bid) throws Exception{
        return (List<CommentBean>)selectList("sample.selectComment", bid);
    }
    
    public int selectCID() {
		// TODO Auto-generated method stub
		String selectcidob = selectOne("sample.selectCID").toString();
		
		int selectcid = Integer.parseInt(selectcidob);
		return selectcid;
	}

	public int selectBID() {
		// TODO Auto-generated method stub
		String selectbidob = selectOne("sample.selectBID").toString();
		
		int selectbid = Integer.parseInt(selectbidob);
		return selectbid;
	}
	@SuppressWarnings("unchecked")
	public List<uploadFileVo> selectImage(int bid) {
		// TODO Auto-generated method stub
		return (List<uploadFileVo>)selectList("sample.selectImage",bid);
	}
    
    public void insertComment(CommentBean commentBean) throws Exception{
        insert("sample.insertComment", commentBean);
    }
    
    @SuppressWarnings("unchecked")
	public List<BoardBean> selectBoardLIstByHit(BoardBean boardBean) {
		// TODO Auto-generated method stub
		return (List<BoardBean>)selectList("sample.selectBoardListByHit", boardBean);
	}
    @SuppressWarnings("unchecked")
	public List<BoardBean> selectBoardListByLike(BoardBean boardBean) {
		// TODO Auto-generated method stub
		return (List<BoardBean>)selectList("sample.selectBoardListByLike", boardBean);
	}

	public void insertLike(LikeHateBean likehateBean) {
		// TODO Auto-generated method stub
		insert("sample.insertLike",likehateBean);
		
	}

	public void deleteLike(LikeHateBean likehateBean) {
		// TODO Auto-generated method stub
		delete("sample.deleteLike",likehateBean);
	}

	public void insertHate(LikeHateBean likehateBean) {
		// TODO Auto-generated method stub
		insert("sample.insertHate",likehateBean);
		
	}

	public void deleteHate(LikeHateBean likehateBean) {
		// TODO Auto-generated method stub
		delete("sample.deleteHate", likehateBean);
		
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectLikeHate(LikeHateBean likehateBean) {
		// TODO Auto-generated method stub
		return (Map<String, Object>)selectOne("sample.selectLikeHate",likehateBean);
	}

	public int selectSumLike(int bid) {
		// TODO Auto-generated method stub
		String select = selectOne("sample.selectSumLike",bid).toString();
		int selectsumlike = Integer.parseInt(select);
		return selectsumlike;
	}

	public int selectSumHate(int bid) {
		// TODO Auto-generated method stub
		String select  = selectOne("sample.selectSumHate",bid).toString();
		int selectsumhate = Integer.parseInt(select);
		return selectsumhate;
	}

	public void updateSumlike(int bid) {
		// TODO Auto-generated method stub
		update("sample.updateSumlike", bid);
	}


    
}