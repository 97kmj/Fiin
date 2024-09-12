package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.Point;
import dto.PointRecord;
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
	
	@Override
	public Integer getPointBalance(String type, Integer num) throws Exception {
		Map<String,Object> param = new HashMap<>();
		param.put("type", type);
		param.put("user_num", num);
		return sqlSession.selectOne("mapper.point.selectPointBalance",param);
	}
	
}
