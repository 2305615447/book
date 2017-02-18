package com.yc.book.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.book.entity.User;
import com.yc.book.mapper.UserMapper;
import com.yc.book.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User login(User user) {
		
		return userMapper.getUser(user);
	}

}
