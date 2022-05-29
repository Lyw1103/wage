package com.gx.controller;

import com.gx.po.Sysc;
import com.gx.po.Sysd;
import com.gx.service.SysdService;
import com.gx.vo.JsonMsg;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (Sysd)表控制层
 *
 * @author makejava
 * @since 2021-12-21 15:04:38
 */
@RestController
@RequestMapping("/sysd")
public class SysdController {
    /**
     * 服务对象
     */
    @Resource
    private SysdService sysdService;

    /**
     * 分页查询
     *
     * @param sysd 筛选条件
     * @param pageRequest      分页对象
     * @return 查询结果
     */
    @GetMapping
    public ResponseEntity<Page<Sysd>> queryByPage(Sysd sysd, PageRequest pageRequest) {
        return ResponseEntity.ok(this.sysdService.queryByPage(sysd, pageRequest));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("{id}")
    public ResponseEntity<Sysd> queryById(@PathVariable("id") Integer id) {
        return ResponseEntity.ok(this.sysdService.queryById(id));
    }

    /**
     * 新增数据
     *
     * @param sysd 实体
     * @return 新增结果
     */
    @PostMapping
    public ResponseEntity<Sysd> add(Sysd sysd) {
        return ResponseEntity.ok(this.sysdService.insert(sysd));
    }

    /**
     * 编辑数据
     *
     * @param sysd 实体
     * @return 编辑结果
     */
    @RequestMapping(value = "/edit",produces = "application/json;charset=utf-8")
    @ResponseBody
    public JsonMsg edit(Sysd sysd) {
        JsonMsg jsonMsg=new JsonMsg();
        Integer row=this.sysdService.update(sysd);
        if (row==1){
            jsonMsg.setState(true);
            jsonMsg.setMsg("成功");
        }else {
            jsonMsg.setMsg("失败");
        }
        return jsonMsg;
    }

    /**
     * 删除数据
     *
     * @param id 主键
     * @return 删除是否成功
     */
    @DeleteMapping
    public ResponseEntity<Boolean> deleteById(Integer id) {
        return ResponseEntity.ok(this.sysdService.deleteById(id));
    }

}

