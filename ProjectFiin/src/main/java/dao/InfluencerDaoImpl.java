package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Locale.Category;

import org.apache.ibatis.session.SqlSession;

import dto.Influencer;
import util.MybatisSqlSessionFactory;

public class InfluencerDaoImpl implements InfluencerDao {
	private SqlSession sqlSession;
	
	public InfluencerDaoImpl() {
		  sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
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
	public List<Influencer> selectInfluencerList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.influencer.selectInfluencerList", row-1);
    }

	@Override
	public void registerInfluencer(Influencer influencer) throws Exception {
		sqlSession.insert("mapper.influencer.registerInfluencer", influencer);
		sqlSession.commit();
	}

	@Override
	public Category selectCategory(Integer categoryId) throws Exception {
		return sqlSession.selectOne("mapper.category.selectCategory", categoryId); 
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
	public Influencer selectInfluencerForFindId(String name, String mobileNumber) throws Exception {
		Map<String,Object> param = new HashMap<>();
		param.put("name", name);
		param.put("mobileNumber", mobileNumber);
		return sqlSession.selectOne("mapper.influencer.selectInfluencerForFindId", param);
	}
}
