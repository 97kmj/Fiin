package service;

import dto.Advertiser;

public interface AdvertiserService {
	void join(Advertiser advertiser) throws Exception;
	void login(Integer advertiserNum, String userEmail, String password) throws Exception;
	boolean checkDoubleId(Integer advertiserNum, String userEmail) throws Exception;
}
