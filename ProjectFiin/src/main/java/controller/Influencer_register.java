package controller;


import dto.Influencer;

public interface Influencer_register {

  //Influencer 등록
  Influencer register(Influencer influencer) throws Exception;

  //같은 influencer 등록 시, 체크할지 고려 중 (일단 보류)
//  boolean checkDoubleId(String id) throws Exception;
}
