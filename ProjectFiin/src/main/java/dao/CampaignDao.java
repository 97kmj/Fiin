package dao;

import java.util.List;

import dto.Campaign;

public interface CampaignDao {
	void registerCampaign(Campaign campaign) throws Exception;
	Campaign selectCampaign(Integer campaignNum)throws Exception;
	Integer selectCampaignCount()throws Exception;
	List<Campaign> selectCampaignList(Integer row, String channel, Integer categoryId) throws Exception;
	List<Campaign> selectCampaignListForMain() throws Exception;
}
