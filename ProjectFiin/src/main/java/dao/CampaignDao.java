package dao;

import java.util.List;

import dto.Campaign;

public interface CampaignDao {
	
	Campaign selectCampaign(Integer campaignNum)throws Exception;
	
	Integer selectCampaignCount()throws Exception;
	
	List<Campaign> selectCampaignList(Integer row) throws Exception;

}
