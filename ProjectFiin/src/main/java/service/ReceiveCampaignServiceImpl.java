package service;

import java.util.List;
import java.util.Map;

import dao.ReceiveCampaignDao;
import dao.ReceiveCampaignDaoImpl;
import dto.Campaign;

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
	
	@Override
	public void receiveCampaign(Integer influencer, Integer campaignNum) throws Exception {

		Integer receive = receiveCampaignDao.selectReceiveCampaign(influencer, campaignNum);
		if(receive==null) {
			receiveCampaignDao.insertReceiveCampaign(influencer, campaignNum);
			
		}else {
			receiveCampaignDao.deleteReceiveCampaign(influencer, campaignNum);
			
		}
	}
	
	public boolean receiveStatus(Integer influencerNum, Integer campaignNum) throws Exception{

		Integer receive = receiveCampaignDao.selectReceiveCampaign(influencerNum, campaignNum);
		if(receive==null) {
			return true;
		}else {
			return false;
		}
	}
} 
