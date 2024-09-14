package service;

public interface RequestCampaignService {
	
	boolean requestCampaign(Integer Influencer,Integer campaignNum)throws Exception;
	void insertRequestCampaign(Integer influencerNum, Integer campaignNum) throws Exception;
}
