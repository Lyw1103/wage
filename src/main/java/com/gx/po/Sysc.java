package com.gx.po;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * sysc
 * @author 
 */
@Data
public class Sysc implements Serializable {
    /**
     * 工人信息id
     */
    private Integer workerid;
    private Integer basesalaryid;
    private Integer salaryitemid;

    /**
     * 姓名
     */
    private String name;

    /**
     * 工号
     */
    private String workernumber;

    /**
     * 性别
     */
    private String sex;

    /**
     * 年龄
     */
    private String age;

    /**
     * 出生年月
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;

    /**
     * 民族
     */
    private String nation;

    /**
     * 身份证号
     */
    private String card;

    /**
     * 家庭地址
     */
    private String address;

    /**
     * 学历
     */
    private String degree;

    /**
     * 电话
     */
    private String phone;

    /**
     * 紧急联系人
     */
    private String emergencycontacts;

    /**
     * 紧急联系人电话
     */
    private String emergencycontactsphone;

    /**
     * 岗位
     */
    private String post;

    /**
     * 部门
     */
    private String department;

    /**
     * 入职日期
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")  //必须加上GMT+8 否则在原基础上加上
    private Date onboardingdate;

    /**
     * 是否在职
     */
    private Byte isincumbency;
    private Byte status;
    private Byte issuestate;

    private static final long serialVersionUID = 1L;
}