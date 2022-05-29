package com.gx.service;

import com.gx.po.Sysc;
import com.gx.vo.LayuiTableData;
import com.gx.vo.workerVo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.List;

/**
 * (Sysc)表服务接口
 *
 * @author makejava
 * @since 2021-12-20 10:59:39
 */
public interface SyscService {

    /**
     * 分页查询员工信息
     * @return
     */
    LayuiTableData<Sysc> tablepage(int page, int limit,String workernumber,String name,String department);

    /**
     * 分页查询员工信息
     * @return
     */
    LayuiTableData<workerVo> wagespage(int page, int limit);

    /**
     * 查询
     * @param name
     * @param workernumber
     * @return
     */
    Sysc queryById(String name, String workernumber);

    /**
     * 分页查询
     *
     * @param sysc 筛选条件
     * @param pageRequest      分页对象
     * @return 查询结果
     */
    Page<Sysc> queryByPage(Sysc sysc, PageRequest pageRequest);

    List<Sysc> query();
    List<Sysc> queryA();


    /**
     * 新增数据
     *
     * @param sysc 实例对象
     * @return 实例对象
     */
    Integer insert(Sysc sysc);

    /**
     * 修改数据
     *
     * @param sysc 实例对象
     * @return 实例对象
     */
    Integer update(Sysc sysc);

    /**
     * 通过主键删除数据
     *
     * @param workerid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer workerid);

}
