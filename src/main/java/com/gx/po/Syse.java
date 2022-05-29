package com.gx.po;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * syse
 * @author 
 */
@Data
public class Syse implements Serializable {
    /**
     * 考勤id
     */
    private Integer attendanceid;

    private Integer workerid;

    /**
     * 病假
     */
    private String sickleave;

    /**
     * 事假
     */
    private String thingsfake;

    /**
     * 平时加班
     */
    private String usuallyovertime;

    /**
     * 周未加班
     */
    private String weekly;

    /**
     * 节假日加班
     */
    private String overtimeonholidays;

    /**
     * 迟到次数
     */
    private String latearrivals;

    /**
     * 早退次数
     */
    private String earlyarrivals;

    /**
     * 缺勤天数
     */
    private String absences;

    /**
     * 出差天数
     */
    private String travelallowanceday;

    /**
     * 考勤时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")  //必须加上GMT+8 否则在原基础上加上
    private Date attendancetime;

    /**
     * 状态(0是待审核状态，1是审核通过，2是审核不通过)
     */
    private Byte state;

    private static final long serialVersionUID = 1L;
}