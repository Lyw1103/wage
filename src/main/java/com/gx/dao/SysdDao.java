package com.gx.dao;

import com.gx.po.Sysd;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * (Sysd)表数据库访问层
 *
 * @author makejava
 * @since 2021-12-21 15:04:39
 */
public interface SysdDao {

    /**
     * 通过ID查询单条数据
     *
     * @param salaryitemid 主键
     * @return 实例对象
     */
    Sysd queryById(Integer salaryitemid);

    /**
     * 查询指定行数据
     *
     * @param sysd 查询条件
     * @param pageable         分页对象
     * @return 对象列表
     */
    List<Sysd> queryAllByLimit(Sysd sysd, @Param("pageable") Pageable pageable);

    List<Sysd> queryd();

    /**
     * 统计总行数
     *
     * @param sysd 查询条件
     * @return 总行数
     */
    long count(Sysd sysd);

    /**
     * 新增数据
     *
     * @param sysd 实例对象
     * @return 影响行数
     */
    int insert(Sysd sysd);

    /**
     * 批量新增数据（MyBatis原生foreach方法）
     *
     * @param entities List<Sysd> 实例对象列表
     * @return 影响行数
     */
    int insertBatch(@Param("entities") List<Sysd> entities);

    /**
     * 批量新增或按主键更新数据（MyBatis原生foreach方法）
     *
     * @param entities List<Sysd> 实例对象列表
     * @return 影响行数
     * @throws org.springframework.jdbc.BadSqlGrammarException 入参是空List的时候会抛SQL语句错误的异常，请自行校验入参
     */
    int insertOrUpdateBatch(@Param("entities") List<Sysd> entities);

    /**
     * 修改数据
     *
     * @param sysd 实例对象
     * @return 影响行数
     */
    int update(Sysd sysd);

    /**
     * 通过主键删除数据
     *
     * @param salaryitemid 主键
     * @return 影响行数
     */
    int deleteById(Integer salaryitemid);

}

