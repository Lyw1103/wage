package com.gx.service;

import com.gx.po.Sysc;
import com.gx.po.Sysd;
import com.gx.po.Sysf;
import com.gx.vo.LayuiTableData;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.List;

/**
 * (Sysf)表服务接口
 *
 * @author makejava
 * @since 2021-12-22 16:39:19
 */
public interface SysfService {

    List<Sysf> queryd();

    LayuiTableData<Sysf> tablepage(int page, int limit);

    /**
     * 通过ID查询单条数据
     *
     * @param basesalaryid 主键
     * @return 实例对象
     */
    Sysf queryById(Integer basesalaryid);

    /**
     * 分页查询
     *
     * @param sysf 筛选条件
     * @param pageRequest      分页对象
     * @return 查询结果
     */
    Page<Sysf> queryByPage(Sysf sysf, PageRequest pageRequest);

    /**
     * 新增数据
     *
     * @param sysf 实例对象
     * @return 实例对象
     */
    Integer insert(Sysf sysf);

    /**
     * 修改数据
     *
     * @param sysf 实例对象
     * @return 实例对象
     */
    Integer update(Sysf sysf);

    /**
     * 通过主键删除数据
     *
     * @param basesalaryid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer basesalaryid);

}
