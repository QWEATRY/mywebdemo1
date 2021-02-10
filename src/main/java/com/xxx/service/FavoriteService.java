package com.xxx.service;

import com.xxx.dao.FavoriteDao;
import com.xxx.domain.Favorite;

import java.util.List;

public interface FavoriteService {

    List<Favorite> selectAll();

    Favorite selectFavoriteByName(String name);

    Favorite selectFavoriteById(Integer id);

    int insertFavorite(Favorite favorite);

    int deleteFavoriteById(Integer id);

    int updateFavorite(Favorite favorite);

    List<Favorite> selectAllByUserId(Integer id);

    int deleteFavoriteByUserId(Integer id);

    List<Favorite> queryFavorite(String str);
}
