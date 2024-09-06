package service;

import java.util.List;

import dto.Campaign;
import util.PageInfo;


public interface CampaignService {
    Campaign register(Campaign campaign) throws Exception;
    List<Campaign> campaignList(String channel,Integer categoryId,PageInfo pageinfo)throws Exception;

}
