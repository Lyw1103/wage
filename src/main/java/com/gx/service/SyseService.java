package com.gx.service;

import com.gx.po.Sysc;
import com.gx.po.Syse;
import com.gx.vo.LayuiTableData;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

/**
 * (Syse)表服务接口
 *
 * @author makejava
 * @since 2021-12-22 08:32:14
 */
public interface SyseService {

    LayuiTableData<Syse> tablepage(int page, int limit, String workernumber, String name, String department);

    /**
     * 通过ID查询单条数据
     *
     * @param attendanceid 主键
     * @return 实例对象
     */
    Syse queryById(Integer attendanceid);

    /**
     * 分页查询
     *
     * @param syse 筛选条件
     * @param pageRequest      分页对象
     * @return 查询结果
     */
    Page<Syse> queryByPage(Syse syse, PageRequest pageRequest);

    /**
     * 新增数据
     *
     * @param syse 实例对象
     * @return 实例对象
     */
    Integer insert(Syse syse);

    /**
     * 修改数据
     *
     * @param syse 实例对象
     * @return 实例对象
     */
    Integer update(Syse syse);

    /**
     * 通过主键删除数据
     *
     * @param attendanceid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer attendanceid);

}
