package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	@Override
	public void insertPointRecord(Integer num, Integer pointAmount) throws Exception {
		Map<String,Integer> param = new HashMap<>();
		param.put("influencer_num",num);
		param.put("changePoint", pointAmount);
		sqlSession.insert("mapper.mapper.pointRecord.insertPointRecordInf", param);
	}
	
}
