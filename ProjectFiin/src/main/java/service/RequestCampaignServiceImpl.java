package service;

import dao.RequestCampaignDao;
import dao.RequestCampaignDaoImpl;

public class RequestCampaignServiceImpl implements RequestCampaignService {
	
	private RequestCampaignDao requestCampaignDao;
	public RequestCampaignServiceImpl() {
		
		requestCampaignDao = new RequestCampaignDaoImpl();					
	}
	
	@Override
	public boolean requestCampaign(Integer InfluencerNum, Integer campaignNum) throws Exception {
		System.out.println(InfluencerNum);
		System.out.println(campaignNum);
		Integer request = requestCampaignDao.selectRequestCampaign(InfluencerNum, campaignNum);

		if(request==null) {
			requestCampaignDao.insertRequestCampaign(InfluencerNum, campaignNum);
			return true;
		}else {
			requestCampaignDao.deleteRequestCampaign(InfluencerNum, campaignNum);
			return false;
		}
		
	}

	@Override
	public void insertRequestCampaign(Integer influencerNum, Integer campaignNum) throws Exception {
		requestCampaignDao.insertRequestCampaign(influencerNum, campaignNum);
	}
	

}
