package com.gx.po;

import java.io.Serializable;
import lombok.Data;

/**
 * sysa
 * @author 
 */
@Data
public class Sysa implements Serializable {
    /**
     * 用户id
     */
    private Integer userid;

    /**
     * 用户名
     */
    private String username;

    /**
     * 用户密码
     */
    private String userpassword;

    /**
     * 盐值
     */
    private String salt;

    private static final long serialVersionUID = 1L;
}