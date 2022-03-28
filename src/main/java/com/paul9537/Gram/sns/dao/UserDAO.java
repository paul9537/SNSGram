package com.paul9537.Gram.sns.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.paul9537.Gram.sns.model.User;

@Repository
public interface UserDAO {
	// 회원가입
	public int insertUser(
			@Param("loginId") String loginId,
			@Param("password") String password,
			@Param("name") String name,
			@Param("email") String email);
	
	// 중복 체크
	public int selectDuplicate(@Param("loginId") String loginId);
	
	// 로그인
	public User selectUser(
			@Param("loginId") String loginId,
			@Param("password") String password);
	
}
