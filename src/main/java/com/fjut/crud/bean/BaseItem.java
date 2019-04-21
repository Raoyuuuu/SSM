package com.fjut.crud.bean;

import java.util.List;

public class BaseItem {
    private Integer itemId;

    private String itemName;

    private List<BaseArticle> baseArticles;

    public List<BaseArticle> getBaseArticles() {
        return baseArticles;
    }

    public void setBaseArticles(List<BaseArticle> baseArticles) {
        this.baseArticles = baseArticles;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName == null ? null : itemName.trim();
    }

    @Override
    public String toString() {
        return "BaseItem{" +
                "itemId=" + itemId +
                ", itemName='" + itemName + '\'' +
                '}';
    }
}