package com.paul9537.Gram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.paul9537.Gram.post.model.Comment;


@Repository
public interface CommentDAO {
	
	public int insertComment(
			@Param("postId") int postId,
			@Param("userId") int userId,
			@Param("userName") String userName,
			@Param("comment") String comment);
	
	public List<Comment> selectPostComment(@Param("postId") int postId);
	
	public int deleteCommentByPostId(@Param("postId") int postId);
}
