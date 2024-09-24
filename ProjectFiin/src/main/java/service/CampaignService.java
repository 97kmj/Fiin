package service;

import java.util.List;
import java.util.Map;

import dto.Campaign;
import dto.Category;
import util.PageInfo;


public interface CampaignService {
    List<Campaign> campaignListForMain()throws Exception;
    List<Campaign> campaignListForAdvertiser(Integer advertiserNum) throws Exception;

    List<Campaign> campaignList(List<String> channel,Integer categoryId,PageInfo pageinfo)throws Exception;
    Campaign detail (Integer campaignNum) throws Exception; 
    List<Category> categoryList() throws Exception;
    void campaignIsRecruit(Integer campaignNum,Integer status)throws Exception;
    boolean toggleCampaign(Integer campaignNum, Integer Influencer)throws Exception;

	  Integer checkBookmark(Integer influencerNum, Integer campaignNum)throws Exception;

    List<Campaign> getReceiveCampaignList (Integer influencerNum)throws Exception;
    List<Map<String,Object>> getRequestCampaignList (Integer influencerNum)throws Exception;

    List<Campaign> campaignListForRequest(Integer advertiserNum)throws Exception;
    List<Campaign> campaignBookmarkForMypage(Integer influencerNum) throws Exception;
    // 상민) 캠페인 등록 시 사용
    Campaign campaignRegister(Campaign cam, int addUploadPeriod) throws Exception;

    
    //민준 캠페인 모든정보 가져올떄 사용
    Campaign campaignDetail(Integer campaignNum) throws Exception;
}
