package com.fjut.crud.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Knowledge{

    private Integer artId;

    private String artCate;

    private String artTitle;

    private String artContent;

    private String artAuthor;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date artCreateTime;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date artUpdateTime;

    public Integer getArtId() {
        return artId;
    }

    public void setArtId(Integer artId) {
        this.artId = artId;
    }

    public String getArtCate() {
        return artCate;
    }

    public void setArtCate(String artCate) {
        this.artCate = artCate;
    }

    public String getArtTitle() {
        return artTitle;
    }

    public void setArtTitle(String artTitle) {
        this.artTitle = artTitle;
    }

    public String getArtContent() {
        return artContent;
    }

    public void setArtContent(String artContent) {
        this.artContent = artContent;
    }

    public String getArtAuthor() {
        return artAuthor;
    }

    public void setArtAuthor(String artAuthor) {
        this.artAuthor = artAuthor;
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
}