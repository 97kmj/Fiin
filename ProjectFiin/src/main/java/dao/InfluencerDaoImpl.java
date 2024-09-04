package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.Influencer;
import util.MybatisSqlSessionFactory;

public class InfluencerDaoImpl implements InfluencerDao {

	private SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	@Override
	public void registerInfluencer(Influencer inf) throws Exception {

		sqlSession.insert("mapper.influencer.registerInfluencer", inf);
		sqlSession.commit();
	}

	@Override
	public void insertInfluencer(Influencer influencer) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public Influencer selectInfluencer(Integer num) throws Exception {
		return sqlSession.selectOne("mapper.influencer.selectInfluencer", num);
	}

	@Override
	public List<Influencer> selectInfluencerList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.influencer.selectInfluencerList", row-1);
	}
}
