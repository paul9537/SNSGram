package com.paul9537.Gram.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.paul9537.Gram.common.FileManagerService;
import com.paul9537.Gram.post.dao.PostDAO;
import com.paul9537.Gram.post.model.Like;
import com.paul9537.Gram.post.model.Post;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	public int createContent(int userId, String userName, String content, MultipartFile file) {
		
		String filePath = FileManagerService.saveFile(userId, file);
		
		return postDAO.insertPost(userId, userName, content, filePath);
		
	}
	
	public List<Post> getContents() {
		return postDAO.selectPost();
	}
	
	public List<Like> getPostList() {
		List<Post> postList = postDAO.selectPost();
		
		// 포스트 마다 댓글 좋아요 가져오기
		
		// 그 정보를 하나의 새로운 데이터 클래스 (DTO) 를 만들어서 구성
		
		// 새로운 클래스(DTO)를 리스트 형태로 구성
		
		// 모델 새로 설계하기
	}

}
