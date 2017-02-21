package com.yc.book.service;

import com.yc.book.entity.EnrollUser;
import com.yc.book.entity.User;

public interface UserService {

	User login(User user);

	Boolean addUser(EnrollUser user);
}
