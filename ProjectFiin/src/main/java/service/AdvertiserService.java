package service;

import dto.Advertiser;

public interface AdvertiserService {
	void join(Advertiser advertiser) throws Exception;
	void login(Integer advertiserNum, String password) throws Exception;
	boolean checkDoubleEmail(String userEmail) throws Exception;
}
