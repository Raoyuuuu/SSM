package com.fjut.crud.bean;


import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;



public class Customer {


    private Long cust_id;

    //@Pattern(regexp = "(^[a-z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})",message = "用户名为2-5位中文，或者3-16位英文和数字组合")
    private String cust_name;

    private String cust_source;

    private String cust_industry;

    private String cust_type;

    private String cust_phone;

    @DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private String cust_create_time;


    public Long getCust_id() {
        return cust_id;
    }

    public void setCust_id(Long cust_id) {
        this.cust_id = cust_id;
    }

    public String getCust_name() {
        return cust_name;
    }

    public void setCust_name(String cust_name) {
        this.cust_name = cust_name;
    }

    public String getCust_source() {
        return cust_source;
    }

    public void setCust_source(String cust_source) {
        this.cust_source = cust_source;
    }

    public String getCust_industry() {
        return cust_industry;
    }

    public void setCust_industry(String cust_industry) {
        this.cust_industry = cust_industry;
    }

    public String getCust_type() {
        return cust_type;
    }

    public void setCust_type(String cust_type) {
        this.cust_type = cust_type;
    }

    public String getCust_phone() {
        return cust_phone;
    }

    public void setCust_phone(String cust_phone) {
        this.cust_phone = cust_phone;
    }

    public String getCust_create_time() {
        return cust_create_time;
    }

    public void setCust_create_time(String cust_create_time) {
        this.cust_create_time = cust_create_time;
    }
}