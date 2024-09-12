package dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;

public class BookmarkInfluencerDaoImpl implements BookmarkInfluencerDao {

	private SqlSession sqlSession;
	public BookmarkInfluencerDaoImpl() {
		sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}
	
	@Override
	public void insertBookmarkInfluencer(Integer InfluencerNum, Integer CampaignNum) throws Exception {
		
	}

	@Override
	public Integer selectBookmarkInfluencer(Integer InfluencerNum, Integer CampaignNum) throws Exception {
		Map<String,Object> param = new HashMap<>();
		param.put("influencer_num", InfluencerNum);
		param.put("campaign_num", CampaignNum);
		
		return sqlSession.selectOne("mapper.bookmarkInfluencer.selectBookmarkInfluencer", param);
	}

	@Override
	public void deleteBookmarkInfluencer(Integer InfluencerNum, Integer CampaignNum) throws Exception {
		// TODO Auto-generated method stub

	}

}
