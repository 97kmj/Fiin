package dao;

import java.util.List;
import java.util.Map;

import dto.ReceiveCampaign;

public interface ReceiveCampaignDao {
	List<Map<String,Object>> selectReceiveCampaignList(Integer campaignNum) throws Exception;
	void updateReceiveCampaignAccept(Integer applyNum) throws Exception;

  void requestedInfluencer(Integer campaignNum, Integer influencerNum);

	void insertReceiveCampaign(Integer influencerNum, Integer campaignNum) throws Exception;
	Integer selectReceiveCampaign(Integer influencerNum, Integer campaignNum) throws Exception;
	void deleteReceiveCampaign(Integer influencerNum, Integer campaignNum) throws Exception;

}
