package com.gx.dao;

import com.gx.po.Sysc;
import com.gx.po.Sysd;
import com.gx.po.Sysf;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * (Sysf)表数据库访问层
 *
 * @author makejava
 * @since 2021-12-22 16:39:18
 */
public interface SysfDao {

    List<Sysf> queryd();

    List<Sysf> tablepageList(
            @Param("page") int page,
            @Param("limit") int limit);
    int counttablepage();

    /**
     * 通过ID查询单条数据
     *
     * @param basesalaryid 主键
     * @return 实例对象
     */
    Sysf queryById(Integer basesalaryid);

    /**
     * 查询指定行数据
     *
     * @param sysf 查询条件
     * @param pageable         分页对象
     * @return 对象列表
     */
    List<Sysf> queryAllByLimit(Sysf sysf, @Param("pageable") Pageable pageable);

    /**
     * 统计总行数
     *
     * @param sysf 查询条件
     * @return 总行数
     */
    long count(Sysf sysf);

    /**
     * 新增数据
     *
     * @param sysf 实例对象
     * @return 影响行数
     */
    int insert(Sysf sysf);

    /**
     * 批量新增数据（MyBatis原生foreach方法）
     *
     * @param entities List<Sysf> 实例对象列表
     * @return 影响行数
     */
    int insertBatch(@Param("entities") List<Sysf> entities);

    /**
     * 批量新增或按主键更新数据（MyBatis原生foreach方法）
     *
     * @param entities List<Sysf> 实例对象列表
     * @return 影响行数
     * @throws org.springframework.jdbc.BadSqlGrammarException 入参是空List的时候会抛SQL语句错误的异常，请自行校验入参
     */
    int insertOrUpdateBatch(@Param("entities") List<Sysf> entities);

    /**
     * 修改数据
     *
     * @param sysf 实例对象
     * @return 影响行数
     */
    int update(Sysf sysf);

    /**
     * 通过主键删除数据
     *
     * @param basesalaryid 主键
     * @return 影响行数
     */
    int deleteById(Integer basesalaryid);

}

