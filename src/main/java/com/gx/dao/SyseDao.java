package com.gx.dao;

import com.gx.po.Sysc;
import com.gx.po.Syse;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * (Syse)表数据库访问层
 *
 * @author makejava
 * @since 2021-12-22 08:32:13
 */
public interface SyseDao {

    List<Syse> tablepageList(
            @Param("page") int page,
            @Param("limit") int limit,
            @Param("workernumber") String workernumber,
            @Param("name") String name,
            @Param("department") String department);
    int counttablepage(
            @Param("workernumber") String workernumber,
            @Param("name") String name,
            @Param("department") String department);

    /**
     * 通过ID查询单条数据
     *
     * @param attendanceid 主键
     * @return 实例对象
     */
    Syse queryById(Integer attendanceid);

    /**
     * 查询指定行数据
     *
     * @param syse 查询条件
     * @param pageable         分页对象
     * @return 对象列表
     */
    List<Syse> queryAllByLimit(Syse syse, @Param("pageable") Pageable pageable);

    /**
     * 统计总行数
     *
     * @param syse 查询条件
     * @return 总行数
     */
    long count(Syse syse);

    /**
     * 新增数据
     *
     * @param syse 实例对象
     * @return 影响行数
     */
    int insert(Syse syse);

    /**
     * 批量新增数据（MyBatis原生foreach方法）
     *
     * @param entities List<Syse> 实例对象列表
     * @return 影响行数
     */
    int insertBatch(@Param("entities") List<Syse> entities);

    /**
     * 批量新增或按主键更新数据（MyBatis原生foreach方法）
     *
     * @param entities List<Syse> 实例对象列表
     * @return 影响行数
     * @throws org.springframework.jdbc.BadSqlGrammarException 入参是空List的时候会抛SQL语句错误的异常，请自行校验入参
     */
    int insertOrUpdateBatch(@Param("entities") List<Syse> entities);

    /**
     * 修改数据
     *
     * @param syse 实例对象
     * @return 影响行数
     */
    int update(Syse syse);

    /**
     * 通过主键删除数据
     *
     * @param attendanceid 主键
     * @return 影响行数
     */
    int deleteById(Integer attendanceid);

}

