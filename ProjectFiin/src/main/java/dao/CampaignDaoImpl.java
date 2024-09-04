package dao;

import dto.Campaign;
import org.apache.ibatis.session.SqlSession;
import util.MybatisSqlSessionFactory;


public class CampaignDaoImpl implements CampaignDao {

  private SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();



  @Override
  public void registerCampaign(Campaign cam) throws Exception {

    sqlSession.insert("mapper.campaign.registerCampaign", cam);
    sqlSession.commit();
  }

}
