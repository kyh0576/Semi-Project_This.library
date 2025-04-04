package com.kh.common.model.vo;

public class Follow {
	private int followerId;
	private int followingId;
	
	public Follow() {}

	public Follow(int followerId, int followingId) {
		super();
		this.followerId = followerId;
		this.followingId = followingId;
	}

	public int getFollowerId() {
		return followerId;
	}

	public void setFollowerId(int followerId) {
		this.followerId = followerId;
	}

	public int getFollowingId() {
		return followingId;
	}

	public void setFollowingId(int followingId) {
		this.followingId = followingId;
	}

	@Override
	public String toString() {
		return "Follow [followerId=" + followerId + ", followingId=" + followingId + "]";
	}
	
}
