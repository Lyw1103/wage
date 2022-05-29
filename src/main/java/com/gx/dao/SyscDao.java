package com.gx.dao;

import com.gx.po.Sysc;
import com.gx.vo.workerVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Pageable;
import java.util.List;

/**
 * (Sysc)表数据库访问层
 *
 * @author makejava
 * @since 2021-12-20 10:59:37
 */
public interface SyscDao {

    /**
     * 分页查询员工信息
     * @param page
     * @param limit
     * @return
     */
    List<Sysc> tablepageList(
            @Param("page") int page,
            @Param("limit") int limit,
            @Param("workernumber") String workernumber,
            @Param("name") String name,
            @Param("department") String department);
    int counttablepage(
            @Param("workernumber") String workernumber,
            @Param("name") String name,
            @Param("department") String department);

    List<workerVo> wagespageList(
            @Param("page") int page,
            @Param("limit") int limit);
    int countwagespage();

    /**
     * 查询
     * @param name
     * @param workernumber
     * @return
     */
    Sysc queryById(
            @Param("name") String name,
            @Param("workernumber") String workernumber);

    /**
     * 查询指定行数据
     *
     * @param sysc 查询条件
     * @param pageable         分页对象
     * @return 对象列表
     */
    List<Sysc> queryAllByLimit(Sysc sysc, @Param("pageable") Pageable pageable);

    List<Sysc> query();
    List<Sysc> queryA();

    /**
     * 统计总行数
     *
     * @param sysc 查询条件
     * @return 总行数
     */
    long count(Sysc sysc);

    /**
     * 新增数据
     *
     * @param sysc 实例对象
     * @return 影响行数
     */
    int insert(Sysc sysc);

    /**
     * 批量新增数据（MyBatis原生foreach方法）
     *
     * @param entities List<Sysc> 实例对象列表
     * @return 影响行数
     */
    int insertBatch(@Param("entities") List<Sysc> entities);

    /**
     * 批量新增或按主键更新数据（MyBatis原生foreach方法）
     *
     * @param entities List<Sysc> 实例对象列表
     * @return 影响行数
     * @throws org.springframework.jdbc.BadSqlGrammarException 入参是空List的时候会抛SQL语句错误的异常，请自行校验入参
     */
    int insertOrUpdateBatch(@Param("entities") List<Sysc> entities);

    /**
     * 修改数据
     *
     * @param sysc 实例对象
     * @return 影响行数
     */
    int update(Sysc sysc);

    /**
     * 通过主键删除数据
     *
     * @param workerid 主键
     * @return 影响行数
     */
    int deleteById(Integer workerid);

}

