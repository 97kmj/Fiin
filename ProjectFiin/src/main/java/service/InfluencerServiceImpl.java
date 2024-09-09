package service;

import java.util.List;
import dao.BookmarkCampaignDao;
import dao.BookmarkCampaignDaoImpl;
import dao.InfluencerDao;
import dao.InfluencerDaoImpl;
import dto.Influencer;
import util.PageInfo;

public class InfluencerServiceImpl implements InfluencerService {

	private InfluencerDao influencerDao;
	private BookmarkCampaignDao bookmarkCampaignDao;
	
	public InfluencerServiceImpl() {
		influencerDao = new InfluencerDaoImpl();
		this.bookmarkCampaignDao = new BookmarkCampaignDaoImpl();
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
	public Influencer influencerDetail(Integer influencerNum) throws Exception {
		Influencer influencer = influencerDao.selectInfluencer(influencerNum);
		if(influencer == null) throw new Exception("인플루언서를 찾지 못했습니다.");
		return influencer;
	}

	@Override
	public Integer checkBookmarkCampaign(Integer InfluencerNum, Integer CampaignNum) throws Exception {
		return bookmarkCampaignDao.selectBookmarkCampaign(InfluencerNum, CampaignNum);
	}

	@Override
	public boolean toggleBookmarkCampaign(Integer InfluencerNum, Integer CampaignNum) throws Exception {
		Integer cbookmarkNum = bookmarkCampaignDao.selectBookmarkCampaign(InfluencerNum, CampaignNum);
		if(cbookmarkNum==null) {
			bookmarkCampaignDao.insertBookmarkCampaign(InfluencerNum, CampaignNum);
			return true;
		} else {
			bookmarkCampaignDao.deleteBookmarkCampaign(InfluencerNum, CampaignNum);
			return false;
		}
	}

	@Override
	public Influencer influencerRegister(Influencer influencer) throws Exception {
		// Dto에서 받은 정보들을 dao에 전달
		influencerDao.registerInfluencer(influencer);
		return influencer;

	}
	
	@Override
	public List<Influencer> influencerListForMain() throws Exception {
		List<Influencer> influencers = influencerDao.selectInfluencerListForMain();
		return influencers;
	}
	@Override
	public List<Influencer> influencerList(String channel, Integer categoryId, PageInfo pageInfo) throws Exception {
		Integer influencerCnt = influencerDao.selectInfluencerCount();
		Integer allPage = (int)Math.ceil((double)influencerCnt/8);
		Integer startPage = (pageInfo.getCurPage()-1/10*10+1);
		Integer endPage = startPage+10-1;
		if(endPage>allPage) endPage = allPage;
		
		pageInfo.setAllPage(allPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		Integer row = (pageInfo.getCurPage()-1)*10+1;
		return influencerDao.selectInfluencerList(row,channel,categoryId);
	}
}






