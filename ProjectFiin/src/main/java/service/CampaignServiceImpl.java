package service;

import java.util.List;

import dao.CampaignDao;
import dao.CampaignDaoImpl;
import dto.Campaign;
import util.PageInfo;

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
	  
	  @Override
	  public List<Campaign> campaignList(String channel,Integer categoryId,PageInfo pageinfo) throws Exception {
		  Integer campaignCnt = campaignDao.selectCampaignCount();
		  Integer allPage = (int)Math.ceil((double)campaignCnt/8);
		  Integer startPage =(pageinfo.getCurPage()-1)/8*8+1;
			
		  Integer endPage = startPage+8-1;
		  if (endPage>allPage) endPage = allPage;
		  pageinfo.setAllPage(allPage);
	      pageinfo.setStartPage(startPage);
		  pageinfo.setEndPage(endPage);
			
		  Integer row = (pageinfo.getCurPage()-1)*8+1;
		  System.out.println(row);
		  return campaignDao.selectCampaignList(row,channel,categoryId);
		}

	@Override
	public List<Campaign> campaignListForMain() throws Exception {
		return campaignDao.selectCampaignListForMain();
	}
}
