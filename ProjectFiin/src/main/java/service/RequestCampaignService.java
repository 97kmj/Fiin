package service;

public interface RequestCampaignService {
	
	boolean requestCampaign(Integer influencerNum, Integer campaignNum)throws Exception;
	void acceptCampaign(Integer requestNum) throws Exception;
}
