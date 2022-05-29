package com.gx.controller;

import com.gx.po.Sysa;
import com.gx.service.SysaService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (Sysa)表控制层
 *
 * @author makejava
 * @since 2021-12-16 15:52:48
 */
@RestController
@RequestMapping("/sysa")
public class SysaController {
    /**
     * 服务对象
     */
    @Resource
    private SysaService sysaService;

    /**
     * 分页查询
     *
     * @param sysa 筛选条件
     * @param pageRequest      分页对象
     * @return 查询结果
     */
    @GetMapping
    public ResponseEntity<Page<Sysa>> queryByPage(Sysa sysa, PageRequest pageRequest) {
        return ResponseEntity.ok(this.sysaService.queryByPage(sysa, pageRequest));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("{id}")
    public ResponseEntity<Sysa> queryById(@PathVariable("id") Integer id) {
        return ResponseEntity.ok(this.sysaService.queryById(id));
    }

    /**
     * 新增数据
     *
     * @param sysa 实体
     * @return 新增结果
     */
    @PostMapping
    public ResponseEntity<Sysa> add(Sysa sysa) {
        return ResponseEntity.ok(this.sysaService.insert(sysa));
    }

//    /**
//     * 编辑数据
//     *
//     * @param sysa 实体
//     * @return 编辑结果
//     */
//    @PutMapping
//    public ResponseEntity<Sysa> edit(Sysa sysa) {
//        return ResponseEntity.ok(this.sysaService.update(sysa));
//    }

    /**
     * 删除数据
     *
     * @param id 主键
     * @return 删除是否成功
     */
    @DeleteMapping
    public ResponseEntity<Boolean> deleteById(Integer id) {
        return ResponseEntity.ok(this.sysaService.deleteById(id));
    }

}

