package com.fjut.crud.bean;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class BaseArticle {
    private Integer artId;

    private Integer artCate;

    private String artTitle;

    private String artAuthor;

    private Integer artState;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date artCreateTime;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date artUpdateTime;

    private String artUrl;

    private String artContent;

    private BaseItem baseItem;

    public BaseItem getBaseItem() {
        return baseItem;
    }

    public void setBaseItem(BaseItem baseItem) {
        this.baseItem = baseItem;
    }

    public Integer getArtId() {
        return artId;
    }

    public void setArtId(Integer artId) {
        this.artId = artId;
    }

    public Integer getArtCate() {
        return artCate;
    }

    public void setArtCate(Integer artCate) {
        this.artCate = artCate;
    }

    public String getArtTitle() {
        return artTitle;
    }

    public void setArtTitle(String artTitle) {
        this.artTitle = artTitle == null ? null : artTitle.trim();
    }

    public String getArtAuthor() {
        return artAuthor;
    }

    public void setArtAuthor(String artAuthor) {
        this.artAuthor = artAuthor == null ? null : artAuthor.trim();
    }

    public Integer getArtState() {
        return artState;
    }

    public void setArtState(Integer artState) {
        this.artState = artState;
    }

    public Date getArtCreateTime() {
        return artCreateTime;
    }

    public void setArtCreateTime(Date artCreateTime) {
        this.artCreateTime = artCreateTime;
    }

    public Date getArtUpdateTime() {
        return artUpdateTime;
    }

    public void setArtUpdateTime(Date artUpdateTime) {
        this.artUpdateTime = artUpdateTime;
    }

    public String getArtUrl() {
        return artUrl;
    }

    public void setArtUrl(String artUrl) {
        this.artUrl = artUrl == null ? null : artUrl.trim();
    }

    public String getArtContent() {
        return artContent;
    }

    public void setArtContent(String artContent) {
        this.artContent = artContent == null ? null : artContent.trim();
    }

    @Override
    public String toString() {
        return "BaseArticle{" +
                "artId=" + artId +
                ", artCate=" + artCate +
                ", artTitle='" + artTitle + '\'' +
                ", artAuthor='" + artAuthor + '\'' +
                ", artState=" + artState +
                ", artCreateTime=" + artCreateTime +
                ", artUpdateTime=" + artUpdateTime +
                ", artUrl='" + artUrl + '\'' +
                ", artContent='" + artContent + '\'' +
                ", baseItem=" + baseItem +
                '}';
    }
}