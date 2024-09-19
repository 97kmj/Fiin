package service;

import dao.RequestCampaignDao;
import dao.RequestCampaignDaoImpl;

public class RequestCampaignServiceImpl implements RequestCampaignService {
	
	private RequestCampaignDao requestCampaignDao;
	public RequestCampaignServiceImpl() {
		
		requestCampaignDao = new RequestCampaignDaoImpl();					
	}
	
	@Override
	public boolean requestCampaign(Integer influencerNum, Integer campaignNum) throws Exception {
		System.out.println(influencerNum);
		System.out.println(campaignNum);
		Integer request = requestCampaignDao.selectRequestCampaign(influencerNum, campaignNum);

		if(request==null) {
			requestCampaignDao.insertRequestCampaign(influencerNum, campaignNum);
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public void acceptCampaign(Integer requestNum) throws Exception {
		requestCampaignDao.updateRequestCampaignAccept(requestNum);
	}

}
