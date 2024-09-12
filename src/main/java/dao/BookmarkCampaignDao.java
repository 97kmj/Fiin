package dao;

public interface BookmarkCampaignDao {
	void insertBookmarkCampaign(Integer influencerNum, Integer campaignNum) throws Exception;
	Integer selectBookmarkCampaign(Integer influencerNum, Integer campaignNum) throws Exception;
	void deleteBookmarkCampaign(Integer influencerNum, Integer campaignNum) throws Exception;
}
