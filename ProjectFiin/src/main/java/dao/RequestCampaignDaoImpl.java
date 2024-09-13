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
		Map<String,Integer> param = new HashMap<>();
		param.put("influencerNum", influencerNum);
		param.put("campaignNum", campaignNum);
		sqlSession.selectOne("mapper.requestCampaign.insertRequestCampaign", param);
	}

	@Override
	public Integer selectRequestCampaign(Integer influencerNum, Integer campaignNum) throws Exception {
		return null;
	}

	@Override
	public void deleteRequestCampaign(Integer influencerNum, Integer campaignNum) throws Exception {


	}

}
