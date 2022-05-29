package com.gx.controller;

import com.gx.po.Sysc;
import com.gx.po.Sysf;
import com.gx.service.SysfService;
import com.gx.vo.JsonMsg;
import com.gx.vo.LayuiTableData;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (Sysf)表控制层
 *
 * @author makejava
 * @since 2021-12-22 16:39:17
 */
@RestController
@RequestMapping("/sysf")
public class SysfController {
    /**
     * 服务对象
     */
    @Resource
    private SysfService sysfService;

    @RequestMapping(value = "/tablepage",produces = "application/json;charset=utf-8")
    @ResponseBody
    public LayuiTableData<Sysf> tablepage(Integer page, Integer limit) {
        return this.sysfService.tablepage(page,limit);
    }

    /**
     * 分页查询
     *
     * @param sysf 筛选条件
     * @param pageRequest      分页对象
     * @return 查询结果
     */
    @GetMapping
    public ResponseEntity<Page<Sysf>> queryByPage(Sysf sysf, PageRequest pageRequest) {
        return ResponseEntity.ok(this.sysfService.queryByPage(sysf, pageRequest));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("{id}")
    public ResponseEntity<Sysf> queryById(@PathVariable("id") Integer id) {
        return ResponseEntity.ok(this.sysfService.queryById(id));
    }

    /**
     * 新增数据
     *
     * @param sysf 实体
     * @return 新增结果
     */
    @RequestMapping(value = "/add",produces = "application/json;charset=utf-8")
    @ResponseBody
    public JsonMsg add(Sysf sysf) {
        JsonMsg jsonMsg=new JsonMsg();
        Integer row=this.sysfService.insert(sysf);
        if (row==1){
            jsonMsg.setState(true);
            jsonMsg.setMsg("新增成功");
        }else {
            jsonMsg.setMsg("新增失败");
        }
        return jsonMsg;
    }

    /**
     * 编辑数据
     *
     * @param sysf 实体
     * @return 编辑结果
     */
    @RequestMapping(value = "/edit",produces = "application/json;charset=utf-8")
    @ResponseBody
    public JsonMsg edit(Sysf sysf) {
        JsonMsg jsonMsg=new JsonMsg();
        Integer row=this.sysfService.update(sysf);
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
        return ResponseEntity.ok(this.sysfService.deleteById(id));
    }

}

