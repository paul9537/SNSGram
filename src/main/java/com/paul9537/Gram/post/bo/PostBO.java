package com.paul9537.Gram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.paul9537.Gram.common.FileManagerService;
import com.paul9537.Gram.post.dao.PostDAO;
import com.paul9537.Gram.post.model.Comment;
import com.paul9537.Gram.post.model.Post;
import com.paul9537.Gram.post.model.PostDetail;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired CommentBO commentBO;
	
	public int createContent(int userId, String userName, String content, MultipartFile file) {
		
		String filePath = FileManagerService.saveFile(userId, file);
		
		return postDAO.insertPost(userId, userName, content, filePath);
		
	}
	
	public List<Post> getContents() {
		return postDAO.selectPost();
	}
	
	public List<PostDetail> getPostList(int userId) {
		
		List<Post> postList = postDAO.selectPost();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		

		// 포스트 마다 댓글 좋아요 가져오기
		for(Post post : postList) {
			
			// post id를 이용해서 좋아요 개수, 댓글 리스트 조회
			int likeCount = likeBO.getLikeCount(post.getId());
			// 댓글 얻어 오기
			List<Comment> commentList = commentBO.getComment(post.getId());
			
			// 로그인한 사용자가 좋아요를 눌렀는지 여부
			boolean isLike = likeBO.isLike(post.getId(), userId);
			
			PostDetail postDetail = new PostDetail();
			// post 데이터 set
			postDetail.setPost(post);
			// 좋아요 개수 set post Id
			postDetail.setLikeCount(likeCount);
			// 댓글 리스트 set
			postDetail.setCommentList(commentList);
			// 라이크 set 
			postDetail.setLike(isLike);
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
	}

}
