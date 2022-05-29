package com.gx.service.impl;

import com.gx.dao.SysaDao;
import com.gx.po.Sysa;
import com.gx.service.ILoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("loginService")
@Transactional
public class LoginServiceImpl implements ILoginService {
    // dao
    @Autowired
    private SysaDao sysaDao;

    @Override
    public Sysa selectUserByName(String username) {
        //直接调用dao的方法
        return this.sysaDao.findUserByName(username);
    }
}
