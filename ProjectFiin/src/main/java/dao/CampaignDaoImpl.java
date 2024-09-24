    package dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.Campaign;
import dto.Category;
import util.MybatisSqlSessionFactory;

public class CampaignDaoImpl implements CampaignDao {


	private SqlSession sqlSession;
	public CampaignDaoImpl() {
		sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}

	//상민 - 캠페인 등록
	@Override
	public void registerCampaign(Campaign campaign) throws Exception {
		sqlSession.insert("mapper.campaign.registerCampaign", campaign);
		sqlSession.commit();
	}

	@Override
	public Campaign selectCampaign(Integer campaignNum) throws Exception {
		return sqlSession.selectOne("mapper.campaign.selectCampaign", campaignNum);
	}

	@Override
	public Integer selectCampaignCount(List<String> channel, Integer categoryId) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("channel", channel);
		map.put("categoryId", categoryId);
		return sqlSession.selectOne("mapper.campaign.selectCampaignCount",map);
	}

	@Override
	public List<Campaign> selectCampaignList(Integer row, List<String> channel, Integer categoryId) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("categoryId", categoryId);
		map.put("channel", channel);
		map.put("row", row-1);
		return sqlSession.selectList("mapper.campaign.selectAllCampaign", map);
	}

	@Override
	public List<Campaign> selectCampaignListForMain() throws Exception {
		return sqlSession.selectList("mapper.campaign.selectCampaignListForMain");
	}
	
	@Override
	public List<Campaign> selectCampaignListForAdvertiser(Integer advertiserNum) throws Exception {
		return sqlSession.selectList("mapper.campaign.selectCampaignByAdNum",advertiserNum);
	}

	@Override
	public List<Category> selectCategoryList() throws Exception {
		return sqlSession.selectList("mapper.category.selectCategoryList");
	}

	@Override
	public void updatecampaignIsRecruit(Integer campaignNum, Integer status) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("campaignNum", campaignNum);
		map.put("status", status);
		sqlSession.update("mapper.campaign.CampaignIsRecruit", map);
		sqlSession.commit();
		
	}


	@Override
	public List<Campaign> selectCampaignListReceive(Integer influencerNum) throws Exception {

		return sqlSession.selectList("mapper.campaign.selectCampaignReceive",influencerNum);
	}
	
	
	@Override
	public List<Map<String,Object>> selectCampaignListRequest(Integer influencerNum) throws Exception {

		return sqlSession.selectList("mapper.campaign.selectCampaignRequest",influencerNum);
	}

	@Override
	public List<Campaign> selectCampaignListForRequest(Integer advertiserNum) throws Exception {
		return sqlSession.selectList("mapper.campaign.selectCampaignForRequest",advertiserNum);
	}

	@Override
	public List<Campaign> bookmarkCampaignForMypage(Integer influencerNum) throws Exception {
		return sqlSession.selectList("mapper.campaign.selectCampaignForBookmark",influencerNum);
	}

}
