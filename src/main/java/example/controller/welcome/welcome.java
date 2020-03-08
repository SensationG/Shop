package example.controller.welcome;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class welcome {

    @RequestMapping("/index")
    public String toIndex(){
        return "index";
    }
}
