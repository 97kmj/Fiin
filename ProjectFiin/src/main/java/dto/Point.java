package dto;

public class Point {
	private Integer pointId;
	private Integer pointAmount;
	private Integer pointPrice;
	
	public Integer getPointId() {
		return pointId;
	}
	public void setPointId(Integer pointId) {
		this.pointId = pointId;
	}
	public Integer getPointAmount() {
		return pointAmount;
	}
	public void setPointAmount(Integer pointAmount) {
		this.pointAmount = pointAmount;
	}
	public Integer getPointPrice() {
		return pointPrice;
	}
	public void setPointPrice(Integer pointPrice) {
		this.pointPrice = pointPrice;
	}
	public Point(Integer pointId, Integer pointAmount, Integer pointPrice) {
		super();
		this.pointId = pointId;
		this.pointAmount = pointAmount;
		this.pointPrice = pointPrice;
	}
	public Point() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Point [pointId=" + pointId + ", pointAmount=" + pointAmount + ", pointPrice=" + pointPrice + "]";
	}
	
	
	
}
