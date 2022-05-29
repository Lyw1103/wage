package com.gx.service.impl;

import com.gx.dao.SysdDao;
import com.gx.po.Sysd;
import com.gx.service.SysdService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Sysd)表服务实现类
 *
 * @author makejava
 * @since 2021-12-21 15:04:40
 */
@Service("sysdService")
public class SysdServiceImpl implements SysdService {
    @Resource
    private SysdDao sysdDao;

    /**
     * 通过ID查询单条数据
     *
     * @param salaryitemid 主键
     * @return 实例对象
     */
    @Override
    public Sysd queryById(Integer salaryitemid) {
        return this.sysdDao.queryById(salaryitemid);
    }

    /**
     * 分页查询
     *
     * @param sysd 筛选条件
     * @param pageRequest      分页对象
     * @return 查询结果
     */
    @Override
    public Page<Sysd> queryByPage(Sysd sysd, PageRequest pageRequest) {
        long total = this.sysdDao.count(sysd);
        return new PageImpl<>(this.sysdDao.queryAllByLimit(sysd, pageRequest), pageRequest, total);
    }


    @Override
    public List<Sysd> queryd() {
        return this.sysdDao.queryd();
    }

    /**
     * 新增数据
     *
     * @param sysd 实例对象
     * @return 实例对象
     */
    @Override
    public Sysd insert(Sysd sysd) {
        this.sysdDao.insert(sysd);
        return sysd;
    }

    /**
     * 修改数据
     *
     * @param sysd 实例对象
     * @return 实例对象
     */
    @Override
    public Integer update(Sysd sysd) {
        return this.sysdDao.update(sysd);
    }

    /**
     * 通过主键删除数据
     *
     * @param salaryitemid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer salaryitemid) {
        return this.sysdDao.deleteById(salaryitemid) > 0;
    }
}
