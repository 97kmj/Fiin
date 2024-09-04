package dto;

public class BookmarkCampaign {

	private Integer cbookmarkNum;
	private Integer campaignNum;
	private Integer influencerNum;

	public BookmarkCampaign(Integer cbookmarkNum, Integer campaignNum, Integer influencerNum) {
		super();
		this.cbookmarkNum = cbookmarkNum;
		this.campaignNum = campaignNum;
		this.influencerNum = influencerNum;
	}

	public BookmarkCampaign() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getCbookmarkNum() {
		return cbookmarkNum;
	}

	public void setCbookmarkNum(Integer cbookmarkNum) {
		this.cbookmarkNum = cbookmarkNum;
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

	@Override
	public String toString() {
		return "BookmarkCampaign [cbookmarkNum=" + cbookmarkNum + ", campaignNum=" + campaignNum + ", influencerNum="
				+ influencerNum + "]";
	}

}
