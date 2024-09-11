package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.ReceiveCampaign;
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
}
