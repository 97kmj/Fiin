package service;

<<<<<<< HEAD

import java.util.List;

import dto.Campaign;
import util.PageInfo;

public interface CampaignService {

  Campaign register(Campaign campaign) throws Exception;
  
  List<Campaign> campaignList(PageInfo pageinfo)throws Exception;
  
=======
import java.util.List;

import dto.Campaign;
import util.PageInfo;

public interface CampaignService {
	List<Campaign> campaignList(PageInfo pageinfo)throws Exception;
>>>>>>> refs/remotes/origin/develop-jy
}
