package dao;

public interface RequestCampaignDao {
	void insertRequestCampaign(Integer influencerNum, Integer campaignNum) throws Exception;
	Integer selectRequestCampaign(Integer influencerNum, Integer campaignNum) throws Exception;
	void deleteRequestCampaign(Integer influencerNum, Integer campaignNum) throws Exception;

}
