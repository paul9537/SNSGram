package com.paul9537.Gram.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paul9537.Gram.post.dao.CommentDAO;
import com.paul9537.Gram.post.model.Comment;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	public int addComment(int postId, int userId, String userName, String comment) {
		return commentDAO.insertComment(postId, userId, userName, comment);
	}
	
	public List<Comment> getComment(int postId) {
		return commentDAO.selectPostComment(postId);	
	}
				
	
}
