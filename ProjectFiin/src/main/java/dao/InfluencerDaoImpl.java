package dao;


import dto.Influencer;
import dto.Campaign;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import util.MybatisSqlSessionFactory;


public class InfluencerDaoImpl implements InfluencerDao {

  private SqlSession sqlSession;

  public InfluencerDaoImpl() {
    sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
  }

	@Override
	public Integer selectAllInfluencerCount(String keyword, List<String> channels, Integer categoryId)
			throws Exception {
		Map<String,Object>map = new HashMap<>();
		map.put("channels", channels);
		map.put("categoryId", categoryId);
		map.put("keyword", keyword);
		return sqlSession.selectOne("mapper.influencer.selectAllInfluencerCount",map);
	}
	@Override
	public List<Map<String,Object>> selectAllInfluencer(Integer row, String keyword, List<String> channels, Integer categoryId) throws Exception {
		Map<String,Object>map = new HashMap<>();
		map.put("channels", channels);
		map.put("row", row-1);
		map.put("categoryId", categoryId);
		map.put("keyword", keyword);
		return sqlSession.selectList("mapper.influencer.selectAllInfluencer", map);
    }

	// 상민 - 인플루언서 등록
	@Override
	public void registerInfluencer(Influencer influencer) throws Exception {
		sqlSession.update("mapper.influencer.updateInfluencerRegister", influencer);
		System.out.println(influencer);
		sqlSession.commit();
	}

  @Override
  public void insertInfluencer(Influencer influencer) throws Exception {
    sqlSession.insert("mapper.influencer.insertInfluencer", influencer);
    sqlSession.commit();
  }

  @Override
  public Influencer selectInfluencer(Integer influencerNum) throws Exception {
    return sqlSession.selectOne("mapper.influencer.selectInfluencer", influencerNum);
  }

  @Override
  public Influencer selectInfluencerByEmail(String userEmail) throws Exception {
    return sqlSession.selectOne("mapper.influencer.selectInfluencerByEmail", userEmail);
  }

  @Override
  public void updateInfluencer(Influencer influencer) throws Exception {
    sqlSession.update("mapper.influencer.updateInfluencer", influencer);
    sqlSession.commit();
  }

  @Override
  public List<Map<String, Object>> selectInfluencerList(Integer row, String keyword,
      List<String> channels, Integer categoryId) throws Exception {
    Map<String, Object> map = new HashMap<>();
    map.put("channels", channels);
    map.put("row", row - 1);
    map.put("categoryId", categoryId);
    map.put("keyword", keyword);
    return sqlSession.selectList("mapper.influencer.selectAllInfluencer", map);
  }

  @Override
  public Integer selectInfluencerCount() throws Exception {
    return sqlSession.selectOne("mapper.influencer.selectInfluencerCount");
  }


  @Override
  public List<Influencer> selectInfluencerListForMain() throws Exception {
    return sqlSession.selectList("mapper.influencer.selectInfluencerListForMain");
  }

  @Override
  public Influencer selectInfluencerForFindEmail(String name, String mobileNumber)
      throws Exception {
    Map<String, String> param = new HashMap<>();
    param.put("name", name);
    param.put("mobileNumber", mobileNumber);
    return sqlSession.selectOne("mapper.influencer.selectInfluencerForFindEmail", param);
  }

  @Override
  public String selectInfluencerForFindPassword(String userEmail) throws Exception {
    return sqlSession.selectOne("mapper.influencer.selectInfluencerForFindPassword", userEmail);
  }

	
	//민준 - 캠페인의 카테고리랑 희망채널이 일치하는 인플루언서들의 이메일 목록 뽑아오기
	@Override
	public List<String> selectEmaliListByCampaign(Campaign campaign) throws Exception {
		Map<String,Object> param = new HashMap<>();
		String[] channels = campaign.getChannel().split("#");
		List<String> channelList = new ArrayList<>();
		for(String channel : channels) {
			channelList.add(channel);
		}
		param.put("channelList",channelList);
		param.put("categoryId", campaign.getCategoryId());
		return sqlSession.selectList("mapper.influencer.selectEmaliListByCampaign",param);
	}
}

