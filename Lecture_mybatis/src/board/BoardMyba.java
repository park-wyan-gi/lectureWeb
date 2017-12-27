package board;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.util.ArrayList;
import java.util.List;

import javax.media.jai.RenderedOp;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

public class BoardMyba {
	private SqlSession session;//커넥션 객체가 생성된 상태

	//첨부파일
	String sDirectory = 
			"C:/Users/JHTA/git/lectureWeb/Lecture_mybatis/";
	         
	int    mSize = 1024*1024*10;
	String fileEncoding = "utf-8";
	String part = "default";

	//페이지분리 관련된 필드
	int listSize = 4; // 한페이지에 보여질 행수
	int blockSize = 2; // 보여질 페이지 이동 번호 수.
	
	int totSize = 0; // 검색된 데이터 총 갯수
	int totPage=1; // 전체 페이지 수
	int totBlock=1; // 전체 블럭수
	
	int nowPage=1; // 현재 페이지
	int nowBlock=1; // 현재 블럭
	
	int startNo=1; // 목록의 시작 위치
	int endNo=3; // 목록의 끝 위치
	int startPage=1; // 현재 블럭의 시작 페이지번호
	int endPage=2; // 현재 블럭의 끝 페이지 번호
	
	//thumb nail 만들기 위한 변수
	ParameterBlock pb;
	RenderedOp op;
	BufferedImage bi;
	BufferedImage thumb;
	Graphics2D g2d;

	HttpServletRequest req;
	
	public BoardMyba(HttpServletRequest req){
		try{
			this.req = req;
			session = BoardFactory.getFactory().openSession();
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	
	// board list
	public List<String> getBrdList(){
		List<String> list = null;
		
		try{
			list = session.selectList("board.board_list");
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			return list;
		}
	}
	
	
	public void computePage(BoardVo vo){
		totSize = (int)session.selectOne("board.page",vo );

		totPage  = (int)Math.ceil(totSize*1.0 / listSize);
		totBlock = (int)Math.ceil(totPage*1.0 / blockSize);
		nowBlock = (int)Math.ceil(nowPage*1.0 / blockSize);
		
		endPage = nowBlock * blockSize;
		startPage = endPage - blockSize+1;
		if(totPage < endPage) endPage = totPage;
		
		endNo = nowPage * listSize;
		startNo = endNo - listSize+1;
		if(totSize < endNo) endNo = totSize;		
	}
	
	public List<BoardVo> list(){
		
		System.out.println(part);
		
		BoardVo vo = new BoardVo();
		List<BoardVo> list = null;
		
		if(req.getParameter("part") != null){
			part = req.getParameter("part");
		}
		if(req.getParameter("nowPage") != null){
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		
		vo.setPart(part);
		vo.setFindStr(req.getParameter("findStr"));
		vo.setNowPage(nowPage);
		
		try{
			computePage(vo);

			vo.setStartNo(startNo);
			vo.setEndNo(endNo);

			list = (ArrayList)session.selectList("board.select", vo);
			

			session.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return list;
	}
	/*	
	public BoardVo view(){
		BoardVo v = null;
		try{
			// 조회수 증가
			int cnt = session.update("board.update_hit",vo);

			if(cnt>0) session.commit();
			else      session.rollback();

			v = (BoardVo)session.selectOne("board.view", vo);
			
			session.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return v;
	}

	
	public String insert(HttpServletRequest request){
		String rs = "정상적으로 추가되었습니다.";
		int r=0;
		try{
			MultipartRequest mr = new MultipartRequest(
					request, 
					sDirectory, 
					mSize, 
					fileEncoding, 
					new DefaultFileRenamePolicy());
			
			String worker = mr.getParameter("worker");
			String subject = mr.getParameter("subject");
			String content = mr.getParameter("content");
			String pwd = mr.getParameter("pwd");
			String part = mr.getParameter("part");
			
			BoardVo v = new BoardVo();
			v.setWorker(worker);
			v.setSubject(subject);
			v.setContent(content);
			v.setPwd(pwd);
			v.setPart(part);
			
			r = session.insert("board_insert", v);
			
			if(r>0){
				Enumeration<String> enumFile = mr.getFileNames();

				while(enumFile.hasMoreElements()){
					String tag = enumFile.nextElement();
					String orifile = mr.getOriginalFileName(tag);
					String sysfile = mr.getFilesystemName(tag);
					
					if(orifile == null) continue;
					Map<String, String> map = new HashMap<String, String>();
					map.put("ori", orifile);
					map.put("sys", sysfile);
						
					r = session.insert("board.insert_att", map);
					
					//thumb nail 만들기
					pb = new ParameterBlock();
					pb.add(sDirectory + sysfile);
					op = JAI.create("fileload", pb);
					
					bi = op.getAsBufferedImage();
					
					thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
					g2d = thumb.createGraphics();
					g2d.drawImage(bi, 0, 0, 100, 100, null);
					
					File file = new File(sDirectory + "thumb_" + sysfile);
					ImageIO.write(thumb, "png", file);
					
					System.gc();
				}
				
			}
			
			if(r>0){
				session.commit();
				
			}else{
				session.rollback();
				
				Enumeration<String> enumFile = mr.getFileNames();

				while(enumFile.hasMoreElements()){
					String tag = enumFile.nextElement();
					String sysfile = mr.getFilesystemName(tag);
					fileDel(sysfile,0);
				}
				rs = "입력중 오류 발생...";
			}
			session.close();
				
		}catch(Exception ex){
			rs = "입력중 예외 발생";
			ex.printStackTrace();
		}
		return rs;
	}

	public String delete(){
		String rs = "삭제 처리되었습니다...";
		int cnt=0;
		try{
			//부모테이블 삭제
			cnt = session.delete("board.delete",vo);
			if(cnt > 0){
				if(vo.getAttFile() != null){
					Iterator<String> iter = vo.getAttFile().keySet().iterator();
					while(iter.hasNext()){
						String key = iter.next();
						String file = vo.getAttFile().get(key);
						
						//첨부테이블 삭제
						cnt = session.delete("board.fileDel", file);

						if(cnt>0){
							//첨부 파일 삭제
							File f = new File(sDirectory + file);
							if(f.exists()) f.delete();
						}else{
							session.rollback();
						}
					}
				}
			}else{
				rs = "삭제중 오류 발생....";
				session.rollback();
			}

			session.commit();
			session.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return rs;
	}

	public boolean repInsert(){
		boolean flag=false;
		try{
			MultipartRequest mr 
				= new MultipartRequest(vo.getRequest(), uploadPath, 
						fileSize, fileEncoding, 
						new DefaultFileRenamePolicy());
			
			String mid = mr.getParameter("mid");
			String subject = mr.getParameter("subject");
			String content = mr.getParameter("content");
			String pwd = mr.getParameter("pwd");
			String part = mr.getParameter("part");
			
			String orifile = mr.getOriginalFileName("filename");
			String sysfile = mr.getFilesystemName("filename");

			int grp = Integer.parseInt(mr.getParameter("grp"));
			String deep = mr.getParameter("deep");
			
			BoardVo v = new BoardVo();
			v.setMid(mid);
			v.setSubject(subject);
			v.setContent(content);
			v.setPwd(pwd);
			v.setPart(part);
			v.setFilename(sysfile);
			v.setGrp(grp);
			v.setDeep(deep);
			
			int cnt = session.insert("board.repl", v);
			if(cnt>0){
				session.commit();
				flag=true;
			}
			
			session.close();			
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return flag;
	}
	
	public boolean modify(){
		boolean flag=false;
		
		try{
			MultipartRequest mr =
				new MultipartRequest(
						vo.getRequest(), 
						uploadPath,
						fileSize,
						fileEncoding,
						new DefaultFileRenamePolicy());
			
			String mid = mr.getParameter("mid");
			String subject = mr.getParameter("subject");
			String content = mr.getParameter("content");
			String pwd     = mr.getParameter("pwd");
			String filename= mr.getParameter("filename");
			String sysfile = mr.getFilesystemName("newfilename");
			int serial = Integer.parseInt(mr.getParameter("serial"));
			String fileDelFlag = mr.getParameter("fileDelFlag");
			
			BoardVo v = new BoardVo();
			v.setMid(mid);
			v.setSubject(subject);
			v.setContent(content);
			v.setPwd(pwd);
			v.setFilename(sysfile);
			v.setSerial(serial);
			
			//기존 첨부된 파일을 삭제
			if(fileDelFlag.equals("del")){
				fileDel(filename, serial);
			}
			
			int cnt = session.update("board.update", v); // 처리결과
			session.commit();

			if(cnt>0) flag=true;
			
			
			v = new BoardVo();
			v.setFilename(sysfile);
			v.setFileid(serial);
			
			System.out.println("sysfile:" + sysfile);
			System.out.println("serial:" + serial);
			
			
			// 새로운 첨부파일이 생성된 경우(내용+첨부파일이 모두 수정된경우)
			if(sysfile != null && sysfile != ""){
				cnt = session.insert("board.newFile", v);
				if(cnt>0){
					session.commit();
					flag=true;
				}else{
					session.rollback();
					flag=false;
				}
			}
			
			session.close();
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return flag;
	}
	
	public boolean fileDownload(HttpServletResponse response){
		boolean flag=false;
		try{
			String sFilePath = uploadPath +"\\" +  vo.getFilename();
			
			// 파일을 읽기위한 버퍼정의
			byte[] b = new byte[4096];
			File file = new File(sFilePath);
			FileInputStream in = new FileInputStream(sFilePath);
	
			// 클라이언트의 요청에 따른 응답정보 셋팅
			String mineType = vo.getRequest().getServletContext().getMimeType(sFilePath);
			if(mineType == null) mineType = "application/octect-stream";
			
			response.reset();
			response.setContentType(mineType);
	
			// 한글파일명 처리
			String encoding ="";
	
			if((vo.getRequest().getHeader("User-Agent").indexOf("Firefox")) > -1){
				String temp = vo.getFilename().replaceAll(" ", "");
				encoding= new String(temp.getBytes("utf-8"), "8859_1");
	
			}else{//IE, Chrome, Opera
				encoding = URLEncoder.encode(vo.getFilename(), "utf-8");
				encoding = encoding.replace("+","%20");
			}
	
			// 다운로드 다이얼로그창 표시
			response.setHeader("Content-Disposition", "attachment;filename=" + encoding);
	
			// 지정된 경로에 파일 저장
			ServletOutputStream sos = response.getOutputStream();
			int read=0;
			while( (read = in.read(b, 0, b.length)) != -1 ){
				sos.write(b, 0, read);
			}
			
			sos.flush();
			sos.close();
			in.close();
			flag=true;
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return flag;

	}
	
	public void fileDel(String oldfile, int serial){
		BoardVo v = new BoardVo();
		v.setFileid(serial);
		v.setFilename(oldfile);
		try{
			int cnt = session.update("board.fileDel", v);
			session.commit();
			
			File file = new File(uploadPath + "/" + oldfile);
			if(file.exists()){
				if(file.delete()) System.out.println("삭제됨.");
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
*/	


	//페이지 분리와 관련된 메서드

	public int getListSize() {
		return listSize;
	}

	public String getPart() {
      return part;
   }


   public void setPart(String part) {
      this.part = part;
   }


   public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getTotSize() {
		return totSize;
	}

	public void setTotSize(int totSize) {
		this.totSize = totSize;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}

	public int getTotBlock() {
		return totBlock;
	}

	public void setTotBlock(int totBlock) {
		this.totBlock = totBlock;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getNowBlock() {
		return nowBlock;
	}

	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
}
