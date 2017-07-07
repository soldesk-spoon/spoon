package com.my.shop;

import java.util.List;
import java.util.Map;
 
import org.springframework.stereotype.Repository; 
 
@Repository("sampleDAO")
public class SampleDAO extends AbstractDAO{
 
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
        return (List<Map<String, Object>>)selectList("sample.selectBoardList", map);
    }
    
    public void insertBoard(BoardBean boardbean) throws Exception{
        insert("sample.insertBoard", boardbean);
    } 
    
    public void updateHitCnt(Map<String, Object> map) throws Exception{
        update("sample.updateHitCnt", map);
    }
     
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception{
        return (Map<String, Object>) selectOne("sample.selectBoardDetail", map);
    }
}