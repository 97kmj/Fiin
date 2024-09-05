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
	public void insertPointRecord(String type, Integer num, Integer pointAmount) throws Exception {
		Map<String,Integer> param = new HashMap<>();
		param.put("user_num",num);
		param.put("point_amount", pointAmount);
		if (type.equals("influencer")) {
			sqlSession.insert("mapper.pointRecord.insertPointRecordInf", param);
			sqlSession.commit();
		} else {
			sqlSession.insert("mapper.pointRecord.insertPointRecordAd", param);
			sqlSession.commit();
		}
	}
	
	@Override
	public void updatePointBalance(String type, Integer num, Integer pointAmount) throws Exception {
		Map<String,Integer> param = new HashMap<>();
		param.put("user_num",num);
		param.put("point_amount", pointAmount);
		if (type.equals("influencer")) {
			sqlSession.update("mapper.pointRecord.updatePointBalanceInf", param);
			sqlSession.commit();
		} else {
			sqlSession.update("mapper.pointRecord.updatePointBalanceAd", param);
			sqlSession.commit();
		}
	}
	
}
