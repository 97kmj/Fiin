package dto;

public class Campaign {
	private Integer campaignNum;
	private Integer categoryId;
	private String companyName;
	private String campaignTitle;
	private String productName;
	private String updateStartDate;
	private String updateEndDate;
	private String adStartDate;
	private String adEndDate;
	private String CHANNEL;
	private String image;
	private Integer isRecruit;

	
	public Campaign(Integer campaignNum, Integer categoryId, String companyName, String campaignTitle,
			String productName, String updateStartDate, String updateEndDate, String adStartDate, String adEndDate,
			String cHANNEL, String image, Integer isRecruit) {
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
		CHANNEL = cHANNEL;
		this.image = image;
		this.isRecruit = isRecruit;
	}


	@Override
	public String toString() {
		return "Campaign [campaignNum=" + campaignNum + ", categoryId=" + categoryId + ", companyName=" + companyName
				+ ", campaignTitle=" + campaignTitle + ", productName=" + productName + ", updateStartDate="
				+ updateStartDate + ", updateEndDate=" + updateEndDate + ", adStartDate=" + adStartDate + ", adEndDate="
				+ adEndDate + ", CHANNEL=" + CHANNEL + ", image=" + image + ", isRecruit=" + isRecruit + "]";
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


	public String getUpdateStartDate() {
		return updateStartDate;
	}


	public void setUpdateStartDate(String updateStartDate) {
		this.updateStartDate = updateStartDate;
	}


	public String getUpdateEndDate() {
		return updateEndDate;
	}


	public void setUpdateEndDate(String updateEndDate) {
		this.updateEndDate = updateEndDate;
	}


	public String getAdStartDate() {
		return adStartDate;
	}


	public void setAdStartDate(String adStartDate) {
		this.adStartDate = adStartDate;
	}


	public String getAdEndDate() {
		return adEndDate;
	}


	public void setAdEndDate(String adEndDate) {
		this.adEndDate = adEndDate;
	}


	public String getCHANNEL() {
		return CHANNEL;
	}


	public void setCHANNEL(String cHANNEL) {
		CHANNEL = cHANNEL;
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
