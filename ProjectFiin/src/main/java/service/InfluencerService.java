package service;

import java.util.List;

import dto.Influencer;
import util.PageInfo;

public interface InfluencerService {
	void join(Influencer influencer) throws Exception;
	Influencer login(String userEmail, String password) throws Exception;
	boolean checkDoubleEmail(String userEmail) throws Exception;
	Influencer influencerRegister(Influencer influencer) throws Exception;
	Influencer influencerDetail(Integer influencerNum) throws Exception;
	Integer checkBookmarkCampaign(Integer InfluencerNum, Integer CampaignNum) throws Exception;
	boolean toggleBookmarkCampaign(Integer InfluencerNum, Integer CampaignNum) throws Exception;
	List<Influencer> influencerListForMain() throws Exception;
	List<Influencer> influencerList(PageInfo pageInfo) throws Exception;
	List<Influencer> influencerListByChannels(PageInfo pageInfo, String categoryId, String[] channels);

}
