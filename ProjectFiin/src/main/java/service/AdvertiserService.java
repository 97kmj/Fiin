package service;

import dto.Advertiser;

public interface AdvertiserService {
	void join(Advertiser advertiser) throws Exception;
	Advertiser login(String userEmail, String password) throws Exception;
	boolean checkDoubleEmail(String userEmail) throws Exception;
	String advertiserEmail(String name, String mobileNumber) throws Exception;
}
