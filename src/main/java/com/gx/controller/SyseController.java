package com.gx.controller;

import com.gx.po.Sysc;
import com.gx.po.Syse;
import com.gx.service.SyseService;
import com.gx.vo.JsonMsg;
import com.gx.vo.LayuiTableData;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (Syse)表控制层
 *
 * @author makejava
 * @since 2021-12-22 08:32:12
 */
@RestController
@RequestMapping("/syse")
public class SyseController {
    /**
     * 服务对象
     */
    @Resource
    private SyseService syseService;

    @RequestMapping(value = "/tablepage",produces = "application/json;charset=utf-8")
    @ResponseBody
    public LayuiTableData<Syse> tablepage(Integer page, Integer limit, String workernumber, String name, String department) {
        return this.syseService.tablepage(page,limit,workernumber,name,department);
    }

    /**
     * 分页查询
     *
     * @param syse 筛选条件
     * @param pageRequest      分页对象
     * @return 查询结果
     */
    @GetMapping
    public ResponseEntity<Page<Syse>> queryByPage(Syse syse, PageRequest pageRequest) {
        return ResponseEntity.ok(this.syseService.queryByPage(syse, pageRequest));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("{id}")
    public ResponseEntity<Syse> queryById(@PathVariable("id") Integer id) {
        return ResponseEntity.ok(this.syseService.queryById(id));
    }

    /**
     * 新增数据
     *
     * @param syse 实体
     * @return 新增结果
     */
    @RequestMapping(value = "/add",produces = "application/json;charset=utf-8")
    @ResponseBody
    public JsonMsg add(Syse syse) {
        JsonMsg jsonMsg=new JsonMsg();
        Integer row=this.syseService.insert(syse);
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
     * @param syse 实体
     * @return 编辑结果
     */
    @RequestMapping(value = "/edit",produces = "application/json;charset=utf-8")
    @ResponseBody
    public JsonMsg edit(Syse syse) {
        JsonMsg jsonMsg=new JsonMsg();
        Integer row=this.syseService.update(syse);
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
        return ResponseEntity.ok(this.syseService.deleteById(id));
    }

}

