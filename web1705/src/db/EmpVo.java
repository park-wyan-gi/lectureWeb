package db;

public class EmpVo {
	int eId;
	String fn;
	
	public EmpVo(){}
	public EmpVo(int eId, String fn){
		this.eId = eId;
		this.fn = fn;
	}
	public int geteId() {
		return eId;
	}
	public void seteId(int eId) {
		this.eId = eId;
	}
	public String getFn() {
		return fn;
	}
	public void setFn(String fn) {
		this.fn = fn;
	}
}
