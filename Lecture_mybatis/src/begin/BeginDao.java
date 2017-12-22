package begin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;


public class BeginDao {

   SqlSession sqlSession;
   
   public BeginDao() {
      try{
         sqlSession = BeginFactory.getFactory().openSession();
      }catch(Exception ex){
         System.out.println("BeginDao :");
         System.out.println(ex.toString());
      }
   }
   
   // 파라메터가 없는 경우
   public int count(){
      int r = 0;
      
      try{
         r = (int)sqlSession.selectOne("begin.count");
         sqlSession.close();
      }catch(Exception ex){
         System.out.println("count() : ");
         ex.printStackTrace();
      }finally{
         sqlSession.close();
         return r;
      }
   }
   
   //파라메터가 String
   public String getPwd(String mid){
      String pwd="";
      try{
         pwd = (String)sqlSession.selectOne("begin.getPwd", mid );
         sqlSession.close();
      }catch(Exception ex){
         ex.printStackTrace();
      }finally{
         return pwd;
      }
   }
   
   // 결과값이  boolean인 경우
   public boolean login(BeginVo vo){
      boolean b=false;
      
      try{
         b = (boolean)sqlSession.selectOne("begin.login", vo);
      }catch(Exception ex){
         ex.printStackTrace();
      }finally{
         return b;
      }
   }
   
   // 결과값, 파라메터가 모두  object인 경우
   public BeginVo view(BeginVo vo){
      BeginVo v = null;
      
      try{
         v = (BeginVo)sqlSession.selectOne("begin.view", vo);
      }catch(Exception ex){
         ex.printStackTrace();
      }finally{
         return v;
      }
   }
   
   // 결과값이  collection형인 경우
   public List<BeginVo> list(BeginVo vo){
      List<BeginVo> l = null;
      
      try{
         l = (List)sqlSession.selectList("begin.list", vo);
      }catch(Exception ex){
         ex.printStackTrace();
      }finally{
         return l;
      }
   }
   
   
   

}
