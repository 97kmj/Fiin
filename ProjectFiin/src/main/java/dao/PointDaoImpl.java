package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.Point;
import util.MybatisSqlSessionFactory;

public class PointDaoImpl implements PointDao {

	private SqlSession sqlSession;
	public PointDaoImpl() {
		sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}
	@Override
	public List<Point> selectPointList() throws Exception {
		return sqlSession.selectList("mapper.point.selectPointList");
	}

}
