package dao;

import java.util.List;
import java.util.Map;

import dto.Campaign;
import dto.Influencer;


public interface InfluencerDao {
	//상민 - 인플루언서 수정하기
	void updateRegisteredInfluencer(Influencer influencer) throws Exception;

	//상민 - 인플루언서 등록하기
	void registerInfluencer(Influencer influencer) throws Exception;

  // 상민 - 인플루언서 등록 시, 포인트 차감
  Influencer usePointsByInfluencer(Influencer influencer, int usedPoint) throws Exception;

  void insertInfluencer(Influencer influencer) throws Exception;
	Influencer selectInfluencer(Integer influencerNum) throws Exception;
	Influencer selectInfluencerByEmail(String userEmail) throws Exception;
	void updateInfluencer(Influencer influencer) throws Exception;
	Integer selectAllInfluencerCount(String keyword, List<String> channels, Integer categoryId) throws Exception;
	List<Map<String,Object>> selectAllInfluencer(Integer row, String keyword, List<String> channels, Integer categoryId) throws Exception;
	Integer selectInfluencerCount() throws Exception;
	List<Influencer> selectInfluencerListForMain() throws Exception;

	List<Influencer> bookmarkInfluecerForMypage(Integer advertiserNum) throws Exception;
	Map<String, Object> selectInfluencerDetail(Integer influencerNum) throws Exception;

	String selectInfluencerEmail(String name, String mobileNumber) throws Exception;
	String selectInfluencerPassword(String userEmail) throws Exception;

	//민준 - 캠페인의 카테고리랑 희망채널이 일치하는 인플루언서들의 이메일 목록 뽑아오기
	List<String> selectEmaliListByCampaign(Campaign campaign) throws Exception;
}
