package bean;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class BoardVo{
	
	static final long serialVersionUID = 1l;
	
	int    serial;
	String mDate;
	String worker;
	String subject;
	String content;
	int    hit;
	int    grp;
	int    cnt; //첨부파일 갯수
	String deep;
	Map<String, String> attfile; //첨부파일 또는 삭제 파일(key=SystemFileName, value=OriginalFileName)
	String  email;
	
	String part = "";//게시판 구분
	String findStr="";
	int    nowPage = 1;
	
	public BoardVo(){}
	public BoardVo(int s, String md, String wk, String sub, String cont, int h){
		this.serial = s;
		this.mDate = md;
		this.worker = wk;
		this.subject = sub;
		this.content = cont;
		this.hit = h;
	}
	
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getCnt() {
      return cnt;
   }
   public void setCnt(int cnt) {
      this.cnt = cnt;
   }
   public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public String getmDate() {
		return mDate;
	}
	public void setmDate(String mDate) {
		this.mDate = mDate;
	}
	public String getWorker() {
		return worker;
	}
	public void setWorker(String worker) {
		this.worker = worker;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getFindStr() {
		return findStr;
	}
	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}
	public int getGrp() {
		return grp;
	}
	public void setGrp(int grp) {
		this.grp = grp;
	}
	public String getDeep() {
		return deep;
	}
	public void setDeep(String deep) {
		this.deep = deep;
	}
	public Map<String, String> getAttfile() {
		return attfile;
	}
	public void setAttfile(Map<String, String> attfile) {
		this.attfile = attfile;
	}
 
}










