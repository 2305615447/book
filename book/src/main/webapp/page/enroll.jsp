<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="/book/">
<title>用户注册</title>
<link type="text/css" rel="stylesheet" href="easyui/themes/icon.css">
<link type="text/css" rel="stylesheet" href="easyui/themes/default/easyui.css">
<link type="text/css" rel="stylesheet" href="css/enroll.css">
</head>
<body>
	<div id="enrollDiv">
		<form id="enrollForm" action="user/enroll" method="post">
			
				<p><span class="before">会员名:</span>
  	      		<input class="input" type="text" name="userName" id="userName"  /></p>
  			
           		<p><span class="before">真实姓名:</span>
  	      		<input class="input" type="text" name="trueName" id="trueName" /></p>
  			
    			<p><span class="before">密&nbsp;&nbsp;&nbsp;码:</span>
        		<input class="input" type="password" name="userpwd" id="userpwd" maxlength="16"/></p>
       
   			
    			<p><span class="before">城市:</span>
                <input class="input" type="text" name="city" id="city" /></p>
    		
    			<p><span class="before">地址:</span>
                <input class="input" type="text" name="address" id="address" /></p>
    		
    		    <p><span class="before">邮政编码:</span>
  	    		<input class="input" type="text" name="postcode" id="postcode"/></p>
  			 
  			    <p><span class="before">证件号：</span>
                <input class="input" type="text" name="cardNo" id="cardNo"/></p>
            
				<p><span class="before">手机号:</span>
  	    		<input class="input" type="tel" name="phone" id="phone"/></p>
  			
				<p><span class="before">邮箱:</span>
  	    		<input class="input"  type="email" name="email" id="email"  /></p>
  			
  			    <p><input type="submit" value="注册" id="enrollBtn"/>
  			    <input value="清空" onClick="" type="reset"></p>
		</form>
	</div>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/enroll.js"></script>
</body>
</html>