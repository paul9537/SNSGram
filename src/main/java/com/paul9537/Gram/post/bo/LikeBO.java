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
	
	public int getLikeCount(int postId) {
		return likeDAO.selectLikeCount(postId);
	}
	
	public boolean isLike(int postId, int userId) {
		int count =  likeDAO.selectLikeCountByUserId(postId, userId);
		
		// 조회된 결과가 없으면 좋아요 아닌상태
//		if(count == 0) {
//			return false;
//		} else {
//			return true;
//		}
		
		return (count != 0);
	}
	
	public int unlike(int postId, int userId) {
		return likeDAO.deleteLike(postId, userId);
	}
	
	public int deleteLikeByPostId(int postId) {
		return likeDAO.deleteLikeByPostId(postId);
	}

}
