package service;


import dao.InfluencerDao;
import dao.InfluencerDaoImpl;
import dto.Influencer;

public class InfluencerServiceImpl implements InfluencerService {

  private InfluencerDao influencerDao;

  public InfluencerServiceImpl() {
    influencerDao = new InfluencerDaoImpl();
  }

  @Override
  public Influencer register(Influencer inf) throws Exception {

//    Member smember = memberDao.selectMember(member.getId());
//    if(smember!=null) throw new Exception("아이디 중복 오류");
//    memberDao.insertMember(member);

//    Influencer inff = influencerDao.registerInfluencer(inf.);

    influencerDao.registerInfluencer(inf);
    //dao에 데이터를 넣으면 끝 맞는지?
    return inf;

  }

	@Override
	public void join(Influencer influencer) throws Exception {
		Influencer sinfluencer = influencerDao.selectInfluencer(influencer.getInfluencerNum());
		if (sinfluencer != null) throw new Exception("아이디 중복 오류");
		influencerDao.insertInfluencer(influencer);
	}

	@Override
	public void login(Integer influencerNum, String password) throws Exception {
		Influencer influencer = influencerDao.selectInfluencer(influencerNum);
		if (influencer == null) throw new Exception("로그인 아이디 오류");
		if (!password.equals(influencer.getPassword())) throw new Exception("비밀번호 오류");

	}

	@Override
	public boolean checkDoubleEmail(String userEmail) throws Exception {
		Influencer influencer = influencerDao.selectInfluencerByEmail(userEmail);
		if (influencer == null) return false;
		return true;
	}
}
