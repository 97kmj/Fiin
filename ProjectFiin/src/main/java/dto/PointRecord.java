package dto;

import java.sql.Timestamp;

public class PointRecord {
    private Integer payNum;
    private Integer influencerNum;
    private Integer advertiserNum;
    private Timestamp updateAt;
    private Integer changePoint;
    private String detail;

    public PointRecord() {
    	super();
      // TODO Auto-generated constructor stub
    }

    public PointRecord(Integer payNum, Integer influencerNum, Integer advertiserNum, Timestamp updateAt, Integer changePoint, String detail) {
    	super();
    	this.payNum = payNum;
    	this.influencerNum = influencerNum;
    	this.advertiserNum = advertiserNum;
    	this.updateAt = updateAt;
    	this.changePoint = changePoint;
    	this.detail = detail;
    }

    @Override
	public String toString() {
		return "PointRecord [payNum=" + payNum + ", influencerNum=" + influencerNum + ", advertiserNum=" + advertiserNum
				+ ", updateAt=" + updateAt + ", changePoint=" + changePoint + ", detail=" + detail + "]";
	}

	public Integer getPayNum() {
    	return payNum;
    }

    public void setPayNum(Integer payNum) {
    	this.payNum = payNum;
    }

    public Integer getInfluencerNum() {
    	return influencerNum;
    }

    public void setInfluencerNum(Integer influencerNum) {
    	this.influencerNum = influencerNum;
    }

    public Integer getAdvertiserNum() {
    	return advertiserNum;
    }

    public void setAdvertiserNum(Integer advertiserNum) {
    	this.advertiserNum = advertiserNum;
    }

    public Timestamp getUpdateAt() {
    	return updateAt;
    }

    public void setUpdateAt(Timestamp updateAt) {
    	this.updateAt = updateAt;
    }

    public Integer getChangePoint() {
    	return changePoint;
    }

    public void setChangePoint(Integer changePoint) {
    	this.changePoint = changePoint;
    }

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}
    
    
}
