package service;

import java.util.List;

import dto.Campaign;
import dto.Category;
import util.PageInfo;


public interface CampaignService {
    Campaign findCampaignByNum(Integer cam) throws Exception;

    List<Campaign> campaignListForMain()throws Exception;
    List<Campaign> campaignListForAdvertiser(Integer advertiserNum) throws Exception;

    // 상민) 캠페인 등록 시 사용
    Campaign campaignRegister(Campaign cam) throws Exception;

    List<Campaign> campaignList(List<String> channel,Integer categoryId,PageInfo pageinfo)throws Exception;
    Campaign detail (Integer campaignNum) throws Exception;
    List<Category> categoryList() throws Exception;




}
