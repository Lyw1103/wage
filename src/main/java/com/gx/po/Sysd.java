package com.gx.po;

import java.io.Serializable;
import lombok.Data;

/**
 * sysd
 * @author 
 */
@Data
public class Sysd implements Serializable {
    /**
     * 工资项id
     */
    private Integer salaryitemid;

    /**
     * 早退罚金
     */
    private String latearrivalpenalty;

    /**
     * 早退罚金
     */
    private String earlyrefundpenalty;

    /**
     * 出差补贴
     */
    private String travelallowance;

    /**
     * 全勤奖
     */
    private String attendanceaward;

    /**
     * 餐饮补贴
     */
    private String foodandbeveragesubsidies;

    /**
     * 交通补贴
     */
    private String transportationsubsidies;

    /**
     * 平时加班工价
     */
    private String overtimworkrates;

    /**
     * 周末加班工价
     */
    private String weekendovertimerates;

    private static final long serialVersionUID = 1L;
}