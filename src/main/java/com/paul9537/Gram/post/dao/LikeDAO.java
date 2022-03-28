package com.paul9537.Gram.post.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {

	public int insertLike(
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	public int selectLikeCount(@Param("postId") int postId);
	
}
