package com.my.shop;

import java.util.List;
import java.util.Map;
 
import javax.annotation.Resource;
 
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
 
@Service("sampleService")
public class SampleServiceImpl implements SampleService{
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="sampleDAO")
    private SampleDAO sampleDAO;
     
    @Override
    public List<BoardBean> selectBoardList(BoardBean boardBean) throws Exception {
        return sampleDAO.selectBoardList(boardBean);
    }
    
    @Override
    public void insertBoard(BoardBean boardbean) throws Exception {
        sampleDAO.insertBoard(boardbean);
    }
    
    @Override 
    public Map<String, Object> selectBoardDetail(int bid) throws Exception {
       // sampleDAO.updateHitCnt(boardBean);
    	sampleDAO.updateHitCnt(bid);
        Map<String, Object> resultMap = (Map<String, Object>) sampleDAO.selectBoardDetail(bid);
        return resultMap;
    }
    
    @Override
    public void updateBoard(BoardBean boardBean) throws Exception{
        sampleDAO.updateBoard(boardBean);
    }
    
    @Override
    public void deleteBoard(int bid) throws Exception{
        sampleDAO.deleteBoard(bid);
    }

	@Override
	public List<BoardBean> selectSubway(String subway_line) throws Exception {
		// TODO Auto-generated method stub
		return sampleDAO.selectSubway(subway_line);
	}

	@Override
	public void uploadFile(uploadFileVo uploadfilevo) throws Exception {
		// TODO Auto-generated method stub
		sampleDAO.uploadFile(uploadfilevo);
		
	}
	public List<CommentBean> selectComment(int bid) throws Exception {
		// TODO Auto-generated method stub
		return sampleDAO.selectComment(bid);
	}

	@Override
	public int selectBID() throws Exception {
		// TODO Auto-generated method stub
		return (Integer) sampleDAO.selectBID();
	}
	
	@Override
	public int selectCID() throws Exception {
		// TODO Auto-generated method stub
		return (Integer) sampleDAO.selectCID();
	}

	@Override
	public List<uploadFileVo> selectImage(int bid) throws Exception {
		// TODO Auto-generated method stub
		return sampleDAO.selectImage(bid);
	}
	
	@Override
    public void insertComment(CommentBean commentbean) throws Exception {
        sampleDAO.insertComment(commentbean);
    }

	@Override
	public List<BoardBean> selectBoardListByHit(BoardBean boardBean) {
		// TODO Auto-generated method stub
		return sampleDAO.selectBoardLIstByHit(boardBean);
	}

	@Override
	public List<BoardBean> selectBoardListByLike(BoardBean boardBean) {
		// TODO Auto-generated method stub
		return sampleDAO.selectBoardListByLike(boardBean);
	}

	@Override
	public void insertLike(LikeHateBean likehateBean) throws Exception {
		// TODO Auto-generated method stub
		sampleDAO.insertLike(likehateBean);
	}

	@Override
	public void deleteLike(LikeHateBean likehateBean) throws Exception {
		// TODO Auto-generated method stub
		sampleDAO.deleteLike(likehateBean);
		
	}

	@Override
	public void insertHate(LikeHateBean likehateBean) throws Exception {
		// TODO Auto-generated method stub
		sampleDAO.insertHate(likehateBean);
		
	}

	@Override
	public void deleteHate(LikeHateBean likehateBean) throws Exception {
		// TODO Auto-generated method stub
		sampleDAO.deleteHate(likehateBean);
	}

	@Override
	public Map<String, Object> selectLikeHate(LikeHateBean likehateBean) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> likehatemap = (Map<String, Object>) sampleDAO.selectLikeHate(likehateBean);
		return likehatemap;
	}

	@Override
	public int selectSumLike(int bid) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) sampleDAO.selectSumLike(bid);
	}

	@Override
	public int selectSumHate(int bid) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) sampleDAO.selectSumHate(bid);
	}

	@Override
	public void updateSumlike(int bid) throws Exception {
		// TODO Auto-generated method stub
		sampleDAO.updateSumlike(bid);
		
		
	}

	@Override
	public int selectminImgNum(int bid) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) sampleDAO.selectminImgNum(bid);
	}

	
	
}