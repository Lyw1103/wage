package com.gx.service;

import com.gx.po.Sysa;

/**
 * 登录 服务层接口
 */
public interface ILoginService {
    /**
     * 根据用户名查找用户数据 (login)
     * @param username 用户名
     * @return 用户数据
     */
    Sysa selectUserByName(String username);
}
