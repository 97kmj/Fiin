package service;

import java.util.List;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import dto.Influencer;
import util.PageInfo;

public interface InfluencerService {

	Influencer register(Influencer influencer) throws Exception;

	void join(Influencer influencer) throws Exception;

	void login(Integer influencerNum, String password) throws Exception;

	boolean checkDoubleEmail(String userEmail) throws Exception;

	List<Influencer> influencerList(PageInfo pageInfo) throws Exception;
		
	Influencer influencerDetail(Integer influencerNum) throws Exception;

	Integer checkBookmarkCampaign(Integer InfluencerNum, Integer CampaignNum) throws Exception;

	boolean toggleBookmarkCampaign(Integer InfluencerNum, Integer CampaignNum) throws Exception;

	void registerInfluencer(HttpServletRequest request, ServletResponse response) throws Exception;
}
