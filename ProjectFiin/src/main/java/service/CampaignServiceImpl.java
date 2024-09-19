package service;


import java.util.List;
import java.util.Map;

import dao.BookmarkCampaignDao;
import dao.BookmarkCampaignDaoImpl;
import dao.CampaignDao;
import dao.CampaignDaoImpl;
import dto.Campaign;
import dto.Category;

import util.PageInfo;

public class CampaignServiceImpl implements CampaignService {

	  private BookmarkCampaignDao bookmarkCampaignDao;
	  private CampaignDao campaignDao;
	  public CampaignServiceImpl() {
	    campaignDao = new CampaignDaoImpl();
	    bookmarkCampaignDao = new BookmarkCampaignDaoImpl();
	  }
	  
	  @Override
	  public List<Campaign> campaignList(List<String> channel, Integer categoryId, PageInfo pageinfo) throws Exception {
		  Integer campaignCnt = campaignDao.selectCampaignCount(channel,categoryId);
		  Integer allPage = (int)Math.ceil((double)campaignCnt/8);
		  Integer startPage =(pageinfo.getCurPage()-1)/8*8+1;
			
		  Integer endPage = startPage+8-1;
		  if (endPage>allPage) endPage = allPage;
		  pageinfo.setAllPage(allPage);
	      pageinfo.setStartPage(startPage);
		  pageinfo.setEndPage(endPage);
			
		  Integer row = (pageinfo.getCurPage()-1)*8+1;

		  
		  return campaignDao.selectCampaignList(row,channel,categoryId);
		}

	@Override
	public List<Campaign> campaignListForMain() throws Exception {
		return campaignDao.selectCampaignListForMain();
	}

	@Override
	public Campaign detail(Integer campaignNum) throws Exception {
		return campaignDao.selectCampaign(campaignNum);
	}
	@Override
	public List<Campaign> campaignListForAdvertiser(Integer advertiserNum) throws Exception {
		return campaignDao.selectCampaignListForAdvertiser(advertiserNum);
	}

	@Override
	public List<Category> categoryList() throws Exception {
		return campaignDao.selectCategoryList();
	}

	@Override
	public void campaignIsRecruit(Integer campaignNum, Integer status) throws Exception {
		
		campaignDao.updatecampaignIsRecruit(campaignNum,status);
	
	}



	@Override
	public boolean toggleCampaign(Integer Influencer,Integer campaignNum) throws Exception {
		Integer bookMark = bookmarkCampaignDao.selectBookmarkCampaign(Influencer,campaignNum);
		if(bookMark==null) {
			bookmarkCampaignDao.insertBookmarkCampaign(Influencer, campaignNum);
			return true;
		}else {
			bookmarkCampaignDao.deleteBookmarkCampaign(Influencer, campaignNum);
			return false;
		}
		
	}



	@Override
	public Integer checkBookmark(Integer influencerNum, Integer campaignNum) throws Exception {
		
		return bookmarkCampaignDao.selectBookmarkCampaign(influencerNum, campaignNum);
	}

  //상민 - 캠페인 찾기
  @Override
  public Campaign findCampaignByAdNum(Integer cam) throws Exception {
    return campaignDao.selectCampaign(cam);
  }

  // 상민 - 캠페인 등록 시 사용
  @Override
  public Campaign campaignRegister(Campaign campaign) throws Exception {
		//캠페인 정보 저장
    campaignDao.registerCampaign(campaign);
  		//광고주 포인트 기록,차감
		campaignDao.usePointsByCampaign(campaign, campaign.getCampaignNum());
    return campaign;
  }

@Override
public List<Campaign> getReceiveCampaignList(Integer influencerNum) throws Exception {
	  return campaignDao.selectCampaignListReceive(influencerNum);
}

@Override
public List<Campaign> campaignListForRequest(Integer advertiserNum) throws Exception {
	return campaignDao.selectCampaignListForRequest(advertiserNum);
}

public List<Campaign> campaignBookmarkForMypage(Integer influencerNum) throws Exception {
	return campaignDao.bookmarkCampaignForMypage(influencerNum);
}
public List<Map<String,Object>> getRequestCampaignList(Integer influencerNum) throws Exception {
  return campaignDao.selectCampaignListRequest(influencerNum);
}


}
