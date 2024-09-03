package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.Campaign;
import util.MybatisSqlSessionFactory;

public class CampaignDaoImpl implements CampaignDao {
	private SqlSession sqlSession;
	public CampaignDaoImpl() {
		sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}
	
	@Override
	public Campaign selectCampaign(Integer campaignNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer selectCampaignCount() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Campaign> selectCampaignList(Integer row) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
