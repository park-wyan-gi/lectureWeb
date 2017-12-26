package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class EmpDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public EmpDao() {
		try {
			conn = new DBConn().getConn();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public void dbClose(){
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//부서명을 사용하여 해당 부서정보를 가져옴
	public Vector<DeptVo> getDepts(String dName) {
		Vector<DeptVo> deptV = new Vector<DeptVo>();
		try {
			String sql = " select department_id, department_name from departments "
					+ " where upper(department_name) like upper(?) ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + dName + "%");
			rs = ps.executeQuery();
			while (rs.next()) {
				DeptVo vo = new DeptVo();
				vo.setdCode(rs.getInt("department_id"));
				vo.setdName(rs.getString("department_name"));

				deptV.add(vo);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return deptV;
	}

	//부서코드를 사용하여 해당 부서직원들을 가져옴
	public Vector<EmpVo> getEmps(int dCode) {
		Vector<EmpVo> empV = new Vector<EmpVo>();
		try {
			String sql = " select employee_id, first_name from employees " 
							+ " where department_id = ?  ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dCode);
			rs = ps.executeQuery();
			while (rs.next()) {
				EmpVo vo = new EmpVo();
				vo.seteId(rs.getInt("employee_id"));
				vo.setFn(rs.getString("first_name"));
				empV.add(vo);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return empV;
	}

	
	public static void main(String[] args){
		EmpDao dao = new EmpDao();
		Vector<DeptVo> v = dao.getDepts("it");
		
		for(int i=0 ; i<v.size() ; i++){
			int id = v.get(i).getdCode();
			String dn = v.get(i).getdName();
			System.out.println(id + "-" + dn);
		}
		System.out.println("-------------------------------------");
		Vector<EmpVo> v2 = dao.getEmps(100);
		for(int i=0 ; i<v2.size() ; i++){
			int id = v2.get(i).geteId();
			String dn = v2.get(i).getFn();
			System.out.println(id + "-" + dn);
		}
		
		
	}
}











