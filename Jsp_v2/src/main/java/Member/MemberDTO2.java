package Member;

import java.sql.Timestamp;

public class MemberDTO2 {
	private String userId;
	private String userPwd;
	private String userName;
	private String phoneNo;
	private String address;
	private String email;
	private Timestamp regdate;
	
	public MemberDTO2() {};
	
	public MemberDTO2(String userId, String userPwd, String userName, String phoneNo, String address, String email) {
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phoneNo = phoneNo;
		this.address = address;
		this.email = email;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getRegDate() {
		return regdate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regdate = regDate;
	}	
}
