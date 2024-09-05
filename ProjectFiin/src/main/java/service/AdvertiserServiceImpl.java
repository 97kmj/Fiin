package service;

import dao.AdvertiserDao;
import dao.AdvertiserDaoImpl;
import dto.Advertiser;

public class AdvertiserServiceImpl implements AdvertiserService {
	private AdvertiserDao advertiserDao;
	public AdvertiserServiceImpl() {
		advertiserDao = new AdvertiserDaoImpl();
	}
	
	@Override
	public void join(Advertiser advertiser) throws Exception {
		Advertiser sadvertiser = advertiserDao.selectAdvertiser(advertiser.getAdvertiserNum());
		if (sadvertiser != null) throw new Exception("아이디 중복 오류");
		advertiserDao.insertAdvertiser(advertiser);
	}

	@Override
	public void login(Integer advertiserNum, String password) throws Exception {
		Advertiser advertiser = advertiserDao.selectAdvertiser(advertiserNum);
		if (advertiser == null) throw new Exception("로그인 오류");
		if (!password.equals(advertiser.getPassword())) throw new Exception("비밀번호 오류");
	}

	@Override
	public boolean checkDoubleEmail(String userEmail) throws Exception {
		Advertiser advertiser = advertiserDao.selectAdvertiserByEmail(userEmail);
		if (advertiser == null) return false;
		return true;
	}
}
