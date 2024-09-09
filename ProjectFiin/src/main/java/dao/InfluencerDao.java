package dao;

import java.util.List;
import java.util.Locale.Category;

import dto.Influencer;

public interface InfluencerDao {
	void registerInfluencer(Influencer influencer) throws Exception;
	void insertInfluencer(Influencer influencer) throws Exception;
	Influencer selectInfluencer(Integer influencerNum) throws Exception;
	Influencer selectInfluencerByEmail(String userEmail) throws Exception;
	void updateInfluencer(Influencer influencer) throws Exception;
	List<Influencer> selectInfluencerList(Integer row) throws Exception;
	Category selectCategory(Integer categoryId) throws Exception;
	Integer selectInfluencerCount() throws Exception;
	List<Influencer> selectInfluencerListForMain() throws Exception;
	Influencer selectInfluencerForFindId(String name, String mobileNumber) throws Exception;
}
