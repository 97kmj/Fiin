package dto;

import java.util.Date;


public class Campaign {
	private Integer campaignNum;
	private Integer advertiserNum;
	private Integer categoryId;
	private String companyName;
	private String companyUrl;
	private String campaignTitle;
	private String productName;
	private Date updateStartDate;
	private Date updateEndDate;
	private Date adStartDate;
	private Date adEndDate;
	private String channel;
	private String image;
	private Integer isRecruit;
	private String address;
	
	public Campaign(Integer campaignNum, Integer advertiserNum, Integer categoryId, String companyName,
			String companyUrl, String campaignTitle, String productName, Date updateStartDate, Date updateEndDate,
			Date adStartDate, Date adEndDate, String channel, String image, Integer isRecruit, String address) {
		super();
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
		this.channel = channel;
		this.image = image;
		this.isRecruit = isRecruit;
		this.address = address;
	}
	public Integer getAdvertiserNum() {
		return advertiserNum;
	}
	public void setAdvertiserNum(Integer advertiserNum) {
		this.advertiserNum = advertiserNum;
	}
	public String getCompanyUrl() {
		return companyUrl;
	}
	public void setCompanyUrl(String companyUrl) {
		this.companyUrl = companyUrl;
	}

	public Integer getCampaignNum() {
		return campaignNum;
	}
	public void setCampaignNum(Integer campaignNum) {
		this.campaignNum = campaignNum;
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
	public Date getUpdateStartDate() {
		return updateStartDate;
	}
	public void setUpdateStartDate(Date updateStartDate) {
		this.updateStartDate = updateStartDate;
	}
	public Date getUpdateEndDate() {
		return updateEndDate;
	}
	public void setUpdateEndDate(Date updateEndDate) {
		this.updateEndDate = updateEndDate;
	}
	public Date getAdStartDate() {
		return adStartDate;
	}
	public void setAdStartDate(Date adStartDate) {
		this.adStartDate = adStartDate;
	}
	public Date getAdEndDate() {
		return adEndDate;
	}
	public void setAdEndDate(Date adEndDate) {
		this.adEndDate = adEndDate;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "Campaign [campaignNum=" + campaignNum + ", advertiserNum=" + advertiserNum + ", categoryId="
				+ categoryId + ", companyName=" + companyName + ", companyUrl=" + companyUrl + ", campaignTitle="
				+ campaignTitle + ", productName=" + productName + ", updateStartDate=" + updateStartDate
				+ ", updateEndDate=" + updateEndDate + ", adStartDate=" + adStartDate + ", adEndDate=" + adEndDate
				+ ", channel=" + channel + ", image=" + image + ", isRecruit=" + isRecruit + ", address=" + address
				+ "]";
	}
	public Campaign(Integer campaignNum, Integer categoryId, String companyName, String campaignTitle,
			String productName, Date updateStartDate, Date updateEndDate, Date adStartDate, Date adEndDate,
			String channel, String image, Integer isRecruit, String address) {
		super();
		this.campaignNum = campaignNum;
		this.categoryId = categoryId;
		this.companyName = companyName;
		this.campaignTitle = campaignTitle;
		this.productName = productName;
		this.updateStartDate = updateStartDate;
		this.updateEndDate = updateEndDate;
		this.adStartDate = adStartDate;
		this.adEndDate = adEndDate;
		this.channel = channel;
		this.image = image;
		this.isRecruit = isRecruit;
		this.address = address;
	}
	public Campaign() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	
	
}
