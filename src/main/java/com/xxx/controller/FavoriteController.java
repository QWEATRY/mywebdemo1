package com.xxx.controller;

import com.xxx.domain.Favorite;
import com.xxx.service.FavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/favorite")
public class FavoriteController {

    @Autowired
    private FavoriteService favoriteService;

    @RequestMapping("/showAllFar")
    public ModelAndView showAllFar(HttpServletRequest request)
    {
        Integer id=(Integer)request.getSession().getAttribute("userId");
        List<Favorite> list=favoriteService.selectAllByUserId(id);
        ModelAndView mv=new ModelAndView();
        mv.addObject("list",list);
//        mv.setViewName("showAllFar");
        mv.setViewName("showAllFar");
        return mv;
    }

    @RequestMapping("/toAddFar")
    public String toAddFar(HttpServletRequest request)
    {
        request.getSession().setAttribute("function","/favorite/addFar");
        return "addUpdateFar";
    }

    @RequestMapping("/addFar")
    public String addFar(Favorite favorite)
    {
        favoriteService.insertFavorite(favorite);

        List<Favorite> favorites=favoriteService.selectAll();
        System.out.println(favorites);

        return "redirect:/favorite/showAllFar";
    }

    @RequestMapping("/toUpdateFar")
    public ModelAndView toUpdateFar(Integer favoriteId,HttpServletRequest request)
    {
        ModelAndView mv=new ModelAndView();
        Favorite favorite=favoriteService.selectFavoriteById(favoriteId);
        mv.addObject("far",favorite);
        request.getSession().setAttribute("function","/favorite/updateFar");
        mv.setViewName("addUpdateFar");
        return mv;
    }

    @RequestMapping("/updateFar")
    public String updateFar(Favorite favorite)
    {
        favoriteService.updateFavorite(favorite);
        System.out.println(favorite);
        return "redirect:/favorite/showAllFar";
    }

    @RequestMapping("/deleteFar")
    public String deleteFar(Integer favoriteId)
    {
        favoriteService.deleteFavoriteById(favoriteId);
        return "forward:/favorite/showAllFar";
    }

    @RequestMapping("/queryFar")
    public ModelAndView queryFar(String queryFar)
    {
        ModelAndView mv=new ModelAndView();
        List<Favorite> list=new ArrayList<>();
        list=favoriteService.queryFavorite(queryFar);
        System.out.println(queryFar);
        System.out.println(list);
        if(list.isEmpty())
        {
            mv.addObject("error","查询没有结果");
            System.out.println("error");
        }
        else mv.addObject("list",list);
        mv.setViewName("showAllFar");
        return mv;
    }

    @RequestMapping("toUrl")
    public String toUrl(String url)
    {
        System.out.println(url);
        return "redirect:"+url;
    }
}
