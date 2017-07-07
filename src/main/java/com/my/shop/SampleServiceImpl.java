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
}