package uiux;

public class ScoreVo {
	private String findStr="";
	private String gubun="";
	private int rno=0;
	private String mid="";
	private String exam="";
	private String mdate="";
	private int kor=0;
	private int mat=0;
	private int eng=0;
	private int comp=0;
	private int etc=0;
	
	private int tot=0;
	private double avg=0.0;
	
	private String school="";
	private int classYear=0;
	private String registerDate="";
	
	MemberVo mDao;

	public String getFindStr() {
		return findStr;
	}

	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}

	public String getGubun() {
		return gubun;
	}

	public void setGubun(String gubun) {
		this.gubun = gubun;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getExam() {
		return exam;
	}

	public void setExam(String exam) {
		this.exam = exam;
	}

	public String getMdate() {
		return mdate;
	}

	public void setMdate(String mdate) {
		this.mdate = mdate;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getMat() {
		return mat;
	}

	public void setMat(int mat) {
		this.mat = mat;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getComp() {
		return comp;
	}

	public void setComp(int comp) {
		this.comp = comp;
	}

	public int getEtc() {
		return etc;
	}

	public void setEtc(int etc) {
		this.etc = etc;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public int getClassYear() {
		return classYear;
	}

	public void setClassYear(int classYear) {
		this.classYear = classYear;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	public MemberVo getmDao() {
		return mDao;
	}

	public void setmDao(MemberVo mDao) {
		this.mDao = mDao;
	}

	public int getTot() {
		tot = kor + eng + mat + comp + etc;
		return tot;
	}

	public void setTot(int tot) {
		this.tot = tot;
	}

	public double getAvg() {
		avg = getTot() / 5.0;
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}
	
	
	
}
