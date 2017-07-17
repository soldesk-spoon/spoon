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
    
}