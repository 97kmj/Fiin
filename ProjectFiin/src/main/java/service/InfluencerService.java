package service;

import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import dto.Campaign;
import dto.Influencer;
import util.PageInfo;

public interface InfluencerService {
	void join(Influencer influencer) throws Exception;
	Influencer login(String userEmail, String password) throws Exception;
	boolean checkDoubleEmail(String userEmail) throws Exception;
	Influencer influencerDetail(Integer influencerNum) throws Exception;
	Integer checkBookmarkInfluencer(Integer advertiserNum, Integer influencerNum) throws Exception;
	boolean toggleBookmarkInfluencer(Integer advertiserNum, Integer influencerNum) throws Exception;
	List<Influencer> influencerListForMain() throws Exception;
	List<Map<String,Object>> getInfluencerList(List<String> channels, String keyword, Integer categoryId, PageInfo pageInfo)throws Exception;
	String influencerFindEmail(String name, String mobileNumber) throws Exception;
	String influencerFindPassword(String userEmail) throws Exception;
  
	void imageView(HttpServletRequest request, OutputStream out, String file) throws Exception;

  //상민 - 인플루언서 찾기
	Influencer findInfluencerByNum(Integer influencerNum) throws Exception;
  Influencer influencerRegister(Influencer influencer) throws Exception;
  
  void influencerModify(Influencer influencer) throws Exception;


	
	//민준 - 캠페인의 카테고리랑 희망채널이 일치하는 인플루언서들의 이메일 목록 뽑아오기 
	List<String> getEmaliListByCampaign(Campaign campaign) throws Exception;
}

