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
    public BoardBean selectBoardDetail(BoardBean boardBean) throws Exception {
        sampleDAO.updateHitCnt(boardBean);
        BoardBean resultMap = sampleDAO.selectBoardDetail(boardBean);
        return resultMap;
    }
}