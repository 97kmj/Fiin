package dao;

public interface BookmarkInfluencerDao {
	
	void insertBookmarkInfluencer(Integer advertiserNum, Integer influencerNum) throws Exception;
	
	Integer selectBookmarkInfluencer(Integer advertiserNum, Integer influencerNum) throws Exception;
	
	void deleteBookmarkInfluencer(Integer advertiserNum, Integer influencerNum) throws Exception;
}
