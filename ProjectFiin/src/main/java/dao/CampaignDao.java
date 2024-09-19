package dao;

import java.util.List;
import java.util.Map;

import dto.Campaign;
import dto.Category;

public interface CampaignDao {

	//상민 - 캠페인 등록
	void registerCampaign(Campaign campaign) throws Exception;

  // 상민 - 캠페인 수정
  void updateRegisteredCampaign(Campaign campaign) throws Exception;

	// 상민 - 캠페인 등록 시, 포인트 차감
	Campaign usePointsByCampaign(Campaign campaign, int usedPoint) throws Exception;

	Campaign selectCampaign(Integer campaignNum)throws Exception;
	Integer selectCampaignCount(List<String> channels, Integer categoryId)throws Exception;
	List<Campaign> selectCampaignList(Integer row, List<String> channel, Integer categoryId) throws Exception;
	List<Category> selectCategoryList() throws Exception;
	List<Campaign> selectCampaignListReceive(Integer influencer)throws Exception;
	List<Map<String,Object>> selectCampaignListRequest(Integer influencer)throws Exception;
	
	List<Campaign> selectCampaignListForMain() throws Exception;
	List<Campaign> selectCampaignListForAdvertiser(Integer advertiserNum) throws Exception;

	void updatecampaignIsRecruit(Integer campaignNum,Integer status) throws Exception;
	List<Campaign> selectCampaignListForRequest(Integer advertiserNum)throws Exception;
	List<Campaign> bookmarkCampaignForMypage(Integer influencerNum) throws Exception;
}
