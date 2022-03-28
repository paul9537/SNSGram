package com.paul9537.Gram.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paul9537.Gram.post.dao.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;
	
	public int addLike(int postId, int userId) {
		return likeDAO.insertLike(postId, userId);
	}


}
