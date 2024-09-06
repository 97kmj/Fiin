package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.PointRecord;
import util.MybatisSqlSessionFactory;

public class PointRecordDaoImpl implements PointRecordDao {

	private SqlSession sqlSession;
	public PointRecordDaoImpl() {
		sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
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
	public List<PointRecord> selectPointRecordList(String type, Integer num, Integer row) throws Exception {
		Map<String,Object> param = new HashMap<>();
		param.put("type",type);
		param.put("user_num",num);
		param.put("row", row-1);
		return sqlSession.selectList("mapper.pointRecord.selectPointRecordList", param);
	}
	
	@Override
	public Integer selectPointRecordCount(String type, Integer num) throws Exception {
		Map<String,Object> param = new HashMap<>();
		param.put("type", type);
		param.put("user_num", num);
		return sqlSession.selectOne("mapper.pointRecord.selectPointRecordCount", param);
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
