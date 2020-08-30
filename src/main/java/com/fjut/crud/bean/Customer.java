package com.fjut.crud.bean;


import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;



public class Customer {


    private Long cust_id;

    //@Pattern(regexp = "(^[a-z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})",message = "用户名为2-5位中文，或者3-16位英文和数字组合")
    private String cust_name;

    private Integer cust_source;

    private Integer cust_industry;

    private Integer cust_type;

    private String cust_phone;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private String cust_create_time;

    private String cust_email;

    private String cust_operator;


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

    public Integer getCust_source() {
        return cust_source;
    }

    public void setCust_source(Integer cust_source) {
        this.cust_source = cust_source;
    }

    public Integer getCust_industry() {
        return cust_industry;
    }

    public void setCust_industry(Integer cust_industry) {
        this.cust_industry = cust_industry;
    }

    public Integer getCust_type() {
        return cust_type;
    }

    public void setCust_type(Integer cust_type) {
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

    public String getCust_email() {
        return cust_email;
    }

    public void setCust_email(String cust_email) {
        this.cust_email = cust_email;
    }

    public String getCust_operator() {
        return cust_operator;
    }

    public void setCust_operator(String cust_operator) {
        this.cust_operator = cust_operator;
    }
}