package dao;

import dto.Advertiser;

public interface AdvertiserDao {
	void insertAdvertiser(Advertiser advertiser) throws Exception;
	Advertiser selectAdvertiser(Integer advertiserNum) throws Exception;
	void updateAdvertiser(Advertiser advertiser) throws Exception;
	Advertiser selectAdvertiserByEmail(String userEmail) throws Exception;
	String selectAdvertiserEmail(String name, String mobileNumber) throws Exception;
	String selectAdvertiserPassword(String userEmail) throws Exception;
}
