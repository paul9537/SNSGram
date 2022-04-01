package com.paul9537.Gram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.paul9537.Gram.post.model.Post;

@Repository
public interface PostDAO {

	public int insertPost (
			@Param("userId") int userId,
			@Param("userName") String userName,
			@Param("content") String content,
			@Param("imagePath") String imagePath);

	public List<Post> selectPost();
	
	public int deletePost (
			@Param("postId") int postId);
	
	public Post selectPostByPostId(@Param("postId") int postId);
	
}
