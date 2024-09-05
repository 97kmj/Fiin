package dao;

public interface BookmarkCampaignDao {
	void insertBookmarkAdvertiser(Integer influencerNum, Integer campaignNum) throws Exception;
	Integer selectBookmarkAdvertiser(Integer influencerNum, Integer campaignNum) throws Exception;
	void deleterBookmarkAdvertiser(Integer influencerNum, Integer campaignNum) throws Exception;
}
