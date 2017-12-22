package begin;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BeginFactory {
   // 드라이버를 로딩, Connection정보를 갖고 있음.
   private static SqlSessionFactory factory;
   
   static{
      try{
         Reader reader=Resources.getResourceAsReader("begin_config.xml");
         factory = new SqlSessionFactoryBuilder().build(reader);
         
      }catch(Exception ex){
         System.out.println("BeginFactory : " );
         ex.printStackTrace();
      }
   }
   
   public static SqlSessionFactory getFactory(){
      return factory;
   }

}
