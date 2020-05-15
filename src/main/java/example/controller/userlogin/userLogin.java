package example.controller.userlogin;

import example.model.user;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/user")
public class userLogin {

    //登陆页
    @RequestMapping("/index")
    public String toIndex(){
        return "login";
    }

    //注册页
    @RequestMapping("/userRegiest")
    public String toUserRegiest(){
        return "userRegiest";
    }

    //接收ajax请求，返回一个字符串
    @RequestMapping(value = "/a",produces="application/json; charset=utf-8")//produces修正@responsebody返回乱码的问题
    @ResponseBody
    //name 要求和ajax传输数据的name一致
    public String getDataByAjax(String name, HttpServletResponse response) throws IOException {
        System.out.println(name);
        response.setContentType("text/html;charset=gb2312");
        if("admin".equals(name)){
            return "此用户名已存在"; //直接返回字符串
        }else {
            System.out.println("用户名通过");
            return "pass";
        }
    }

    //接收ajax请求 验证用户名密码
    @RequestMapping("/getUser")
    //@RequestBody 绑定ajax传来的json字串
    public @ResponseBody user getUserDataByAjax(@RequestBody user user, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=gb2312");
        if(user==null){
            System.out.println("传输失败，对象为空");
        }else {
            if("hhw".equals(user.getName())){
                System.out.println("验证成功");
                return user;
            }else {
                return null;
            }
        }
        return null;
    }

    @RequestMapping("/getUser2")
    //@RequestBody 绑定ajax传来的json字串
    public @ResponseBody user getUserDataByAjax2(@RequestBody user user, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=gb2312");
        if(user==null){
            System.out.println("传输失败，对象为空");
        }else {
            if("hhw".equals(user.getName())){
                System.out.println("验证成功");
                return user;
            }else {
                return null;
            }
        }
        return null;
    }
}
