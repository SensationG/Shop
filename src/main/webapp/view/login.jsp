<%--
  Created by IntelliJ IDEA.
  User: hhw
  Date: 2020/3/5
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link href="/static/css/userlogin.css" rel='stylesheet' type='text/css' />
<script src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js"></script>
<body>
    <div class="main">
        <div class="login">
            <h1>图书商城</h1>
            <div class="inset">
                <!--start-main-->
                <form>
                    <div>
                        <h2>用户登陆</h2>
                        <span><label>用户名</label></span>
                        <span><input type="text" class="textbox" ></span>
                    </div>
                    <div>
                        <span><label>密码</label></span>
                        <span><input type="password" class="password"></span>
                    </div>
                    <div class="sign">
                        <%--<input type="submit" value="注册" class="submit-reginest"/>--%>
                        <a href="/user/userRegiest" class="submit-reginest">注册</a>
                        <input type="submit" value="登录" class="submit" />
                    </div>
                </form>
            </div>
        </div>
        <!--//end-main-->
    </div>

    <div class="copy-right">
        <p>&copy; 2015 Ethos Login Form. All Rights Reserved</p>
    </div>
</body>
</html>
