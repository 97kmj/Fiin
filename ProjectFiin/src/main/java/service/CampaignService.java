package service;

import java.util.List;

import dto.Campaign;
import util.PageInfo;

public interface CampaignService {
	List<Campaign> campaignList(PageInfo pageinfo)throws Exception;
}
