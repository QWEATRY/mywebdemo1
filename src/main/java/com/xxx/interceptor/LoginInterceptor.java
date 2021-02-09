package com.xxx.interceptor;

import com.xxx.domain.User;
import com.xxx.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {

    @Autowired
    private UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String username=(String)request.getSession().getAttribute("username");
        String password=(String)request.getSession().getAttribute("psw");

        if(username==null||password==null) return false;

        User user=userService.selectUserByName(username);
        String pp=user.getUserPassword();
        Integer id=user.getUserId();

        if (pp.equals(password)) {
            request.getSession().setAttribute("userId",id);
            return true;
        }

        HttpSession session = request.getSession();

        // 如果用户已登陆也放行
        if(session.getAttribute("user") != null) {
            return true;
        }

        // 用户没有登陆跳转到登陆页面
        request.getSession().setAttribute("error","用户名或密码错误");
        request.getRequestDispatcher("/user/toLogin");
        return false;
    }
}
