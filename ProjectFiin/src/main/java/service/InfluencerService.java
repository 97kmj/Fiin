package service;

import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	List<Map<String,Object>> getInfluencerList(List<String> channels, Integer categoryId, PageInfo pageInfo)throws Exception;
	String influencerFindEmail(String name, String mobileNumber) throws Exception;
	String influencerFindPassword(String userEmail) throws Exception;
  	void imageView(HttpServletRequest request, OutputStream out, String file) throws Exception;
  	List<Influencer>searchInfluencerList(String keyword, PageInfo pageInfo) throws Exception;
}

