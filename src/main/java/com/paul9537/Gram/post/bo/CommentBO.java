package com.paul9537.Gram.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paul9537.Gram.post.dao.CommentDAO;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	public int addComment(int postId, int userId, String userName, String comment) {
		return commentDAO.insertComment(postId, userId, userName, comment);
	}
}
