package com.kh.member.model.vo;

public class Member {
	private int memNo;
	private String memName;
	private String memId;
	private String memPwd;
	private String nickname;
	private String address;
	private String email;
	private String profile;
	private String phone;
	private String status;
	private String snsKey;
	
	public Member() {}

	public Member(int memNo, String memName, String memId, String memPwd, String nickname, String address, String email,
			String profile, String phone, String status, String snsKey) {
		super();
		this.memNo = memNo;
		this.memName = memName;
		this.memId = memId;
		this.memPwd = memPwd;
		this.nickname = nickname;
		this.address = address;
		this.email = email;
		this.profile = profile;
		this.phone = phone;
		this.status = status;
		this.snsKey = snsKey;
	}
	
	

	public Member(String memName, String memId, String memPwd, String nickname, String address, String email,
			String phone, String snsKey) {
		super();
		this.memName = memName;
		this.memId = memId;
		this.memPwd = memPwd;
		this.nickname = nickname;
		this.address = address;
		this.email = email;
		this.phone = phone;
		this.snsKey = snsKey;
	}

	
	
	public Member(int memNo, String memPwd, String nickname, String email, String phone) {
		super();
		this.memNo = memNo;
		this.memPwd = memPwd;
		this.nickname = nickname;
		this.email = email;
		this.phone = phone;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getSnsKey() {
		return snsKey;
	}

	public void setSnsKey(String snsKey) {
		this.snsKey = snsKey;
	}

	@Override
	public String toString() {
		return "Member [memNo=" + memNo + ", memName=" + memName + ", memId=" + memId + ", memPwd=" + memPwd
				+ ", nickname=" + nickname + ", address=" + address + ", email=" + email + ", profile=" + profile
				+ ", phone=" + phone + ", status=" + status + ", snsKey=" + snsKey + "]";
	}
	
}
