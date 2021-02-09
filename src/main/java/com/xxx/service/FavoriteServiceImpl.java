package com.xxx.service;

import com.xxx.dao.FavoriteDao;
import com.xxx.domain.Favorite;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FavoriteServiceImpl implements FavoriteService {

    @Autowired
    private FavoriteDao favoriteDao;

    @Override
    public List<Favorite> selectAll() {
        return favoriteDao.selectAll();
    }

    @Override
    public Favorite selectFavoriteByName(String name) {
        return favoriteDao.selectFavoriteByName(name);
    }

    @Override
    public Favorite selectFavoriteById(Integer id) {
        return favoriteDao.selectFavoriteById(id);
    }

    @Override
    public int insertFavorite(Favorite favorite) {
        return favoriteDao.insertFavorite(favorite);
    }

    @Override
    public int deleteFavoriteById(Integer id) {
        return favoriteDao.deleteFavoriteById(id);
    }

    @Override
    public int updateFavorite(Favorite favorite) {
        return favoriteDao.updateFavorite(favorite);
    }

    @Override
    public List<Favorite> selectAllByUserId(Integer id) {
        return favoriteDao.selectAllByUserId(id);
    }

    public FavoriteDao getFavoriteDao() {
        return favoriteDao;
    }

    public void setFavoriteDao(FavoriteDao favoriteDao) {
        this.favoriteDao = favoriteDao;
    }
}
