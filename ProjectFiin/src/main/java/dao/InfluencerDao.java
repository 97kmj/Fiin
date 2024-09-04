package dao;


import java.util.List;

import dto.Influencer;

public interface InfluencerDao {

  void registerInfluencer(Influencer
      influencer) throws Exception;

  void insertInfluencer(Influencer influencer) throws Exception;
  Influencer selectInfluencer(Integer num) throws Exception;
  List<Influencer> selectInfluencerList(Integer row) throws Exception;
}
