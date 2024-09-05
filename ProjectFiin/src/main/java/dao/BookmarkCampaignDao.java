package dao;

public interface BookmarkCampaignDao {
	void insertBookmarkCampaign(Integer influencerNum, Integer campaignNum) throws Exception;
	Integer selectBookmarkCampaign(Integer influencerNum, Integer campaignNum) throws Exception;
	void deleterBookmarkCampaign(Integer influencerNum, Integer campaignNum) throws Exception;
}
