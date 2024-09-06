package service;


import dao.InfluencerDao;
import dao.InfluencerDaoImpl;
import dto.Influencer;
import java.util.List;
import util.PageInfo;

public class InfluencerServiceImpl implements InfluencerService {

	private InfluencerDao influencerDao;


	public InfluencerServiceImpl() {
		influencerDao = new InfluencerDaoImpl();
	}

	@Override
	public void join(Influencer influencer) throws Exception {
		Influencer sinfluencer = influencerDao.selectInfluencer(influencer.getInfluencerNum());
		if (sinfluencer != null)
			throw new Exception("아이디 중복 오류");
		influencerDao.insertInfluencer(influencer);
	}

	@Override

	public Influencer login(String userEmail, String password) throws Exception {
		Influencer influencer = influencerDao.selectInfluencerByEmail(userEmail);
		if (influencer == null) throw new Exception("로그인 아이디 오류");
		if (!password.equals(influencer.getPassword())) throw new Exception("비밀번호 오류");
		return influencer;

	}

	@Override
	public boolean checkDoubleEmail(String userEmail) throws Exception {
		Influencer influencer = influencerDao.selectInfluencerByEmail(userEmail);
		if (influencer == null)
			return false;
		return true;
	}

	@Override
	public List<Influencer> influencerList(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Influencer influencerRegister(Influencer influencer) throws Exception {
		// Dto에서 받은 정보들을 dao에 전달
		influencerDao.registerInfluencer(influencer);
		return influencer;
	}

}






