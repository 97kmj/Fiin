package dto;

public class RequestCampaign {
	private Integer requestNum;
	private Integer campaignNum;
	private Integer influencerNum;
	private Integer accept;
	public Integer getRequestNum() {
		return requestNum;
	}
	public void setRequestNum(Integer requestNum) {
		this.requestNum = requestNum;
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
	@Override
	public String toString() {
		return "RequestCampaign [requestNum=" + requestNum + ", campaignNum=" + campaignNum + ", influencerNum="
				+ influencerNum + ", accept=" + accept + "]";
	}
	public RequestCampaign(Integer requestNum, Integer campaignNum, Integer influencerNum, Integer accept) {
		super();
		this.requestNum = requestNum;
		this.campaignNum = campaignNum;
		this.influencerNum = influencerNum;
		this.accept = accept;
	}
	public RequestCampaign() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
