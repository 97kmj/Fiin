package dto;

import java.util.Date;

public class Advertiser {
	private Integer advertiser_num;
	private String user_email;
	private String PASSWORD;
	private String NAME;
	private String company_name;
	private String mobile_number;
	private Integer point_balance;
	private Date create_at;
	private String address;
	public Integer getAdvertiser_num() {
		return advertiser_num;
	}
	public void setAdvertiser_num(Integer advertiser_num) {
		this.advertiser_num = advertiser_num;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getPASSWORD() {
		return PASSWORD;
	}
	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getMobile_number() {
		return mobile_number;
	}
	public void setMobile_number(String mobile_number) {
		this.mobile_number = mobile_number;
	}
	public Integer getPoint_balance() {
		return point_balance;
	}
	public void setPoint_balance(Integer point_balance) {
		this.point_balance = point_balance;
	}
	public Date getCreate_at() {
		return create_at;
	}
	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "Advertiser [advertiser_num=" + advertiser_num + ", user_email=" + user_email + ", PASSWORD=" + PASSWORD
				+ ", NAME=" + NAME + ", company_name=" + company_name + ", mobile_number=" + mobile_number
				+ ", point_balance=" + point_balance + ", create_at=" + create_at + ", address=" + address + "]";
	}
	public Advertiser(Integer advertiser_num, String user_email, String pASSWORD, String nAME, String company_name,
			String mobile_number, Integer point_balance, Date create_at, String address) {
		super();
		this.advertiser_num = advertiser_num;
		this.user_email = user_email;
		PASSWORD = pASSWORD;
		NAME = nAME;
		this.company_name = company_name;
		this.mobile_number = mobile_number;
		this.point_balance = point_balance;
		this.create_at = create_at;
		this.address = address;
	}
	public Advertiser() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
