package uiux;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.print.URIException;

public class Member {
	private Connection con ;
	private MemberVo m;
	public Member(){
		con = new OracleDB().getCon();
	}
	public MemberVo getM() {
		return m;
	}
	public void setM(MemberVo m) {
		this.m = m;
	}
	
	public Vector suggest(){
		String temp = "";
		String sql = "select irum from vmember ";
		temp = m.getFindStr();
		PreparedStatement pstmt = null;
		Vector<MemberVo> v = new Vector<MemberVo>();
		try{
			if( ! temp.equals("")){
				sql += "where irum like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,"%"+temp+"%");
			}else{
				pstmt = con.prepareStatement(sql);
			}
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				MemberVo d = new MemberVo();
				d.setIrum(rs.getString("irum"));
				
				v.add(d);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			return v;
		}
	}

	
	
	public Vector display(){
		String temp = "";
		String sql = "select * from vmember ";
		temp = m.getFindStr();
		PreparedStatement pstmt = null;
		Vector<MemberVo> v = new Vector<MemberVo>();
		try{
			if( ! temp.equals("")){
				sql += "where mid like ?";
				sql += " or irum like ? ";
				sql += " or address like ? ";
				sql += " or phone like ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,"%"+temp+"%");
				pstmt.setString(2,"%"+temp+"%");
				pstmt.setString(3,"%"+temp+"%");
				pstmt.setString(4,"%"+temp+"%");
			}else{
				pstmt = con.prepareStatement(sql);
			}
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				MemberVo d = new MemberVo();
				d.setMid(rs.getString("mid"));
				d.setIrum(rs.getString("irum"));
				d.setAddress(rs.getString("address"));
				d.setPhone(rs.getString("phone"));
				d.setGender(rs.getString("gender"));
				v.add(d);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			return v;
		}
	}
	
	public int insert(){
		int cnt=0;
		PreparedStatement pstmt = null;
		String sql =
			"insert into vmember(mid, irum, gender, address, " +
			"phone, mlevel, picture, zipcode, pwd) values" +
			"(?,?,?,?,?,?,?,?,?)";
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getMid());
			pstmt.setString(2, m.getIrum());
			pstmt.setString(3, m.getGender());
			pstmt.setString(4, m.getAddress());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getMlevel());
			pstmt.setString(7, m.getPicture());
			pstmt.setString(8, m.getZip1()+ "-" + m.getZip2());
			pstmt.setString(9, m.getPwd());
			
			cnt = pstmt.executeUpdate();
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			return cnt;
		}
	}
	
	public MemberVo select(String mid){
		String sql = "select * from vmember where mid=?";
		PreparedStatement pstmt = null;
		MemberVo d= new MemberVo();
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,mid);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				d.setMid(rs.getString("mid"));
				d.setIrum(rs.getString("irum"));
				d.setAddress(rs.getString("address"));
				d.setPhone(rs.getString("phone"));
				d.setGender(rs.getString("gender"));
				d.setMlevel(rs.getString("mlevel"));
				d.setZipcode(rs.getString("zipcode"));
				d.setPwd(rs.getString("pwd"));
				d.setPicture(rs.getString("picture"));
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			return d;
		}
	}
	
	public int update(){
		int cnt=0;
		String sql = "update vmember set irum=? , address=? , " +
					" phone=?, gender=?, zipcode=?, picture=? , " +
					" mlevel=? , pwd=?  where mid=? ";
		PreparedStatement pstmt=null;
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getIrum());
			pstmt.setString(2, m.getAddress());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getGender());
			pstmt.setString(5, m.getZip1() + "-" + m.getZip2());
			pstmt.setString(6, m.getPicture());
			pstmt.setString(7, m.getMlevel());
			pstmt.setString(8, m.getPwd());
			pstmt.setString(9, m.getMid());
			cnt = pstmt.executeUpdate();
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			return cnt;	
		}
		
	}
	public int delete(){
		int cnt = 0;
		
		return cnt;
	}
	
	
}








