package dao;

import java.util.List;
import java.util.Map;

public interface RequestCampaignDao {
	void insertRequestCampaign(Integer influencerNum, Integer campaignNum) throws Exception;
	Integer selectRequestCampaign(Integer influencerNum, Integer campaignNum) throws Exception;
	void deleteRequestCampaign(Integer influencerNum, Integer campaignNum) throws Exception;
	void updateRequestCampaignAccept(Integer requestNum)throws Exception;
	
	
	List<Map<String,Object>> selectRequestCampaignList(Integer advertiserNum) throws Exception;
}
