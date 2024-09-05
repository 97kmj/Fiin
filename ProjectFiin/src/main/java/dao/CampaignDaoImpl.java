package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.Campaign;
import util.MybatisSqlSessionFactory;

public class CampaignDaoImpl implements CampaignDao {

	private SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	@Override
	public void registerCampaign(Campaign cam) throws Exception {
		sqlSession.insert("mapper.campaign.registerCampaign", cam);
		sqlSession.commit();
	}

	@Override
	public Campaign selectCampaign(Integer campaignNum) throws Exception {
		return sqlSession.selectOne("mapper.campaign.selectCampaign", campaignNum);
	}

	@Override
	public Integer selectCampaignCount() throws Exception {
		return sqlSession.selectOne("mapper.campaign.selectCampaignCount");
	}

	@Override
	public List<Campaign> selectCampaignList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.campaign.selectAllCampaign", row);
	}
}
