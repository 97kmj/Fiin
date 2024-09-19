package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;

public class ReceiveCampaignDaoImpl implements ReceiveCampaignDao {

	SqlSession sqlSession;
	public ReceiveCampaignDaoImpl() {
		sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}
	
	@Override
	public List<Map<String,Object>> selectReceiveCampaignList(Integer campaignNum) throws Exception {

		return sqlSession.selectList("mapper.receiveCampaign.selectReceiveCampaignList",campaignNum);
	}

	@Override
	public void updateReceiveCampaignAccept(Integer applyNum) throws Exception {
		sqlSession.update("mapper.receiveCampaign.updateReceiveCampaignAccept", applyNum);
		sqlSession.commit();
	}

	@Override
	public void requestedInfluencer(Integer campaignNum, Integer influencerNum){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("campaignNum", campaignNum);
		params.put("influencerNum", influencerNum);
		sqlSession.selectList("mapper.receiveCampaign.requestedInfluencer", params);
	}
}
