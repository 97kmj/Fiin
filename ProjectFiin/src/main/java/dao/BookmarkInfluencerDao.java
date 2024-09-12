package dao;

public interface BookmarkInfluencerDao {
	
	void insertBookmarkInfluencer(Integer InfluencerNum, Integer CampaignNum) throws Exception;
	
	Integer selectBookmarkInfluencer(Integer InfluencerNum, Integer CampaignNum) throws Exception;
	
	void deleteBookmarkInfluencer(Integer InfluencerNum, Integer CampaignNum) throws Exception;
}
