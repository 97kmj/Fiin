package dao;

import org.apache.ibatis.session.SqlSession;

import dto.Category;
import util.MybatisSqlSessionFactory;

public class CategoryDaoImpl implements CategoryDao {
	
	private SqlSession sqlSession;
	public CategoryDaoImpl() {
		sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}
	
	@Override
	public Category selectCategory() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
