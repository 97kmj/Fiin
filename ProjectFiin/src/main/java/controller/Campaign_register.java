package controller;

import dto.Campaign;

public interface Campaign_register {

  //Campaign 등록
  Campaign register(Campaign campaign) throws Exception;

  //같은 campaign 등록 시, 체크할지 고려 중 (일단 보류)
//  boolean checkDoubleId(String id) throws Exception;
}
