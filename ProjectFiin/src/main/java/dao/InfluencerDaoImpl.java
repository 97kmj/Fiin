package dao;

import dto.Influencer;
import org.apache.ibatis.session.SqlSession;
import util.MybatisSqlSessionFactory;


public class InfluencerDaoImpl implements InfluencerDao {
  private SqlSession sqlSession;
  public InfluencerDaoImpl() {
	sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
  
  }

  @Override
  public void registerInfluencer(Influencer inf) throws Exception {

    sqlSession.insert("mapper.influencer.registerInfluencer", inf);
    sqlSession.commit();
  }

  	@Override
	public void insertInfluencer(Influencer influencer) throws Exception {
		sqlSession.insert("mapper.influencer.insertInfluencer", influencer);
		sqlSession.commit();
	}

	@Override
	public Influencer selectInfluencer(Integer influencerNum) throws Exception {
		return sqlSession.selectOne("mapper.influencer.selectInfluencer", influencerNum);
	}

	@Override
	public Influencer selectInfluencerByEmail(String userEmail) throws Exception {
		return sqlSession.selectOne("mapper.influencer.selectInfluencerByEmail", userEmail);
	}
	
	@Override
	public void updateInfluencer(Influencer influencer) throws Exception {
		sqlSession.update("mapper.influencer.updateInfluencer", influencer);
		sqlSession.commit();
	}
}
