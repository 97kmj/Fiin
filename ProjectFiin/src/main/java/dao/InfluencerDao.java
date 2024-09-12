package dao;

import java.util.List;
import java.util.Map;

import dto.Campaign;
import dto.Influencer;


public interface InfluencerDao {
	void registerInfluencer(Influencer influencer) throws Exception;
	void insertInfluencer(Influencer influencer) throws Exception;
	Influencer selectInfluencer(Integer influencerNum) throws Exception;
	Influencer selectInfluencerByEmail(String userEmail) throws Exception;
	void updateInfluencer(Influencer influencer) throws Exception;
	Integer selectAllInfluencerCount(String keyword, List<String> channels, Integer categoryId) throws Exception;
	List<Map<String,Object>> selectAllInfluencer(Integer row, String keyword, List<String> channels, Integer categoryId) throws Exception;

  List<Map<String, Object>> selectInfluencerList(Integer row, String keyword,
      List<String> channels, Integer categoryId) throws Exception;

  Integer selectInfluencerCount() throws Exception;
	List<Influencer> selectInfluencerListForMain() throws Exception;
	Influencer selectInfluencerForFindEmail(String name, String mobileNumber) throws Exception;
	String selectInfluencerForFindPassword(String userEmail) throws Exception;

	//민준 - 캠페인의 카테고리랑 희망채널이 일치하는 인플루언서들의 이메일 목록 뽑아오기
	List<String> selectEmaliListByCampaign(Campaign campaign) throws Exception;
}
