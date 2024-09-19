package dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;

public class RequestCampaignDaoImpl implements RequestCampaignDao {
	private SqlSession sqlSession;
	public RequestCampaignDaoImpl() {
		sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}
	@Override
	public void insertRequestCampaign(Integer influencerNum, Integer campaignNum) throws Exception {

	}

	@Override
	public Integer selectRequestCampaign(Integer influencerNum, Integer campaignNum) throws Exception {
		return null;
	}

	@Override
	public void deleteRequestCampaign(Integer influencerNum, Integer campaignNum) throws Exception {


	}
	@Override
	public void updateRequestCampaignAccept(Integer requestNum) throws Exception {
		sqlSession.update("mapper.requestCampaign.updateRequestCampaignAccept",requestNum);
		sqlSession.commit();
	}

}
