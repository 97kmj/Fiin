package service;


import dto.Influencer;

public interface InfluencerService {
	void join(Influencer influencer) throws Exception;
	void login(Integer influencerNum, String userEmail, String password) throws Exception;
	boolean checkDoubleId(Integer influencerNum, String userEmail) throws Exception;
	Influencer register(Influencer influencer) throws Exception;
}
