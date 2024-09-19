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
		sqlSession.update("mapper.campaign.registerCampaign", campaign);
		sqlSession.commit();
	}

	// 상민 - 캠페인 수정
	@Override
	public void updateRegisteredCampaign(Campaign campaign) throws Exception {
		sqlSession.update("mapper.campaign.updateCampaignInfo", campaign);
		sqlSession.commit();
	}

	// 상민 - 인플루언서 등록 시, 포인트 차감
	@Override
	public Campaign usePointsByCampaign(Campaign campaign, int usedPoint) throws Exception {

		// Mapper에 전달할 파라미터를 맵으로 설정
		Map<String, Object> params = new HashMap<>();
		params.put("advertiserNum", campaign.getAdvertiserNum());
		params.put("usedPoint", usedPoint);

		sqlSession.update("mapper.campaign.usePointsByAdvertiser", params);
		sqlSession.commit();
		return campaign;
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
		
		sqlSession.update("mapper.requestCampaign.CampaignIsRecruit", map);
		sqlSession.commit();
		
	}

}
