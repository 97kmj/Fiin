package dao;

public interface BookmarkInfluencerDao {
	void insertBookmarkInfluencer(Integer advertiserNum, Integer InfluencerNum) throws Exception;
	Integer selecetBookmarkInfluencer(Integer advertiserNum, Integer InfluencerNum) throws Exception;
	void deleteBookmarkInfluencer(Integer advertiserNum, Integer InfluencerNum) throws Exception;
}
