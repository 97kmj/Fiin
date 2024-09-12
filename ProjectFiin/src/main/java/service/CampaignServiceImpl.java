package service;


import dao.CampaignDao;
import dao.CampaignDaoImpl;
import dto.Campaign;
import dto.Category;
import java.util.List;
import util.PageInfo;

public class CampaignServiceImpl implements CampaignService {


  private CampaignDao campaignDao;

  public CampaignServiceImpl() {
    campaignDao = new CampaignDaoImpl();

  }

  //상민 - 캠페인 찾기
  @Override
  public Campaign findCampaignByNum(Integer cam) throws Exception {
    return campaignDao.selectCampaign(cam);
  }

  // 상민) 캠페인 등록 시 사용
  @Override
  public Campaign campaignRegister(Campaign cam) throws Exception {
    campaignDao.registerCampaign(cam);
    return cam;
  }

  @Override
  public List<Campaign> campaignList(List<String> channel, Integer categoryId, PageInfo pageinfo)
      throws Exception {
    Integer campaignCnt = campaignDao.selectCampaignCount(channel, categoryId);
    Integer allPage = (int) Math.ceil((double) campaignCnt / 8);
    Integer startPage = (pageinfo.getCurPage() - 1) / 8 * 8 + 1;

    Integer endPage = startPage + 8 - 1;
    if (endPage > allPage) {
      endPage = allPage;
    }
    pageinfo.setAllPage(allPage);
    pageinfo.setStartPage(startPage);
    pageinfo.setEndPage(endPage);

    Integer row = (pageinfo.getCurPage() - 1) * 8 + 1;

    return campaignDao.selectCampaignList(row, channel, categoryId);
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


}
