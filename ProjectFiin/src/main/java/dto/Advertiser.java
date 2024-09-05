package dto;

<<<<<<< HEAD
import java.sql.Timestamp;


public class Advertiser {
	private Integer advertiserNum;
	private String userEmail;
	private String password;
	private String name;
	private String companyName;
	private String mobileNumber;
	private Timestamp createAt;
	private Integer pointBalance;
	private String address;

	public Integer getAdvertiserNum() {
		return advertiserNum;
	}

	public void setAdvertiserNum(Integer advertiserNum) {
		this.advertiserNum = advertiserNum;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
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

	public Integer getPointBalance() {
		return pointBalance;
	}

	public void setPointBalance(Integer pointBalance) {
		this.pointBalance = pointBalance;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "Advertiser [advertiserNum=" + advertiserNum + ", userEmail=" + userEmail + ", password=" + password
				+ ", name=" + name + ", companyName=" + companyName + ", mobileNumber=" + mobileNumber + ", createAt="
				+ createAt + ", pointBalance=" + pointBalance + ", address=" + address + "]";
	}

	public Advertiser(Integer advertiserNum, String userEmail, String password, String name, String companyName,
			String mobileNumber, Timestamp createAt, Integer pointBalance, String address) {
		super();
		this.advertiserNum = advertiserNum;
		this.userEmail = userEmail;
		this.password = password;
		this.name = name;
		this.companyName = companyName;
		this.mobileNumber = mobileNumber;
		this.createAt = createAt;
		this.pointBalance = pointBalance;
		this.address = address;
	}

	public Advertiser() {
		super();
		// TODO Auto-generated constructor stub
	}


=======
import java.util.Date;

public class Advertiser {
	private Integer advertiserNum;
	private String userEmail;
	private String password;
	private String name;
	private String companyName;
	private String mobileNumber;
	private Date createAt;
	private Integer pointBalance;
	private String address;
	public Integer getAdvertiserNum() {
		return advertiserNum;
	}
	public void setAdvertiserNum(Integer advertiserNum) {
		this.advertiserNum = advertiserNum;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public Date getCreateAt() {
		return createAt;
	}
	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}
	public Integer getPointBalance() {
		return pointBalance;
	}
	public void setPointBalance(Integer pointBalance) {
		this.pointBalance = pointBalance;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "Advertiser [advertiserNum=" + advertiserNum + ", userEmail=" + userEmail + ", password=" + password
				+ ", name=" + name + ", companyName=" + companyName + ", mobileNumber=" + mobileNumber + ", createAt="
				+ createAt + ", pointBalance=" + pointBalance + ", address=" + address + "]";
	}
	public Advertiser(Integer advertiserNum, String userEmail, String password, String name, String companyName,
			String mobileNumber, Date createAt, Integer pointBalance, String address) {
		super();
		this.advertiserNum = advertiserNum;
		this.userEmail = userEmail;
		this.password = password;
		this.name = name;
		this.companyName = companyName;
		this.mobileNumber = mobileNumber;
		this.createAt = createAt;
		this.pointBalance = pointBalance;
		this.address = address;
	}
	public Advertiser() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
>>>>>>> refs/remotes/origin/develop-jy
}
