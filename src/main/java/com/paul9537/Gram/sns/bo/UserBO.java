package com.paul9537.Gram.sns.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paul9537.Gram.common.EncryptUtils;
import com.paul9537.Gram.sns.dao.UserDAO;
import com.paul9537.Gram.sns.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	// 회원가입
	public int signUp(String loginId, String password, String name, String email) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(loginId, encryptPassword, name, email);
	}
	
	// 중복 체크
	public boolean checkDuplicate(String loginId) {
		
		int count = userDAO.selectDuplicate(loginId);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	// 로그인
	public User getUser(String loginId, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.selectUser(loginId, encryptPassword);
	}
	
}
