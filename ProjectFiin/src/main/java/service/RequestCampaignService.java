package service;

import java.util.List;
import java.util.Map;

public interface RequestCampaignService {
	
	boolean requestCampaign(Integer influencerNum, Integer campaignNum)throws Exception;
	void acceptCampaign(Integer requestNum) throws Exception;

	
	List<Map<String,Object>> getRequestInfluencerList(Integer advertiserNum) throws Exception;
}
