package com.my.freeboard;

import java.util.List;
import java.util.Map;
 
import javax.annotation.Resource;
 
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
 
@Service("freeBoardService")
public class FreeBoardServiceImpl implements FreeBoardService{
    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="freeBoardDAO")
    private FreeBoardDAO freeBoardDAO;
     
    @Override
    public List<BoardBeanF> selectBoardList(BoardBeanF boardBean) throws Exception {
        return freeBoardDAO.selectBoardList(boardBean);
    }
    
    @Override
    public void insertBoard(BoardBeanF boardbean) throws Exception {
    	freeBoardDAO.insertBoard(boardbean);
    }
    
    @Override 
    public Map<String, Object> selectBoardDetail(int bid) throws Exception {
       // freeBoardDAO.updateHitCnt(boardBean);
    	freeBoardDAO.updateHitCnt(bid);
        Map<String, Object> resultMap = (Map<String, Object>) freeBoardDAO.selectBoardDetail(bid);
        return resultMap;
    }
    
    @Override
    public void updateBoard(BoardBeanF boardBean) throws Exception{
    	freeBoardDAO.updateBoard(boardBean);
    }
    
    @Override
    public void deleteBoard(int bid) throws Exception{
    	freeBoardDAO.deleteBoard(bid);
    }
}