package service;


import java.util.List;

import dto.Influencer;
import util.PageInfo;

public interface InfluencerService {

  Influencer register(Influencer influencer) throws Exception;

List<Influencer> influencerList(PageInfo pageInfo);

}
