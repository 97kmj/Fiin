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
		if ((sadvertiser.getUserEmail()).equals(advertiser.getUserEmail())) throw new Exception("아이디 중복 오류");
		advertiserDao.insertAdvertiser(advertiser);
	}

	@Override
	public void login(Integer advertiserNum, String userEmail, String password) throws Exception {
		Advertiser advertiser = advertiserDao.selectAdvertiser(advertiserNum);
		if (advertiser.getUserEmail() == null || !userEmail.equals(advertiser.getUserEmail())) throw new Exception("로그인 오류");
		if (!password.equals(advertiser.getPassword())) throw new Exception("비밀번호 오류");
	}

	@Override
	public boolean checkDoubleId(Integer advertiserNum, String userEmail) throws Exception {
		Advertiser advertiser = advertiserDao.selectAdvertiser(advertiserNum);
		if (!(advertiser.getUserEmail()).equals(userEmail)) return false;
		return true;
	}
}
