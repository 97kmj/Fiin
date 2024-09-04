package dao;

import dto.Influencer;
import org.apache.ibatis.session.SqlSession;
import util.MybatisSqlSessionFactory;


public class InfluencerDaoImpl implements InfluencerDao {

  private SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();



  @Override
  public void registerInfluencer(Influencer inf) throws Exception {

    sqlSession.insert("mapper.influencer.registerInfluencer", inf);
    sqlSession.commit();
  }
}
