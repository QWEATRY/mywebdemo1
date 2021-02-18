package com.xxx.controller;

import com.mysql.cj.Session;
import com.xxx.domain.User;
import com.xxx.service.FavoriteService;
import com.xxx.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private FavoriteService favoriteService;

    @RequestMapping("/toLogin")
    public String toLogin(HttpServletRequest request)
    {
        String name= (String) request.getSession().getAttribute("username");
        String p= (String) request.getSession().getAttribute("psw");

        //使用cookie
        Cookie[] cookies=request.getCookies();
        if(cookies!=null){
            for(Cookie cookie:cookies){
                String cookieName=cookie.getName();
                String cookieValue=cookie.getValue();
                if("username".equals(cookieName)&&!cookieValue.isEmpty()) {
                    name=cookieValue;
                    User user=userService.selectUserByName(name);
                    Integer userId=user.getUserId();
                    request.getSession().setAttribute("userId",userId);
                }
                else if("psw".equals(cookieName)&&!cookieValue.isEmpty()) p=cookieValue;
            }
        }
        if(name!=null&&p!=null) return "showAllFar";
        else return "login";
    }

    @RequestMapping("/login")
    public ModelAndView login(String username, String psw, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv=new ModelAndView();
        String error="用户名或密码不正确";
        User user=userService.selectUserByName(username);
        if(user==null)
        {
            mv.addObject("error",error);
            mv.setViewName("login");
            return mv;
        }
        String password=user.getUserPassword();
        if(password.equals(psw)){
            mv.setViewName("forward:/favorite/showAllFar");
            Integer id=user.getUserId();
            request.getSession().setAttribute("userId",id);
            request.getSession().setAttribute("username",username);
            request.getSession().setAttribute("psw",psw);

            //登录成功后，使用cookie
            String autoLogin=request.getParameter("autoLogin");
            if("ok".equals(autoLogin)){
                //选择了“记住我”，要设置cookie
                Cookie cookie1=new Cookie("username",username);
                Cookie cookie2=new Cookie("psw",psw);
                cookie1.setMaxAge(60*60*24*10);
                cookie2.setMaxAge(60*60*24*10);
                cookie1.setPath(request.getContextPath());
                cookie2.setPath(request.getContextPath());
                response.addCookie(cookie1);
                response.addCookie(cookie2);
            }
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

    @RequestMapping("/deleteUser")
    @Transactional(
//          传播行为
            propagation = Propagation.REQUIRED,
//          隔离等级
            isolation = Isolation.DEFAULT,
//            是否是可读的（用于select）
            readOnly = false,
//          抛出什么异常时，进行回滚操作
            rollbackFor = {NullPointerException.class}
    )
    public String deleteUser(Integer userId,HttpServletRequest request,HttpServletResponse response)
    {

        User user=userService.selectUserById(userId);
        if(user==null) throw new NullPointerException();
        userService.deleteUserById(userId);
        favoriteService.deleteFavoriteByUserId(userId);

        request.getSession().removeAttribute("userId");
        request.getSession().removeAttribute("username");
        request.getSession().removeAttribute("psw");

        Cookie[] cookies=request.getCookies();
        if(cookies!=null)
        {
            for(Cookie cookie:cookies){

                if(cookie.getName().equals("username")||cookie.getName().equals("psw")){

                    System.out.println("find cookie named username or psw");
                    Cookie cookie1=new Cookie(cookie.getName(),null);
                    cookie1.setMaxAge(0);
                    cookie1.setPath(request.getContextPath());
                    response.addCookie(cookie1);
                }
            }
        }

        return "forward:/index.jsp";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request,HttpServletResponse response)
    {
        request.getSession().invalidate();

        Cookie[] cookies=request.getCookies();
        for(Cookie cookie:cookies){
            if(cookie.getName().equals("username")||cookie.getName().equals("psw")){

                Cookie cookie1=new Cookie(cookie.getName(),null);
                cookie1.setMaxAge(0);
                cookie1.setPath(request.getContextPath());
                response.addCookie(cookie1);
            }
        }
        return "forward:/index.jsp";
    }
}
