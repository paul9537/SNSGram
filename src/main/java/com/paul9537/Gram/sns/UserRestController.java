package com.paul9537.Gram.sns;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.paul9537.Gram.sns.bo.UserBO;
import com.paul9537.Gram.sns.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	// 회원가입
	@PostMapping("/signup")
	public Map<String, String> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("email") String email) {
		
		int count = userBO.signUp(loginId, password, name, email);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	// 중복체크
	@GetMapping("/isDuplicate")
	public Map<String, Boolean> duplicate_id(@RequestParam("loginId") String loginId) {
		
		boolean isDuplicate = userBO.checkDuplicate(loginId);
		
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("is_duplicate", isDuplicate);
		
		return result;
	}
	
	// 로그인
	@PostMapping("/login")
	public Map<String, String> userLogin(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request) {
		
		User user = userBO.getUser(loginId, password);
		
		Map<String, String> result = new HashMap<>();
		
		if(user != null) {
			result.put("result", "success");
			
			HttpSession session = request.getSession();
			
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userName", user.getName());
			
		} else {
			result.put("result", "fail");
		}
		return result;
	}
	
}
