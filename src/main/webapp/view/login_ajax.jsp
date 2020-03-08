<%--
  Created by IntelliJ IDEA.
  User: hhw
  Date: 2020/3/4
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%-- jsp导入外部文件，需要注意路径问题 --%>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js"></script>
<head>
    <title>Title</title>
</head>
<style type="text/css">
    .a_load{
        width: 500px;
        height: 400px;
        border:solid 2px black;
        padding: 2px;
        margin-top: 100px;
        margin-left: 500px;

    }
    .a_inputText{
        padding: 5px;
        margin: 20px;
        text-align: center;
    }
    .a_inputbutton{
        text-align: center;
    }
    #dis{
        color:red;
    }

</style>
<script type="text/javascript">
    <%--所有参数
        url:发起请求的地址
        data:需要传输的数据(key/value格式)
        success:请求成功后的回调函数
    --%>
    $(function () {

        //ajax检查用户名是否重复
        $("#username").blur(function () {
            $.get({
                url:"${pageContext.request.contextPath}/user/a",
                data:{"name":$("#username").val()},
                dataType:"text",
                success:function (data) {
                    if(data=="pass"){
                        $("#dis")[0].innerHTML='用户名可用';
                        $("#dis").css({"color":"green"});
                    }else {
                        $("#dis")[0].innerHTML = data;//jquery无innerhtml属性，只能转成js后在使用
                        $("#dis").css({"color":"red"});
                    }
                }
            })
        })

        // 创建保存用户名/密码的对象
        function createuser(name,passwd) {
            this.name=name;
            this.passwd=passwd;
        }

        //ajax提交用户数据（打包成json后提交）
        $("#sub").click(function () {
            //检查用户名是否通过
            if($("#dis")[0].innerHTML=='用户名可用'){
                console.log("yes");
                var userObj=new createuser($("#username").val(),$("#passwd").val());
                var jsonUser=JSON.stringify(userObj);
                $.post({
                    url:"${pageContext.request.contextPath}/user/getUser",
                    data:jsonUser,
                    contentType: "application/json;charset=UTF-8",
                    dataType:"json",
                    success:function(data) {
                        alert(data.name);
                        if(data!=null){
                            $("#err")[0].innerHTML='验证成功';
                            $("#err").css({'color':'green'});
                        }else {
                            $("#err")[0].innerHTML='请输入正确的用户名或密码';
                            $("#err").css({'color':'red'});
                        }
                    }
                })
                
            }else{
                $("#err")[0].innerHTML='请重新输入用户名';
                $("#err").css({'color':'red'});
            }
        })


    })
</script>
<body>
    <div class="a_load">
        <div class="a_inputText">请输入用户名: <input type="text" id="username"> </div><span id="dis"></span>
        <div class="a_inputText">请输入密码: <input type="password" id="passwd"></div>
        <div class="a_inputbutton"><button id="sub">提交</button><span id="err"></span></div>
    </div>
</body>

</html>
