package com.gx.po;

import java.io.Serializable;
import lombok.Data;

/**
 * sysf
 * @author 
 */
@Data
public class Sysf implements Serializable {
    /**
     * 基本工资id
     */
    private Integer basesalaryid;

    /**
     * 基本工资
     */
    private String basesalary;
    private static final long serialVersionUID = 1L;
}