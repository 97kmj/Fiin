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
		sqlSession.insert("mapper.requestCampaign.insertRequestCampaign", param);
		sqlSession.commit();
	}

	@Override
	public Integer selectRequestCampaign(Integer influencerNum, Integer campaignNum) throws Exception {
		Map<String,Integer> param = new HashMap<>();
		param.put("influencerNum", influencerNum);
		param.put("campaignNum", campaignNum);
		return sqlSession.selectOne("mapper.requestCampaign.selectRequestCampaign",param);
	}

	@Override
	public void deleteRequestCampaign(Integer influencerNum, Integer campaignNum) throws Exception {
		Map<String,Integer> param = new HashMap<>();
		param.put("influencerNum", influencerNum);
		param.put("campaignNum", campaignNum);
		sqlSession.delete("mapper.requestCampaign.deleteRequestCampaign", param);
		sqlSession.commit();
	}

}
