package com.varxyz.wgt.user.serviceImpl;

import java.util.List;

import com.varxyz.wgt.user.domain.User;
import com.varxyz.wgt.user.service.UserService;

public class UserServiceImpl implements UserService {

	// 회원생성
	@Override
	public void addUser(User user) {
		userDao.addUser(user);
	}

	// 회원조회
	@Override
	public List<User> findAllUser() {
		return userDao.findUser();
	}
	
	// 회원수정
	public void modifyUser(User user) {
		userDao.modifyUser(user);
	}
}
