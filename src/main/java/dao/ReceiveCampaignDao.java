package dao;

import java.util.List;
import java.util.Map;

import dto.ReceiveCampaign;

public interface ReceiveCampaignDao {
	List<Map<String,Object>> selectReceiveCampaignList(Integer campaignNum) throws Exception;
	void updateReceiveCampaignAccept(Integer applyNum) throws Exception;
}
