package service;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

	//상민 - 인플루언서 등록
	@Override
	public Influencer influencerRegister(Influencer influencer) throws Exception {
		// Dto에서 받은 정보들을 dao에 전달

		influencerDao.registerInfluencer(influencer);
		return influencer;
	}

	//상민 - 인플루언서 찾기
	@Override
	public Influencer findInfluencerByNum(Integer influencerNum) throws Exception {
		return influencerDao.selectInfluencer(influencerNum);
	}

	@Override
	public List<Influencer> influencerListForMain() throws Exception {
		List<Influencer> influencers = influencerDao.selectInfluencerListForMain();
		return influencers;
	}

	@Override
	public List<Map<String,Object>> getInfluencerList(List<String> channels, String keyword, Integer categoryId, PageInfo pageInfo) throws Exception {
		
		Integer influencerCnt = influencerDao.selectAllInfluencerCount(keyword, channels, categoryId);
		
		Integer allPage = (int)Math.ceil((double)influencerCnt/8);
		Integer startPage = (pageInfo.getCurPage()-1)/8*8+1;
		Integer endPage = startPage+8-1;
		if(endPage>allPage) endPage = allPage;
		
		pageInfo.setAllPage(allPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		Integer row = (pageInfo.getCurPage()-1)*8+1;
		
		List<Map<String,Object>> influencerList = influencerDao.selectAllInfluencer(row, keyword, channels, categoryId);
		return influencerList;
			
	}

  @Override
	public String influencerFindEmail(String name, String mobileNumber) throws Exception {
		Influencer influencer = influencerDao.selectInfluencerForFindEmail(name, mobileNumber);
		if (influencer == null) throw new Exception("이메일 찾기 오류");
		return influencer.getUserEmail();
  }
	@Override
	public String influencerFindPassword(String userEmail) throws Exception {
		String password = influencerDao.selectInfluencerForFindPassword(userEmail);
		if (password == null) throw new Exception("비밀번호 찾기 오류");
		return password;
	}
	@Override
  public void imageView(HttpServletRequest request, OutputStream out, String file) throws Exception {
		FileInputStream fis = null;
		String path = request.getServletContext().getRealPath("upload");
		try {
			fis = new FileInputStream(new File(path,file));
			byte[] buff = new byte[4096];
			int len;
			while((len=fis.read(buff))>0) {
				out.write(buff,0,len);
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			try {
				if(fis!=null) fis.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}


	public void influencerModify(Influencer influencer) throws Exception {
		influencerDao.updateInfluencer(influencer);
	}
}


