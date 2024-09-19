package service;

import java.util.List;

import dto.Campaign;
import dto.Category;
import util.PageInfo;


public interface CampaignService {
    Campaign findCampaignByAdNum(Integer cam) throws Exception;

    List<Campaign> campaignListForMain()throws Exception;
    List<Campaign> campaignListForAdvertiser(Integer advertiserNum) throws Exception;

    List<Campaign> campaignList(List<String> channel,Integer categoryId,PageInfo pageinfo)throws Exception;
    Campaign detail (Integer campaignNum) throws Exception; 
    List<Category> categoryList() throws Exception;
    void campaignIsRecruit(Integer campaignNum,Integer status)throws Exception;
    boolean toggleCampaign(Integer campaignNum, Integer Influencer)throws Exception;
	  Integer checkBookmark(Integer influencerNum, Integer campaignNum)throws Exception;

    // 상민) 캠페인 등록 시 사용
    Campaign campaignRegister(Campaign cam) throws Exception;

}
