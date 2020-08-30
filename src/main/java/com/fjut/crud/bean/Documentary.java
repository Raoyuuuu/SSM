package com.fjut.crud.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 跟单实体类
 * dct_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '跟单主键',
 *   `dct_no` int(11) DEFAULT NULL COMMENT '客户外键',
 *   `dct_way` int(11) DEFAULT NULL COMMENT '跟单方式',
 *   `dct_state` int(11) DEFAULT NULL COMMENT '跟单状态',
 *   `dct_object` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '跟单对象',
 *   `dct_next_time` datetime DEFAULT NULL COMMENT '下次联系时间',
 *   `dct_remark` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
 *   `dct_personnel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '跟单人',
 *   `dct_create_time` datetime DEFAULT NULL COMMENT '跟单时间
 */
public class Documentary {

    private Integer dctId;

    //客户外键
    private Integer dctNo;

    //跟单方式
    private Integer dctWay;

    //跟单状态
    private Integer dctState;

    //跟单对象
    private String dctObject;

    //下次联系时间
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date dctNextTime;

    //备注
    private String dctRemark;

    //跟单人
    private String dctPersonnel;

    //跟单时间
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date dctCreateTime;

    public Integer getDctId() {
        return dctId;
    }

    public void setDctId(Integer dctId) {
        this.dctId = dctId;
    }

    public Integer getDctNo() {
        return dctNo;
    }

    public void setDctNo(Integer dctNo) {
        this.dctNo = dctNo;
    }

    public Integer getDctWay() {
        return dctWay;
    }

    public void setDctWay(Integer dctWay) {
        this.dctWay = dctWay;
    }

    public Integer getDctState() {
        return dctState;
    }

    public void setDctState(Integer dctState) {
        this.dctState = dctState;
    }

    public String getDctObject() {
        return dctObject;
    }

    public void setDctObject(String dctObject) {
        this.dctObject = dctObject;
    }

    public Date getDctNextTime() {
        return dctNextTime;
    }

    public void setDctNextTime(Date dctNextTime) {
        this.dctNextTime = dctNextTime;
    }

    public String getDctRemark() {
        return dctRemark;
    }

    public void setDctRemark(String dctRemark) {
        this.dctRemark = dctRemark;
    }

    public String getDctPersonnel() {
        return dctPersonnel;
    }

    public void setDctPersonnel(String dctPersonnel) {
        this.dctPersonnel = dctPersonnel;
    }

    public Date getDctCreateTime() {
        return dctCreateTime;
    }

    public void setDctCreateTime(Date dctCreateTime) {
        this.dctCreateTime = dctCreateTime;
    }
}
