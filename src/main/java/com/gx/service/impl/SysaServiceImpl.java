package com.gx.service.impl;

import com.gx.dao.SysaDao;
import com.gx.po.Sysa;
import com.gx.service.SysaService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * (Sysa)表服务实现类
 *
 * @author makejava
 * @since 2021-12-16 15:52:53
 */
@Service("sysaService")
public class SysaServiceImpl implements SysaService {
    @Resource
    private SysaDao sysaDao;

    /**
     * 通过ID查询单条数据
     *
     * @param userid 主键
     * @return 实例对象
     */
    @Override
    public Sysa queryById(Integer userid) {
        return this.sysaDao.queryById(userid);
    }

    /**
     * 分页查询
     *
     * @param sysa 筛选条件
     * @param pageRequest      分页对象
     * @return 查询结果
     */
    @Override
    public Page<Sysa> queryByPage(Sysa sysa, PageRequest pageRequest) {
        long total = this.sysaDao.count(sysa);
        return new PageImpl<>(this.sysaDao.queryAllByLimit(sysa, pageRequest), pageRequest, total);
    }

    /**
     * 新增数据
     *
     * @param sysa 实例对象
     * @return 实例对象
     */
    @Override
    public Sysa insert(Sysa sysa) {
        this.sysaDao.insert(sysa);
        return sysa;
    }

    /**
     * 修改数据
     *
     * @param sysa 实例对象
     * @return 实例对象
     */
    @Override
    public boolean update(Sysa sysa) {
        return this.sysaDao.update(sysa) > 0;
    }

    /**
     * 通过主键删除数据
     *
     * @param userid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer userid) {
        return this.sysaDao.deleteById(userid) > 0;
    }
}
