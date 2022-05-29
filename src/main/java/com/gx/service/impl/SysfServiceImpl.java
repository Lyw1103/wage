package com.gx.service.impl;

import com.gx.dao.SysfDao;
import com.gx.po.Sysc;
import com.gx.po.Sysd;
import com.gx.po.Sysf;
import com.gx.service.SysfService;
import com.gx.vo.LayuiTableData;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Sysf)表服务实现类
 *
 * @author makejava
 * @since 2021-12-22 16:39:19
 */
@Service("sysfService")
public class SysfServiceImpl implements SysfService {
    @Resource
    private SysfDao sysfDao;

    @Override
    public List<Sysf> queryd() {
        return this.sysfDao.queryd();
    }

    @Override
    public LayuiTableData<Sysf> tablepage(int page, int limit) {
        //查询分页数据
        List<Sysf> work=this.sysfDao.tablepageList(page,limit);
        //查询数据总条数
        int totalRows=this.sysfDao.counttablepage();
        return new LayuiTableData<>(totalRows,work);
    }

    /**
     * 通过ID查询单条数据
     *
     * @param basesalaryid 主键
     * @return 实例对象
     */
    @Override
    public Sysf queryById(Integer basesalaryid) {
        return this.sysfDao.queryById(basesalaryid);
    }

    /**
     * 分页查询
     *
     * @param sysf 筛选条件
     * @param pageRequest      分页对象
     * @return 查询结果
     */
    @Override
    public Page<Sysf> queryByPage(Sysf sysf, PageRequest pageRequest) {
        long total = this.sysfDao.count(sysf);
        return new PageImpl<>(this.sysfDao.queryAllByLimit(sysf, pageRequest), pageRequest, total);
    }

    /**
     * 新增数据
     *
     * @param sysf 实例对象
     * @return 实例对象
     */
    @Override
    public Integer insert(Sysf sysf) {
        return this.sysfDao.insert(sysf);
    }

    /**
     * 修改数据
     *
     * @param sysf 实例对象
     * @return 实例对象
     */
    @Override
    public Integer update(Sysf sysf) {
        return this.sysfDao.update(sysf);
    }

    /**
     * 通过主键删除数据
     *
     * @param basesalaryid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer basesalaryid) {
        return this.sysfDao.deleteById(basesalaryid) > 0;
    }
}
