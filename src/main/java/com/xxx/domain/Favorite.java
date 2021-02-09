package com.xxx.domain;

import java.util.Date;

public class Favorite {

    private Integer favoriteId;
    private String favoriteName;

//    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

//    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    private String content;
    private String farUrl;
    private Integer userId;

    public Integer getFavoriteId() {
        return favoriteId;
    }

    public void setFavoriteId(Integer favoriteId) {
        this.favoriteId = favoriteId;
    }

    public String getFavoriteName() {
        return favoriteName;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public void setFavoriteName(String favoriteName) {
        this.favoriteName = favoriteName;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getFarUrl() {
        return farUrl;
    }

    public void setFarUrl(String farUrl) {
        this.farUrl = farUrl;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Favorite{" +
                "favoriteId=" + favoriteId +
                ", favoriteName='" + favoriteName + '\'' +
                ", putTime=" + createTime +
                ", content='" + content + '\'' +
                ", farUrl='" + farUrl + '\'' +
                ", userId=" + userId +
                '}';
    }
}
