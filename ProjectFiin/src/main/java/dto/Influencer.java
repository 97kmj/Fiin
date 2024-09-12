package dto;

import java.sql.Timestamp;

//influencer_register (인플루언서 등록 시 사용)
public class Influencer {
	private Integer influencerNum;
	private String userEmail;
	private String password;
	private String mobileNumber;
	private Timestamp createAt;
	private String name;
	private String nickname;
	private Integer pointBalance;
	private String image;
	private Integer isRegist;
	private Integer youtube;
	private String youtubeName;       // 데이터베이스 컬럼: youtube_name
	private Integer youtubeFollower;      // 데이터베이스 컬럼: youtube_follower
	private String youtubeUrl;        // 데이터베이스 컬럼: youtube_url
	private Integer instagram;
	private String instagramName;     // 데이터베이스 컬럼: instagram_name
	private Integer instagramFollower;    // 데이터베이스 컬럼: instagram_follower
	private String instagramUrl;      // 데이터베이스 컬럼: instagram_url
	private Integer blog;
	private String blogName;          // 데이터베이스 컬럼: blog_name
	private Integer blogFollower;         // 데이터베이스 컬럼: blog_follower
	private String blogUrl;           // 데이터베이스 컬럼: blog_url

	private Integer categoryId;           // 데이터베이스 컬럼: category_id
	private String profileImage;      // 데이터베이스 컬럼: profile_image
	private String introduction;
	private String introLine;         // 데이터베이스 컬럼: intro_line

	private Timestamp registDate;
	private String address;
    private String addressDetail;


	//InfluencerRegister 객체(인플루언서 등록 시 사용)
  public Influencer(Integer influencerNum, String profileImage, String youtubeName,
      Integer youtubeFollower, String youtubeUrl, String instagramName, Integer instagramFollower,
      String instagramUrl, String blogName,
      Integer blogFollower, String blogUrl, Integer categoryId, String introduction) {
    this.influencerNum = influencerNum;
    this.profileImage = profileImage;
    this.youtubeName = youtubeName;
    this.youtubeFollower = youtubeFollower;
    this.youtubeUrl = youtubeUrl;
    this.instagramName = instagramName;
    this.instagramFollower = instagramFollower;
    this.instagramUrl = instagramUrl;
    this.blogName = blogName;
    this.blogFollower = blogFollower;
    this.blogUrl = blogUrl;
    this.categoryId = categoryId;
    this.introduction = introduction;
  }

	public Integer getInfluencerNum() {
		return influencerNum;
	}
	public void setInfluencerNum(Integer influencerNum) {
		this.influencerNum = influencerNum;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public Timestamp getCreateAt() {
		return createAt;
	}
	public void setCreateAt(Timestamp createAt) {
		this.createAt = createAt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Integer getPointBalance() {
		return pointBalance;
	}
	public void setPointBalance(Integer pointBalance) {
		this.pointBalance = pointBalance;
	}
	public Integer getIsRegist() {
		return isRegist;
	}
	public void setIsRegist(Integer isRegist) {
		this.isRegist = isRegist;
	}
	public String getYoutubeName() {
		return youtubeName;
	}
	public void setYoutubeName(String youtubeName) {
		this.youtubeName = youtubeName;
	}
	public Integer getYoutubeFollower() {
		return youtubeFollower;
	}
	public void setYoutubeFollower(Integer youtubeFollower) {
		this.youtubeFollower = youtubeFollower;
	}
	public String getYoutubeUrl() {
		return youtubeUrl;
	}
	public void setYoutubeUrl(String youtubeUrl) {
		this.youtubeUrl = youtubeUrl;
	}
	public String getInstagramName() {
		return instagramName;
	}
	public void setInstagramName(String instagramName) {
		this.instagramName = instagramName;
	}
	public Integer getInstagramFollower() {
		return instagramFollower;
	}
	public void setInstagramFollower(Integer instagramFollower) {
		this.instagramFollower = instagramFollower;
	}
	public String getInstagramUrl() {
		return instagramUrl;
	}
	public void setInstagramUrl(String instagramUrl) {
		this.instagramUrl = instagramUrl;
	}
	public String getBlogName() {
		return blogName;
	}
	public void setBlogName(String blogName) {
		this.blogName = blogName;
	}
	public Integer getBlogFollower() {
		return blogFollower;
	}
	public void setBlogFollower(Integer blogFollower) {
		this.blogFollower = blogFollower;
	}
	public String getBlogUrl() {
		return blogUrl;
	}
	public void setBlogUrl(String blogUrl) {
		this.blogUrl = blogUrl;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public String getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getIntroLine() {
		return introLine;
	}
	public void setIntroLine(String introLine) {
		this.introLine = introLine;
	}
	public Timestamp getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Timestamp registDate) {
		this.registDate = registDate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getYoutube() {
		return youtube;
	}

	public void setYoutube(Integer youtube) {
		this.youtube = youtube;
	}

	public Integer getInstagram() {
		return instagram;
	}

	public void setInstagram(Integer instagram) {
		this.instagram = instagram;
	}

	public Integer getBlog() {
		return blog;
	}

	public void setBlog(Integer blog) {
		this.blog = blog;
	}
	
	

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;

	}
	

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Influencer(Integer influencerNum, String userEmail, String password, String mobileNumber, Timestamp createAt,
			String name, String nickname, Integer pointBalance, Integer isRegist, Integer youtube, String youtubeName,
			Integer youtubeFollower, String youtubeUrl, Integer instagram, String instagramName,
			Integer instagramFollower, String instagramUrl, Integer blog, String blogName, Integer blogFollower,
			String blogUrl, Integer categoryId, String profileImage, String introduction, String introLine,
			Timestamp registDate, String address, String addressDetail) {
		super();
		this.influencerNum = influencerNum;
		this.userEmail = userEmail;
		this.password = password;
		this.mobileNumber = mobileNumber;
		this.createAt = createAt;
		this.name = name;
		this.nickname = nickname;
		this.pointBalance = pointBalance;
		this.isRegist = isRegist;
		this.youtube = youtube;
		this.youtubeName = youtubeName;
		this.youtubeFollower = youtubeFollower;
		this.youtubeUrl = youtubeUrl;
		this.instagram = instagram;
		this.instagramName = instagramName;
		this.instagramFollower = instagramFollower;
		this.instagramUrl = instagramUrl;
		this.blog = blog;
		this.blogName = blogName;
		this.blogFollower = blogFollower;
		this.blogUrl = blogUrl;
		this.categoryId = categoryId;
		this.profileImage = profileImage;
		this.introduction = introduction;
		this.introLine = introLine;
		this.registDate = registDate;
		this.address = address;
		this.addressDetail = addressDetail;
	}


	@Override
	public String toString() {
		return "Influencer [influencerNum=" + influencerNum + ", userEmail=" + userEmail + ", password=" + password
				+ ", mobileNumber=" + mobileNumber + ", createAt=" + createAt + ", name=" + name + ", nickname="
				+ nickname + ", pointBalance=" + pointBalance + ", isRegist=" + isRegist + ", youtube=" + youtube
				+ ", youtubeName=" + youtubeName + ", youtubeFollower=" + youtubeFollower + ", youtubeUrl=" + youtubeUrl
				+ ", instagram=" + instagram + ", instagramName=" + instagramName + ", instagramFollower="
				+ instagramFollower + ", instagramUrl=" + instagramUrl + ", blog=" + blog + ", blogName=" + blogName
				+ ", blogFollower=" + blogFollower + ", blogUrl=" + blogUrl + ", categoryId=" + categoryId
				+ ", profileImage=" + profileImage + ", introduction=" + introduction + ", introLine=" + introLine
				+ ", registDate=" + registDate + ", address=" + address + ", addressDetail=" + addressDetail + "]";
	}

	public Influencer() {
		super();
		// TODO Auto-generated constructor stub
	}

}