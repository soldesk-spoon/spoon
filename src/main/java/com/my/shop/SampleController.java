package com.my.shop;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.activation.CommandMap;
import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.my.shop.BoardBean;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

 
@Controller
@SessionAttributes("mid")
public class SampleController {
    Logger logger = Logger.getLogger(this.getClass());
     
    @Resource(name="sampleService")
    private SampleService sampleService;
     
    @RequestMapping(value="/sample/openBoardList.do", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView openSampleBoardList(BoardBean boardBean,HttpServletRequest request,HttpSession session) throws Exception{
        ModelAndView mv = new ModelAndView("/board/boardList");
        String selectobj = request.getParameter("sel");
        System.out.println(selectobj);
        List<BoardBean> list = sampleService.selectBoardList(boardBean);
      
        if(selectobj==null){
        	list = sampleService.selectBoardList(boardBean);
            mv.addObject("selectobj","selectNo");
            System.out.println("selectNo");
        }else{
        	if(selectobj.equals("selectNo")){
        		list = sampleService.selectBoardList(boardBean);
        	}else if(selectobj.equals("selectHit")){
        		list = sampleService.selectBoardListByHit(boardBean);
        	}else if(selectobj.equals("selectLike")){
        		list = sampleService.selectBoardListByLike(boardBean);
        	}
        	mv.addObject("selectobj",selectobj);
        }
        if(session.getAttribute("mid")==null){
        	
        }else{
        	String mid = session.getAttribute("mid").toString();
            session.setAttribute("mid", mid);
        }
        
      
                
        
        mv.addObject("list", list);
         
        return mv;
    }
   
    
    @RequestMapping(value="/sample/openBoardWrite.do")
    public ModelAndView openBoardWrite(@RequestParam("subway_linenumber") String subway_linenumber, HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("/board/boardWrite");
        BoardBean boardBean = new BoardBean();
        int bid = sampleService.selectBID();
        if(bid==0){
        	bid = 1;
        }else{
        	bid = bid + 1;
        }
        
        System.out.println(sampleService.selectBID());
        String board_subject = request.getParameter("board_subject");
        String board_contents = request.getParameter("board_contents");
        mv.addObject("board_subject",board_subject);
        mv.addObject("board_contents",board_contents);
        mv.addObject("bid",bid);
        
        List<BoardBean> list = sampleService.selectSubway(subway_linenumber);
         mv.addObject("subList",list);
         mv.addObject("subway_linenumber",subway_linenumber);
        return mv;
    }
    
    @RequestMapping(value="/sample/insertBoard.do")
    public ModelAndView insertBoard(BoardBean boardBean, HttpServletRequest request,MultipartHttpServletRequest mhsq) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");
        int mid = Integer.parseInt(request.getParameter("session_mid"));
        String member_id = request.getParameter("session_member_id");
        String rest = request.getParameter("rest");
    	String input_lng =request.getParameter("input_lng");
    	String input_lat = request.getParameter("input_lat");
    	String address = request.getParameter("address"); 
    	/*System.out.println("report.getname : "+report.getName());
    	System.out.println("report.getoriginalfilename : "+ report.getOriginalFilename());
    	*/boardBean.setBoard_shopname(rest);
    	boardBean.setBoard_lat(input_lat);
    	boardBean.setBoard_lng(input_lng);
    	boardBean.setBoard_address(address);
    	System.out.println(address);
    	//boardBean.setFilename1(report.toString());
        boardBean.setMember_id(member_id);
        boardBean.setMid(mid);
        boardBean.setSubway_linenumber( request.getParameter("subway_linenumber1"));
        System.out.println(boardBean.getSubway_name());
        System.out.println(boardBean.getSubway_linenumber());
        sampleService.insertBoard(boardBean);
        System.out.println(boardBean.getBid());
        uploadFileVo uploadfilevo = new uploadFileVo();
        int bid = Integer.parseInt(request.getParameter("bid"));
    	
        String realFolder ="C:\\Project\\Project_workspace\\spoon\\src\\main\\webapp\\resources\\data\\";
        File dir = new File(realFolder);
        if (!dir.isDirectory()) {
            dir.mkdirs();
        }
        
        List<MultipartFile> mf = mhsq.getFiles("file1");
        for (int i = 0; i < mf.size(); i++) {
        if (mf.get(i).getOriginalFilename().equals("")) {
             
        } else {
            
                // 파일 중복명 처리
                String genId = UUID.randomUUID().toString();
                // 본래 파일명
                String originalfileName = mf.get(i).getOriginalFilename();
                 
                String saveFileName = genId + "." + originalfileName;
                // 저장되는 파일 이름
 
                String savePath = realFolder + saveFileName; // 저장 될 파일 경로
 
                long fileSize = mf.get(i).getSize(); // 파일 사이즈
 
                mf.get(i).transferTo(new File(savePath)); // 파일 저장
                
                uploadfilevo.setBid(bid);
                uploadfilevo.setFile_size(fileSize);
                uploadfilevo.setFile_name(saveFileName);
                uploadfilevo.setO_name(originalfileName);
                
                System.out.println(uploadfilevo.getBid());
                System.out.println(uploadfilevo.getO_name());

                sampleService.uploadFile(uploadfilevo);
                
                System.out.println("11111111111111");
            }
        }

        return mv;
    }
    
    
    @RequestMapping(value="/sample/openBoardDetail.do", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView openBoardDetail(@RequestParam("bid")int bid, HttpServletRequest request, HttpSession session ) throws Exception{
        ModelAndView mv = new ModelAndView("/board/boardDetail");
        LikeHateBean likehateBean = new LikeHateBean();
        Map<String, Object> map = sampleService.selectBoardDetail(bid);
        List<uploadFileVo> imgMap = sampleService.selectImage(bid);
       // int mid = Integer.parseInt(request.getParameter("memberNo"));
        //likehateBean.setMid(mid);
        likehateBean.setBid(bid);
       
        String smid =session.getAttribute("mid").toString();
        session.setAttribute("mid", session.getAttribute("mid"));
        int mid = Integer.parseInt(smid);

        System.out.println("session oo");
        likehateBean.setMid(mid);
        Map<String, Object> lhmap = sampleService.selectLikeHate(likehateBean);
        int sumlike = sampleService.selectSumLike(bid);
        System.out.println(sumlike);
       
        //System.out.println(imgMap);
        String realFolder ="C:\\Project\\Project_workspace\\spoon\\src\\main\\webapp\\WEB-INF\\images\\";
       
        mv.addObject("imgPath", realFolder);
        mv.addObject("imgmap",imgMap);
        mv.addObject("map", map); 
        mv.addObject("lhmap",lhmap);
        System.out.println("lhmap"+lhmap);
         
        List<CommentBean> list = sampleService.selectComment(bid);
       // System.out.println(list);
        mv.addObject("list", list);
        mv.addObject("sumlike",sumlike);
        return mv;
    }
    
    @RequestMapping(value="/sample/openBoardUpdate.do", method=RequestMethod.GET)
    public ModelAndView openBoardUpdate(@RequestParam("bid")int bid) throws Exception{
        ModelAndView mv = new ModelAndView("/board/boardUpdate");
         
        Map<String,Object> map = sampleService.selectBoardDetail(bid);
        mv.addObject("map", map);
         
        return mv;
    }

    @RequestMapping(value="/sample/updateBoard.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView updateBoard(BoardBean boardBean) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/sample/openBoardDetail.do");
        System.out.println("updateBoard!!!!!!!!!!!!!!1");
  
        
        sampleService.updateBoard(boardBean);
        System.out.println(boardBean.getBid());
        System.out.println(boardBean.getBoard_subject());
        System.out.println(boardBean.getBoard_contents());
        mv.addObject("bid", boardBean.getBid());
    
        return mv;
        
    }
    
    @RequestMapping(value="/sample/insertLikeHate.do", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView insertLikeHate(@RequestParam("bid") int bid, HttpServletRequest request, HttpSession session) throws Exception{
    	 ModelAndView mv = new ModelAndView("redirect:/sample/openBoardDetail.do");
    	LikeHateBean likehateBean = new LikeHateBean();
    	likehateBean.setBid(bid);
    	String smid = session.getAttribute("mid").toString();
    	int mid = Integer.parseInt(smid);
    	likehateBean.setMid(mid);
    	mv.addObject("bid", bid);
        int like=111;
        int hate=111;
        System.out.println("like:" + request.getParameter("like"));
        if(request.getParameter("like")==null||request.getParameter("like").equals("0")){
        	like=0;
        	System.out.println("like=0");
        }else if(request.getParameter("like").equals("1")){
        	like=1;
        	System.out.println("like=1");
        }else{
        	like=0;
        }
        System.out.println("request  hate : "+request.getParameter("hate"));
        if(request.getParameter("hate")==null||request.getParameter("hate").equals("0")){
        	hate=0;
        	System.out.println("hate=0");
        }else if(request.getParameter("hate").equals("1")){
        	hate=1;
        	System.out.println("hate=1");
        }else{
        	hate = 0;
        }

        likehateBean.setBoard_like(like);
        likehateBean.setBoard_hate(hate);
        if(like==0&&hate==0){
        	sampleService.deleteLike(likehateBean);
        	sampleService.deleteHate(likehateBean);
        	System.out.println("00");
        }else if(like==1&&hate==0){
        	likehateBean.setMid(mid);
        	sampleService.insertLike(likehateBean);
        	sampleService.deleteHate(likehateBean);
        	System.out.println("10");
        }else if(like==0&&hate==1){
        	likehateBean.setMid(mid);
        	sampleService.deleteLike(likehateBean);
        	sampleService.insertHate(likehateBean);
        	System.out.println("01");
        }else if(like==1&&hate==1){
        	mv.addObject("alert","<script> alert('둘중하나선택');</script>");
        	sampleService.deleteLike(likehateBean);
        	sampleService.deleteHate(likehateBean);
        	like=0;
        	hate=0;
        	System.out.println("11");
        }
        System.out.println("like : "+like);
        System.out.println("hate : "+hate);
        
        return mv;
       
    }
    @RequestMapping(value="/sample/deleteBoard.do")
    public ModelAndView deleteBoard(int bid) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");

        sampleService.deleteBoard(bid);
        
        return mv;
    }
    
    @RequestMapping(value="/sample/board/map.do", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView mapView(){
    	ModelAndView mv = new ModelAndView("board/map");
    
    	return mv;
 
    }
    @RequestMapping(value="/sample/board/map2.do", method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView mapViewResult(HttpServletRequest request){
    	ModelAndView mv = new ModelAndView("board/map2");
    	String rest = request.getParameter("rest");
    	double input_lng = Double.parseDouble(request.getParameter("input_lng"));
    	double input_lat = Double.parseDouble(request.getParameter("input_lat"));
    	String address = request.getParameter("address"); 
    	mv.addObject("rest",rest);
    	mv.addObject("address",address);
    	mv.addObject("input_lng",input_lng);
    	mv.addObject("input_lat",input_lat);
    	return mv;
 
    }
    
    @RequestMapping(value="/sample/insertComment.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView insertComment(CommentBean commentBean,HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/sample/openBoardDetail.do");
        //int mid = Integer.parseInt(request.getParameter("mid"));
        if(commentBean.getRef()==0){        	
        	int cid=sampleService.selectCID();
            commentBean.setRef(cid+1);
        }  
       // commentBean.setMid(mid);
        System.out.println(commentBean.getMid());
        System.out.println(commentBean.getRef());
        
        sampleService.insertComment(commentBean);
        mv.addObject("bid", commentBean.getBid());
    
        return mv;        
    }
}
    //
    //
    //
    //
    //
    
    
    /*@RequestMapping(value="/sample/openComment.do", method=RequestMethod.GET)
    public ModelAndView openComment(@RequestParam("bid")int bid) throws Exception{
        ModelAndView mv = new ModelAndView("/board/comment");
         
       List<CommentBean> list = sampleService.selectComment(bid);
       System.out.println(list);
       mv.addObject("list", list);
         
       return mv;
    }*/
    
    /*
    
    @RequestMapping(value="/sample/insertBoard.do")
    public ModelAndView insertComment(BoardBean boardBean, HttpServletRequest request,@RequestParam("file1") MultipartFile report) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");
        int mid = Integer.parseInt(request.getParameter("session_mid"));
        String member_id = request.getParameter("session_member_id");
        String rest = request.getParameter("rest");
    	String input_lng =request.getParameter("input_lng");
    	String input_lat = request.getParameter("input_lat");
    	String address = request.getParameter("address"); 
    	System.out.println("report.getname : "+report.getName());
    	System.out.println("report.getoriginalfilename : "+ report.getOriginalFilename());
    	boardBean.setBoard_shopname(rest);
    	boardBean.setBoard_lat(input_lat);
    	boardBean.setBoard_lng(input_lng);
    	boardBean.setBoard_address(address);
    	//boardBean.setFilename1(report.toString());
        boardBean.setMember_id(member_id);
        boardBean.setMid(mid);
        boardBean.setSubway_linenumber( request.getParameter("subway_linenumber1"));
        sampleService.insertBoard(boardBean);
        return mv;
    }
    
    
}*/