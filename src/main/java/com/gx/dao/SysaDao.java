package com.gx.dao;

import com.gx.po.Sysa;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * (Sysa)表数据库访问层
 *
 * @author makejava
 * @since 2021-12-16 15:52:49
 */
@Repository("IsysaDao")
public interface SysaDao {

    /**
     * 根据用户名查询用户
     *
     * @param username 用户名
     * @return 用户对象
     */
    Sysa findUserByName(String username);

    /**
     * 通过ID查询单条数据
     *
     * @param userid 主键
     * @return 实例对象
     */
    Sysa queryById(Integer userid);

    /**
     * 查询指定行数据
     *
     * @param sysa 查询条件
     * @param pageable         分页对象
     * @return 对象列表
     */
    List<Sysa> queryAllByLimit(Sysa sysa, @Param("pageable") Pageable pageable);

    /**
     * 统计总行数
     *
     * @param sysa 查询条件
     * @return 总行数
     */
    long count(Sysa sysa);

    /**
     * 新增数据
     *
     * @param sysa 实例对象
     * @return 影响行数
     */
    int insert(Sysa sysa);

    /**
     * 批量新增数据（MyBatis原生foreach方法）
     *
     * @param entities List<Sysa> 实例对象列表
     * @return 影响行数
     */
    int insertBatch(@Param("entities") List<Sysa> entities);

    /**
     * 批量新增或按主键更新数据（MyBatis原生foreach方法）
     *
     * @param entities List<Sysa> 实例对象列表
     * @return 影响行数
     * @throws org.springframework.jdbc.BadSqlGrammarException 入参是空List的时候会抛SQL语句错误的异常，请自行校验入参
     */
    int insertOrUpdateBatch(@Param("entities") List<Sysa> entities);

    /**
     * 修改数据
     *
     * @param sysa 实例对象
     * @return 影响行数
     */
    int update(Sysa sysa);

    /**
     * 通过主键删除数据
     *
     * @param userid 主键
     * @return 影响行数
     */
    int deleteById(Integer userid);

}

