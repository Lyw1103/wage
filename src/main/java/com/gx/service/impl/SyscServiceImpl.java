package com.gx.service.impl;

import com.gx.dao.SyscDao;
import com.gx.po.Sysc;
import com.gx.service.SyscService;
import com.gx.vo.LayuiTableData;
import com.gx.vo.workerVo;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Sysc)表服务实现类
 *
 * @author makejava
 * @since 2021-12-20 10:59:39
 */
@Service("syscService")
public class SyscServiceImpl implements SyscService {
    @Resource
    private SyscDao syscDao;

    @Override
    public LayuiTableData<Sysc> tablepage(int page, int limit,String workernumber,String name,String department) {
        //查询分页数据
        List<Sysc> work=this.syscDao.tablepageList(page,limit,workernumber,name,department);
        //查询数据总条数
        int totalRows=this.syscDao.counttablepage(workernumber,name,department);
        return new LayuiTableData<>(totalRows,work);
    }

    @Override
    public LayuiTableData<workerVo> wagespage(int page, int limit) {
        //查询分页数据
        List<workerVo> wages=this.syscDao.wagespageList(page,limit);
        //查询数据总条数
        int totalRows=this.syscDao.countwagespage();
        return new LayuiTableData<>(totalRows,wages);
    }

    /**
     * 查询
     * @param name
     * @param workernumber
     * @return
     */
    @Override
    public Sysc queryById(String name, String workernumber) {
        return this.syscDao.queryById(name,workernumber);
    }

    /**
     * 分页查询
     *
     * @param sysc 筛选条件
     * @param pageRequest      分页对象
     * @return 查询结果
     */
    @Override
    public Page<Sysc> queryByPage(Sysc sysc, PageRequest pageRequest) {
        long total = this.syscDao.count(sysc);
        return new PageImpl<>(this.syscDao.queryAllByLimit(sysc, pageRequest), pageRequest, total);
    }

    @Override
    public List<Sysc> query() {
        return this.syscDao.query();
    }
    @Override
    public List<Sysc> queryA() {
        return this.syscDao.queryA();
    }

    /**
     * 新增数据
     *
     * @param sysc 实例对象
     * @return 实例对象
     */
    @Override
    public Integer insert(Sysc sysc) {
        return this.syscDao.insert(sysc);
    }

    /**
     * 修改数据
     *
     * @param sysc 实例对象
     * @return 实例对象
     */
    @Override
    public Integer update(Sysc sysc) {
        return  this.syscDao.update(sysc);
    }

    /**
     * 通过主键删除数据
     *
     * @param workerid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer workerid) {
        return this.syscDao.deleteById(workerid) > 0;
    }
}
