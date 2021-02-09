package com.xxx.controller;

import com.mysql.cj.Session;
import com.xxx.domain.User;
import com.xxx.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/toLogin")
    public String toLogin()
    {
        return "login";
    }

    @RequestMapping("/login")
    public ModelAndView login(String username, String psw, HttpServletRequest request)
    {
        request.getSession().setAttribute("username",username);
        request.getSession().setAttribute("psw",psw);

        ModelAndView mv=new ModelAndView();
        String error="用户名或密码不正确";
        User user=userService.selectUserByName(username);
        String password=user.getUserPassword();
        if(password.equals(psw)){
            mv.setViewName("forward:/favorite/showAllFar");
            Integer id=user.getUserId();
            request.getSession().setAttribute("userId",id);
        }
        else{
            System.out.println("mv.addObject(error,error);");
            mv.addObject("error",error);
            mv.setViewName("login");
        }
        return mv;
    }

    @RequestMapping("/toAddUser")
    public String toAddUser()
    {
        return "addUser";
    }

    @RequestMapping("/addUser")
    public ModelAndView addUser(User user,HttpServletRequest request)
    {
        ModelAndView mv=new ModelAndView();

        String name=user.getUserName();
        User users=userService.selectUserByName(name);

        if(users==null) userService.insertUser(user);
        else{
            mv.addObject("error","用户名重复");
            mv.setViewName("addUser");
            return mv;
        }
        request.getSession().setAttribute("username",user.getUserName());
        request.getSession().setAttribute("psw",user.getUserPassword());
        request.getSession().setAttribute("userId",user.getUserId());
        mv.setViewName("forward:/favorite/showAllFar");
        return mv;
    }
}
