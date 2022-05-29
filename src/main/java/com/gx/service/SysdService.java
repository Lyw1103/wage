package com.gx.service;

import com.gx.po.Sysd;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.List;

/**
 * (Sysd)表服务接口
 *
 * @author makejava
 * @since 2021-12-21 15:04:39
 */
public interface SysdService {

    /**
     * 通过ID查询单条数据
     *
     * @param salaryitemid 主键
     * @return 实例对象
     */
    Sysd queryById(Integer salaryitemid);

    /**
     * 分页查询
     *
     * @param sysd 筛选条件
     * @param pageRequest      分页对象
     * @return 查询结果
     */
    Page<Sysd> queryByPage(Sysd sysd, PageRequest pageRequest);

    List<Sysd> queryd();

    /**
     * 新增数据
     *
     * @param sysd 实例对象
     * @return 实例对象
     */
    Sysd insert(Sysd sysd);

    /**
     * 修改数据
     *
     * @param sysd 实例对象
     * @return 实例对象
     */
    Integer update(Sysd sysd);

    /**
     * 通过主键删除数据
     *
     * @param salaryitemid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer salaryitemid);

}
