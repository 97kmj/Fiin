package service;

import java.util.List;
import java.util.Map;

import dto.Campaign;

public interface ReceiveCampaignService {
	List<Map<String,Object>> getReceiveList(Integer campaginNum) throws Exception;
	void acceptInfluencer(Integer applyNum) throws Exception;

  void requestCampaign(Integer campaignNum, Integer influencerNum);

	boolean receiveCampaign(Integer Influencer,Integer campaignNum)throws Exception;

}
