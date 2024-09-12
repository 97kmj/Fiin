package dto;

public class ReceiveCampaign {
    private Integer applyNum;
    private Integer campaignNum;
    private Integer influencerNum;
    private Integer accept;

    public ReceiveCampaign(Integer applyNum, Integer campaignNum, Integer influencerNum,
    		Integer accept) {
    	super();
    	this.applyNum = applyNum;
    	this.campaignNum = campaignNum;
    	this.influencerNum = influencerNum;
    	this.accept = accept;
    }
	
    public ReceiveCampaign() {
    	super();
    	// 	TODO Auto-generated constructor stub
    }

    public Integer getApplyNum() {
    	return applyNum;
    }

    public void setApplyNum(Integer applyNum) {
    	this.applyNum = applyNum;
    }

    public Integer getCampaignNum() {
    	return campaignNum;
    }

    public void setCampaignNum(Integer campaignNum) {
    	this.campaignNum = campaignNum;
    }

    public Integer getInfluencerNum() {
    	return influencerNum;
    }

    public void setInfluencerNum(Integer influencerNum) {
    	this.influencerNum = influencerNum;
    }

    public Integer getAccept() {
    	return accept;
    }

    public void setAccept(Integer accept) {
    	this.accept = accept;
    }
}
