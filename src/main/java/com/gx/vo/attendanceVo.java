package com.gx.vo;

import com.gx.po.Syse;
import lombok.Data;

import java.io.Serializable;

@Data
public class attendanceVo extends Syse implements Serializable  {
    private static final long serialVersionUID = -7088818645582862651L;

    /**
     * 姓名
     */
    private String name;

    /**
     * 工号
     */
    private String workernumber;

    /**
     * 身份证号
     */
    private String card;


    /**
     * 岗位
     */
    private String post;

    /**
     * 部门
     */
    private String department;
}
