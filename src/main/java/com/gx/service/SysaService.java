package com.gx.service;

import com.gx.po.Sysa;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

/**
 * (Sysa)表服务接口
 *
 * @author makejava
 * @since 2021-12-16 15:52:52
 */
public interface SysaService {

    /**
     * 通过ID查询单条数据
     *
     * @param userid 主键
     * @return 实例对象
     */
    Sysa queryById(Integer userid);

    /**
     * 分页查询
     *
     * @param sysa 筛选条件
     * @param pageRequest      分页对象
     * @return 查询结果
     */
    Page<Sysa> queryByPage(Sysa sysa, PageRequest pageRequest);

    /**
     * 新增数据
     *
     * @param sysa 实例对象
     * @return 实例对象
     */
    Sysa insert(Sysa sysa);

    /**
     * 修改数据
     *
     * @param sysa 实例对象
     * @return 实例对象
     */
    boolean update(Sysa sysa);

    /**
     * 通过主键删除数据
     *
     * @param userid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer userid);

}
