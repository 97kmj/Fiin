package dto;

public class BookmarkInfluencer {

  private Integer bookmarkNum;
  private Integer advertiserNum;
  private Integer influencerNum;

  public BookmarkInfluencer(Integer bookmarkNum, Integer advertiserNum, Integer influencerNum) {
    super();
    this.bookmarkNum = bookmarkNum;
    this.advertiserNum = advertiserNum;
    this.influencerNum = influencerNum;
  }


  public BookmarkInfluencer() {
    super();
    // TODO Auto-generated constructor stub
  }


  public Integer getBookmarkNum() {
    return bookmarkNum;
  }

  public void setBookmarkNum(Integer bookmarkNum) {
    this.bookmarkNum = bookmarkNum;
  }

  public Integer getAdvertiserNum() {
    return advertiserNum;
  }

  public void setAdvertiserNum(Integer advertiserNum) {
    this.advertiserNum = advertiserNum;
  }

  public Integer getInfluencerNum() {
    return influencerNum;
  }

  public void setInfluencerNum(Integer influencerNum) {
    this.influencerNum = influencerNum;
  }

  @Override
  public String toString() {
    return "BookmarkInfluencer [bookmarkNum=" + bookmarkNum + ", advertiserNum=" + advertiserNum
        + ", influencerNum=" + influencerNum + "]";
  }


}
