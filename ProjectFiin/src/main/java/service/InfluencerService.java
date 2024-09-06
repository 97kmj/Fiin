package service;


import java.util.List;

import dto.Influencer;
import util.PageInfo;

public interface InfluencerService {

	void join(Influencer influencer) throws Exception;
	Influencer login(String userEmail, String password) throws Exception;
	boolean checkDoubleEmail(String userEmail) throws Exception;

  List<Influencer> influencerList(PageInfo pageInfo);
	Influencer influencerRegister(Influencer influencer) throws Exception;

}
