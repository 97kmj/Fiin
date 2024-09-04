package service;


import dao.CampaignDao;
import dao.CampaignDaoImpl;
import dao.InfluencerDao;
import dao.InfluencerDaoImpl;
import dto.Campaign;
import dto.Influencer;

public class CampaignServiceImpl implements CampaignService {

  private CampaignDao campaignDao;

  public CampaignServiceImpl() {
    campaignDao = new CampaignDaoImpl();
  }

  @Override
  public Campaign register(Campaign cam) throws Exception {


    campaignDao.registerCampaign(cam);
    return cam;

  }
}
