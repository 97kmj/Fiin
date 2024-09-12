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
	public void insertBookmarkInfluencer(Integer advertiserNum, Integer influencerNum) throws Exception {
		Map<String,Object> param = new HashMap<>();
		param.put("advertiser_num", advertiserNum);
		param.put("influencer_num", influencerNum);
		sqlSession.insert("mapper.bookmarkInfluencer.insertBookmarkInfluencer", param);
		sqlSession.commit();
	}

	@Override
	public Integer selectBookmarkInfluencer(Integer advertiserNum, Integer influencerNum) throws Exception {
		Map<String,Object> param = new HashMap<>();
		param.put("advertiser_num", advertiserNum);
		param.put("influencer_num", influencerNum);
		
		return sqlSession.selectOne("mapper.bookmarkInfluencer.selectBookmarkInfluencer", param);
	}

	@Override
	public void deleteBookmarkInfluencer(Integer advertiserNum, Integer influencerNum) throws Exception {
		Map<String,Object> param = new HashMap<>();
		param.put("advertiser_num", advertiserNum);
		param.put("influencer_num", influencerNum);
		sqlSession.delete("mapper.bookmarkInfluencer.deleteBookmarkInfluencer", param);
		sqlSession.commit();
	}

}
