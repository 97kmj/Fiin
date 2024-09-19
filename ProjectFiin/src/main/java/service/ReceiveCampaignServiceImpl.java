package service;

import java.util.List;
import java.util.Map;

import dao.ReceiveCampaignDao;
import dao.ReceiveCampaignDaoImpl;

public class ReceiveCampaignServiceImpl implements ReceiveCampaignService {

	ReceiveCampaignDao receiveCampaignDao;
	
	public ReceiveCampaignServiceImpl() {
		receiveCampaignDao = new ReceiveCampaignDaoImpl();
	}
	
	@Override
	public List<Map<String,Object>> getReceiveList(Integer campaginNum) throws Exception {
		return receiveCampaignDao.selectReceiveCampaignList(campaginNum);
	}
	
	@Override
	public void acceptInfluencer(Integer applyNum) throws Exception {
		receiveCampaignDao.updateReceiveCampaignAccept(applyNum);
	}

	@Override
	public void requestCampaign(Integer campaignNum, Integer influencerNum){
		receiveCampaignDao.requestedInfluencer(campaignNum, influencerNum);
	}

}
