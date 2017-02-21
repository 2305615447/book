package com.yc.book.mapper;

import com.yc.book.entity.EnrollUser;
import com.yc.book.entity.User;

public interface UserMapper {

	User getUser(User user);

	int insertUser(EnrollUser user);
}
