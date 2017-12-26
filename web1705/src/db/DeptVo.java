package db;

public class DeptVo {
	int dCode = 0;
	String dName = "";
	
	public DeptVo() {}
	public DeptVo(int dCode, String dName){
		this.dCode = dCode;
		this.dName = dName ;
	}
	
	
	public int getdCode() {
		return dCode;
	}
	public void setdCode(int dCode) {
		this.dCode = dCode;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	
	
	
}
