package com.gx.service.impl;

import com.gx.dao.SyseDao;
import com.gx.po.Sysc;
import com.gx.po.Syse;
import com.gx.service.SyseService;
import com.gx.vo.LayuiTableData;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Syse)表服务实现类
 *
 * @author makejava
 * @since 2021-12-22 08:32:14
 */
@Service("syseService")
public class SyseServiceImpl implements SyseService {
    @Resource
    private SyseDao syseDao;

    @Override
    public LayuiTableData<Syse> tablepage(int page, int limit, String workernumber, String name, String department) {
        //查询分页数据
        List<Syse> work=this.syseDao.tablepageList(page,limit,workernumber,name,department);
        //查询数据总条数
        int totalRows=this.syseDao.counttablepage(workernumber,name,department);
        return new LayuiTableData<>(totalRows,work);
    }


    /**
     * 通过ID查询单条数据
     *
     * @param attendanceid 主键
     * @return 实例对象
     */
    @Override
    public Syse queryById(Integer attendanceid) {
        return this.syseDao.queryById(attendanceid);
    }

    /**
     * 分页查询
     *
     * @param syse 筛选条件
     * @param pageRequest      分页对象
     * @return 查询结果
     */
    @Override
    public Page<Syse> queryByPage(Syse syse, PageRequest pageRequest) {
        long total = this.syseDao.count(syse);
        return new PageImpl<>(this.syseDao.queryAllByLimit(syse, pageRequest), pageRequest, total);
    }

    /**
     * 新增数据
     *
     * @param syse 实例对象
     * @return 实例对象
     */
    @Override
    public Integer insert(Syse syse) {
        return this.syseDao.insert(syse);
    }

    /**
     * 修改数据
     *
     * @param syse 实例对象
     * @return 实例对象
     */
    @Override
    public Integer update(Syse syse) {
        return this.syseDao.update(syse);
    }

    /**
     * 通过主键删除数据
     *
     * @param attendanceid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer attendanceid) {
        return this.syseDao.deleteById(attendanceid) > 0;
    }
}
