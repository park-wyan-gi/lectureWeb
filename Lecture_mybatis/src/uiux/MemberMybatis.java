package uiux;

import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import org.apache.ibatis.session.SqlSession;

public class MemberMybatis {
	private MemberVo memberVo;
	private SqlSession session;
	public MemberMybatis(){
		try{
			session = MemberFactory.getFactory().openSession();
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}

	
//	// Dao + Connection 연결 여부 테스트 메서드
//	public List display(){
//		String temp = "";
//		temp = "%" + m.getFindStr() + "%";
//		List<MemberDao> v = null;
//		try{
//			SqlSession session = ssf.openSession();
//			MemberDao dao = session.getMapper(uiux.MemberDao.class);
//			dao.
//		}catch(Exception ex){
//			ex.printStackTrace();
//		}finally{
//			return v;
//		}
//	}
//	
//	public int insert(){
//		int cnt=0;
//		try{
//			//TODO
//			sqlMap.insert("m_insert", m);
//		}catch(Exception ex){
//			ex.printStackTrace();
//		}finally{
//			return cnt;
//		}
//	}
	public ArrayList<MemberVo> select(){
		ArrayList<MemberVo> list=null;
		try{
			list = (ArrayList)session.selectList("member.select","%"+memberVo.getFindStr()+ "%");
			
			for(int i=0 ; i<list.size() ; i++) System.out.println(list.get(i).getMid());
			
			
			session.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return list;
	}
	
	public MemberVo view(){
		try{
			memberVo= (MemberVo)session.selectOne("member.select_mid",memberVo.getMid());
			session.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			return memberVo;
		}
	}
	
	
	
	public int update(){
		int cnt=0;
		try{
			cnt= session.update("member.select_mid",memberVo.getMid());
			session.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return cnt;
	}
	public int delete(){
		int cnt=0;
		try{
			cnt= session.delete("member.select_mid",memberVo.getMid());
			session.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return cnt;
	}
	
	
	
	
	public static void main(String[] args){
		MemberMybatis mm = new MemberMybatis();
	}


	public MemberVo getMemberVo() {
		return memberVo;
	}


	public void setMemberVo(MemberVo memberVo) {
		this.memberVo = memberVo;
	}
	
}








