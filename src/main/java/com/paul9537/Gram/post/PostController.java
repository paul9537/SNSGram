package com.paul9537.Gram.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.paul9537.Gram.post.bo.PostBO;
import com.paul9537.Gram.post.model.Post;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO;

	@GetMapping("/main_view")
	public String mainView(Model model) {
		
		List<Post> postList = postBO.getContents();
		
		model.addAttribute("postList", postList);
		
		return "post/main";
	}
	
	@GetMapping("/create_view")
	public String createView() {
		return "post/create";
	}
	

}
