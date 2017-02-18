package com.yc.book.web.handle;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yc.book.entity.User;
import com.yc.book.service.UserService;

@Controller
@RequestMapping("/user")
@SessionAttributes("loginUser")
public class UserHandler {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	public String login(User user, ModelMap map){
		user = userService.login(user);
		if(user != null){
			map.put("loginUser", user);
			return "redirect:/page/manage.jsp";
		}
		map.put("errorMsg", "用户名或密码错误");
		return "forward:/login.jsp";
	}
}
