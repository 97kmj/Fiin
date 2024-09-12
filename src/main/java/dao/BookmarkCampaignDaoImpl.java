package dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;

public class BookmarkCampaignDaoImpl implements BookmarkCampaignDao {
	private SqlSession sqlSession;
	public BookmarkCampaignDaoImpl() {
		sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}
	
	
	@Override
	public void insertBookmarkCampaign(Integer influencerNum, Integer campaignNum) throws Exception {
		Map<String,Integer> param = new HashMap<>();
		param.put("influencerNum", influencerNum);
		param.put("campaignNum", campaignNum);
		sqlSession.insert("mapper.bookmarkCampaign.insertBookmark",param);
		sqlSession.commit();
	}

	@Override
	public Integer selectBookmarkCampaign(Integer influencerNum, Integer campaignNum) throws Exception {
		Map<String,Integer> param = new HashMap<>();
		param.put("influencerNum", influencerNum);
		param.put("campaignNum", campaignNum);
		return sqlSession.selectOne("mapper.bookmarkCampaign.selectBookmark",param);
	}

	@Override
	public void deleteBookmarkCampaign(Integer influencerNum, Integer campaignNum) throws Exception {
		Map<String,Integer> param = new HashMap<>();
		param.put("influencerNum", influencerNum);
		param.put("campaignNum", campaignNum);
		sqlSession.delete("mapper.bookmarkCampaign.deleteBookmark",param);
		sqlSession.commit();
	}

}
