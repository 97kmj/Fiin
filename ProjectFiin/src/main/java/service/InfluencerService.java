package service;


import dto.Influencer;

public interface InfluencerService {
	Influencer register(Influencer influencer) throws Exception;
	void join(Influencer influencer) throws Exception;
	void login(Integer influencerNum, String password) throws Exception;
	boolean checkDoubleEmail(String userEmail) throws Exception;
}
