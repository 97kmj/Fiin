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
	public Advertiser login(String userEmail, String password) throws Exception {
		Advertiser advertiser = advertiserDao.selectAdvertiserByEmail(userEmail);
		if (advertiser == null) throw new Exception("로그인 오류");
		if (!password.equals(advertiser.getPassword())) throw new Exception("비밀번호 오류");
		return advertiser;
	}

	@Override
	public boolean checkDoubleEmail(String userEmail) throws Exception {
		Advertiser advertiser = advertiserDao.selectAdvertiserByEmail(userEmail);
		if (advertiser == null) return false;
		return true;
	}

	@Override
	public String advertiserEmail(String name, String mobileNumber) throws Exception {
		String userEmail = advertiserDao.selectAdvertiserEmail(name, mobileNumber);
		if (userEmail == null) throw new Exception("이메일 찾기 오류");
		return userEmail;
	}

	@Override
	public String advertiserPassword(String userEmail) throws Exception {
		String password = advertiserDao.selectAdvertiserPassword(userEmail);
		if (password == null) throw new Exception("비밀번호 찾기 오류");
		return password;
	}

	@Override
	public Advertiser advertiserDetail(Integer advertiserNum) throws Exception {
		Advertiser advertiser = advertiserDao.selectAdvertiser(advertiserNum);
		if (advertiser == null) throw new Exception("광고주를 찾지 못했습니다.");
		return advertiser;
	}

	@Override
	public void advertiserModify(Advertiser advertiser) throws Exception {
		advertiserDao.updateAdvertiser(advertiser);
	}
}
