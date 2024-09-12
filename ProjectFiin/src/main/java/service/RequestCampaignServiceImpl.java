package service;

import dao.RequestCampaignDao;
import dao.RequestCampaignDaoImpl;

public class RequestCampaignServiceImpl implements RequestCampaignService {
	
	private RequestCampaignDao requestCampaignDao;
	public RequestCampaignServiceImpl() {
		requestCampaignDao = new RequestCampaignDaoImpl();					
	}
	
	@Override
	public boolean requestCampaign(Integer Influencer, Integer campaignNum) throws Exception {
		Integer request = requestCampaignDao.selectRequestCampaign(Influencer, campaignNum);
		if(request==null) {
			requestCampaignDao.insertRequestCampaign(Influencer, campaignNum);
			return true;
		}else {
			requestCampaignDao.deleteRequestCampaign(Influencer, campaignNum);
			return false;
		}
		
	}

}
