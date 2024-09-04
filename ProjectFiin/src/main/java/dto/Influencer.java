package dto;


//influencer_register (인플루언서 등록 시 사용)
public class Influencer {

  private Integer influencerNum;
  private String userEmail;
  private String password;
  private String mobileNumber;
  private String name;
  private String nickname;
  private String address;
  private Integer pointBalance;
  private java.sql.Timestamp createAt;

  private String introLine;         // 데이터베이스 컬럼: intro_line
  private String profileImage;      // 데이터베이스 컬럼: profile_image
  private Integer categoryId;           // 데이터베이스 컬럼: category_id
  private String introduction;

  private String youtubeName;       // 데이터베이스 컬럼: youtube_name
  private Integer youtubeFollower;      // 데이터베이스 컬럼: youtube_follower
  private String youtubeUrl;        // 데이터베이스 컬럼: youtube_url

  private String instagramName;     // 데이터베이스 컬럼: instagram_name
  private Integer instagramFollower;    // 데이터베이스 컬럼: instagram_follower
  private String instagramUrl;      // 데이터베이스 컬럼: instagram_url

  private String blogName;          // 데이터베이스 컬럼: blog_name
  private Integer blogFollower;         // 데이터베이스 컬럼: blog_follower
  private String blogUrl;           // 데이터베이스 컬럼: blog_url

  //기본 생성자
  public Influencer() {
  }

  // influencer_register (인플루언서 등록 시 사용할 생성자)
  public Influencer(Integer influencerNum, String userEmail, String password, String mobileNumber,
      String name, String nickname, String address, Integer pointBalance, String introLine, String profileImage,
      Integer categoryId, String introduction,
      String youtubeName, Integer youtubeFollower, String youtubeUrl,
      String instagramName, Integer instagramFollower, String instagramUrl,
      String blogName, Integer blogFollower, String blogUrl) {
    this.influencerNum = influencerNum;
    this.userEmail = userEmail;
    this.password = password;
    this.mobileNumber = mobileNumber;
    this.nickname = nickname;
    this.address = address;
    this.pointBalance = pointBalance;
    this.introLine = introLine;
    this.profileImage = profileImage;
    this.categoryId = categoryId;
    this.introduction = introduction;
    this.youtubeName = youtubeName;
    this.youtubeFollower = youtubeFollower;
    this.youtubeUrl = youtubeUrl;
    this.instagramName = instagramName;
    this.instagramFollower = instagramFollower;
    this.instagramUrl = instagramUrl;
    this.blogName = blogName;
    this.blogFollower = blogFollower;
    this.blogUrl = blogUrl;
  }

  //
  public Influencer(String introLine, String profileImage, int categoryId, String introduction,
      String youtubeName, int youtubeFollower, String youtubeUrl, String instagramName,
      int instagramFollower,
      String instagramUrl, String blogName, int blogFollower, String blogUrl) {
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

  public String getIntroLine() {
    return introLine;
  }

  public void setIntroLine(String introLine) {
    this.introLine = introLine;
  }

  public String getProfileImage() {
    return profileImage;
  }

  public void setProfileImage(String profileImage) {
    this.profileImage = profileImage;
  }

  public Integer getCategoryId() {
    return categoryId;
  }

  public void setCategoryId(Integer categoryId) {
    this.categoryId = categoryId;
  }

  public String getIntroduction() {
    return introduction;
  }

  public void setIntroduction(String introduction) {
    this.introduction = introduction;
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

  public String getAddress() {
	return address;
  }
	
  public void setAddress(String address) {
	this.address = address;
  }
	
  public java.sql.Timestamp getCreateAt() {
	return createAt;
  }
	
  public void setCreateAt(java.sql.Timestamp createAt) {
	this.createAt = createAt;
  }

  @Override
  public String toString() {
	return "Influencer [influencerNum=" + influencerNum + ", userEmail=" + userEmail + ", password=" + password
			+ ", mobileNumber=" + mobileNumber + ", name=" + name + ", nickname=" + nickname + ", address=" + address
			+ ", pointBalance=" + pointBalance + ", createAt=" + createAt + ", introLine=" + introLine
			+ ", profileImage=" + profileImage + ", categoryId=" + categoryId + ", introduction=" + introduction
			+ ", youtubeName=" + youtubeName + ", youtubeFollower=" + youtubeFollower + ", youtubeUrl=" + youtubeUrl
			+ ", instagramName=" + instagramName + ", instagramFollower=" + instagramFollower + ", instagramUrl="
			+ instagramUrl + ", blogName=" + blogName + ", blogFollower=" + blogFollower + ", blogUrl=" + blogUrl + "]";
  }
}