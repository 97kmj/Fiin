package dto;

import java.sql.Timestamp;

public class Campaign {
	private Integer campaignNum;
	private Integer advertiserNum;
	private Integer categoryId;
	private String companyName;
	private String companyUrl;
	private String campaignTitle;
	private String productName;
	private Timestamp updateStartDate;
	private Timestamp updateEndDate;
	private Timestamp adStartDate;
	private Timestamp adEndDate;
	private String requirement;
	private String channel;
	private String image;
	private Integer isRecruit;

  public Campaign(Integer campaignNum, Integer advertiserNum, Integer categoryId,
			String companyName,
			String companyUrl, String campaignTitle, String productName, Timestamp updateStartDate,
			Timestamp updateEndDate, Timestamp adStartDate, Timestamp adEndDate, String channel,
			String image, Integer isRecruit, String requirement) {

		this.campaignNum = campaignNum;
		this.advertiserNum = advertiserNum;
		this.categoryId = categoryId;
		this.companyName = companyName;
		this.companyUrl = companyUrl;
		this.campaignTitle = campaignTitle;
		this.productName = productName;
		this.updateStartDate = updateStartDate;
		this.updateEndDate = updateEndDate;
		this.adStartDate = adStartDate;
		this.adEndDate = adEndDate;
		this.requirement = requirement;
		this.channel = channel;
		this.image = image;
		this.isRecruit = isRecruit;
	}

	// 상민) 캠페인 등록시 사용
	public Campaign(String channel, String companyName, String companyUrl, String campaignTitle, String productName, Timestamp updateStartDate, Timestamp updateEndDate, Timestamp adStartDate, Timestamp adEndDate,
			Integer categoryId) {
		this.channel = channel;
		this.companyName = companyName;
		this.companyUrl = companyUrl;
		this.campaignTitle = campaignTitle;
		this.productName = productName;
		this.updateStartDate = updateStartDate;
		this.updateEndDate = updateEndDate;
		this.adStartDate = adStartDate;
		this.adEndDate = adEndDate;
		this.categoryId = categoryId;
	}

	public Integer getCampaignNum() {
		return campaignNum;
	}


	public void setCampaignNum(Integer campaignNum) {
		this.campaignNum = campaignNum;
	}


	@Override
	public String toString() {
		return "Campaign [campaignNum=" + campaignNum + ", advertiserNum=" + advertiserNum + ", categoryId="
				+ categoryId + ", companyName=" + companyName + ", companyUrl=" + companyUrl + ", campaignTitle="
				+ campaignTitle + ", productName=" + productName + ", updateStartDate=" + updateStartDate
				+ ", updateEndDate=" + updateEndDate + ", adStartDate=" + adStartDate + ", adEndDate=" + adEndDate
				+ ", requirement=" + requirement + ", channel=" + channel + ", image=" + image + ", isRecruit="
				+ isRecruit + "]";
	}


	public Integer getAdvertiserNum() {
		return advertiserNum;
	}


	public void setAdvertiserNum(Integer advertiserNum) {
		this.advertiserNum = advertiserNum;
	}


	public Integer getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}


	public String getCompanyName() {
		return companyName;
	}


	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}


	public String getCompanyUrl() {
		return companyUrl;
	}


	public void setCompanyUrl(String companyUrl) {
		this.companyUrl = companyUrl;
	}


	public String getCampaignTitle() {
		return campaignTitle;
	}


	public void setCampaignTitle(String campaignTitle) {
		this.campaignTitle = campaignTitle;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public Timestamp getUpdateStartDate() {
		return updateStartDate;
	}


	public void setUpdateStartDate(Timestamp updateStartDate) {
		this.updateStartDate = updateStartDate;
	}


	public Timestamp getUpdateEndDate() {
		return updateEndDate;
	}


	public void setUpdateEndDate(Timestamp updateEndDate) {
		this.updateEndDate = updateEndDate;
	}


	public Timestamp getAdStartDate() {
		return adStartDate;
	}


	public void setAdStartDate(Timestamp adStartDate) {
		this.adStartDate = adStartDate;
	}


	public Timestamp getAdEndDate() {
		return adEndDate;
	}


	public void setAdEndDate(Timestamp adEndDate) {
		this.adEndDate = adEndDate;
	}


	public String getRequirement() {
		return requirement;
	}


	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}


	public String getChannel() {
		return channel;
	}


	public void setChannel(String channel) {
		this.channel = channel;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public Integer getIsRecruit() {
		return isRecruit;
	}


	public void setIsRecruit(Integer isRecruit) {
		this.isRecruit = isRecruit;
	}

	public Campaign() {
		super();
		// TODO Auto-generated constructor stub
	}
}
