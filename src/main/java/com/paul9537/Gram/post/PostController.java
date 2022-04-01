package com.paul9537.Gram.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.paul9537.Gram.post.bo.PostBO;
import com.paul9537.Gram.post.model.PostDetail;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO;

	@GetMapping("/main_view")
	public String mainView(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<PostDetail> postList = postBO.getPostList(userId);
		
		model.addAttribute("postList", postList);
		
		return "post/main";
	}
	
	@GetMapping("/create_view")
	public String createView() {
		return "post/create";
	}
	

}
