package com.paul9537.Gram.post.model;

public class PostDetail {
	private Post post;
	private int likeCount;
//	private List<Comment> commentList;
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	
}
