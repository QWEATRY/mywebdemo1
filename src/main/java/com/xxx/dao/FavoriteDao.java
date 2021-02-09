package com.xxx.dao;

import com.xxx.domain.Favorite;

import java.util.List;

public interface FavoriteDao {

    List<Favorite> selectAll();

    Favorite selectFavoriteByName(String name);

    Favorite selectFavoriteById(Integer id);

    int insertFavorite(Favorite favorite);

    int deleteFavoriteById(Integer id);

    int updateFavorite(Favorite favorite);

    List<Favorite> selectAllByUserId(Integer id);
}
