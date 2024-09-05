package util;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisSqlSessionFactory {
<<<<<<< HEAD
	private static SqlSessionFactory sqlSessionFactory;
	
	static {
		try {
			String resource = "resource/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			
			//SqlSessionFactoryBuilder 생성
			SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
			
			//SqlSessionFactory 생성
			sqlSessionFactory = builder.build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
=======
		private static SqlSessionFactory sqlSessionFactory;
		
		static {
			try {
				String resource = "resource/mybatis-config.xml";
				InputStream inputStream = Resources.getResourceAsStream(resource);
				
				//SqlSessionFactoryBuilder생성
				SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
				
				//SqlSessionFactory 생성
				sqlSessionFactory = builder.build(inputStream);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
>>>>>>> refs/remotes/origin/develop-jy
	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}
}
