package service;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import dao.BookmarkInfluencerDao;
import dao.BookmarkInfluencerDaoImpl;
import dao.InfluencerDao;
import dao.InfluencerDaoImpl;
import dto.Campaign;
import dto.Influencer;
import util.PageInfo;

public class InfluencerServiceImpl implements InfluencerService {

	private InfluencerDao influencerDao;
	private BookmarkInfluencerDao bookmarkInfluencerDao;
	
	public InfluencerServiceImpl() {
		influencerDao = new InfluencerDaoImpl();
		this.bookmarkInfluencerDao = new BookmarkInfluencerDaoImpl();
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
	public Map<String, Object> influencerDetail(Integer influencerNum) throws Exception {
		Map<String, Object> influencer = influencerDao.selectInfluencerDetail(influencerNum);
		if(influencer == null) throw new Exception("인플루언서를 찾지 못했습니다.");
		return influencer;
	}

	@Override
	public Integer checkBookmarkInfluencer(Integer advertiserNum, Integer influencerNum) throws Exception {
		return bookmarkInfluencerDao.selectBookmarkInfluencer(advertiserNum, influencerNum);
	}

	@Override
	public boolean toggleBookmarkInfluencer(Integer advertiserNum, Integer influencerNum) throws Exception {
		Integer ibookmarkNum = bookmarkInfluencerDao.selectBookmarkInfluencer(advertiserNum, influencerNum);
		if(ibookmarkNum==null) {
			bookmarkInfluencerDao.insertBookmarkInfluencer(advertiserNum, influencerNum);
			return true;
		} else {
			bookmarkInfluencerDao.deleteBookmarkInfluencer(advertiserNum, influencerNum);
			return false;
		}
	}

	//상민 - 인플루언서 등록
	@Override
	public Influencer influencerRegister(Influencer influencer) throws Exception {
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
		String userEmail = influencerDao.selectInfluencerEmail(name, mobileNumber);
		if (userEmail == null) throw new Exception("이메일 찾기 오류");
		return userEmail;
  }
	@Override
	public String influencerFindPassword(String userEmail) throws Exception {
		String password = influencerDao.selectInfluencerPassword(userEmail);
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

	@Override
	public void influencerModify(Influencer influencer) throws Exception {
		influencerDao.updateInfluencer(influencer);
	}
	
	
	//민준 - 캠페인의 카테고리랑 희망채널이 일치하는 인플루언서들의 이메일 목록 뽑아오기
	@Override
	public List<String> getEmaliListByCampaign(Campaign campaign) throws Exception {
		return influencerDao.selectEmaliListByCampaign(campaign);
	}
	@Override
	public List<Influencer> influencerBookmarkForMypage(Integer advertiserNum) throws Exception {
		return influencerDao.bookmarkInfluecerForMypage(advertiserNum);
	}
	
}


