package com.gx.controller;

import com.gx.po.Sysc;
import com.gx.service.SyscService;
import com.gx.vo.JsonMsg;
import com.gx.vo.LayuiTableData;
import com.gx.vo.workerVo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (Sysc)表控制层
 *
 * @author makejava
 * @since 2021-12-20 10:59:00
 */
@RestController
@RequestMapping("/sysc")
public class SyscController {
    /**
     * 服务对象
     */
    @Resource
    private SyscService syscService;

    /**
     * 分页查询员工信息
     */
    @RequestMapping(value = "/tablepage",produces = "application/json;charset=utf-8")
    @ResponseBody
    public LayuiTableData<Sysc> tablepage(Integer page, Integer limit,String workernumber,String name,String department) {
        return this.syscService.tablepage(page,limit,workernumber,name,department);
    }

    @RequestMapping(value = "/wagespage",produces = "application/json;charset=utf-8")
    @ResponseBody
    public LayuiTableData<workerVo> wagespage(Integer page, Integer limit) {
        return this.syscService.wagespage(page,limit);
    }

    /**
     * 分页查询
     *
     * @param sysc 筛选条件
     * @param pageRequest      分页对象
     * @return 查询结果
     */
    @GetMapping
    public ResponseEntity<Page<Sysc>> queryByPage(Sysc sysc, PageRequest pageRequest) {
        return ResponseEntity.ok(this.syscService.queryByPage(sysc, pageRequest));
    }

    /**
     * 查询
     * @param name
     * @param workernumber
     * @return
     */
    @RequestMapping(value = "/queryById",produces = "application/json;charset=utf-8")
    @ResponseBody
    public JsonMsg queryById(String name, String workernumber) {
        JsonMsg jsonMsg=new JsonMsg();
            Sysc Sysc=this.syscService.queryById(name,workernumber);
            jsonMsg.setState(true);
            jsonMsg.setData(Sysc);//通过jsonMsg data把数据返回
            if(Sysc==null){
                jsonMsg.setState(false);
                jsonMsg.setMsg("查询到的数据为空!");
            }
        return jsonMsg;
    }

    /**
     * 新增数据
     *
     * @param sysc 实体
     * @return 新增结果
     */
    @RequestMapping(value = "/add",produces = "application/json;charset=utf-8")
    @ResponseBody
    public JsonMsg add(Sysc sysc) {
        JsonMsg jsonMsg=new JsonMsg();
        Integer row=this.syscService.insert(sysc);
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
     * @param sysc 实体
     * @return 编辑结果
     */
    @RequestMapping(value = "/edit",produces = "application/json;charset=utf-8")
    @ResponseBody
    public JsonMsg edit(Sysc sysc) {
        JsonMsg jsonMsg=new JsonMsg();
        Integer row=this.syscService.update(sysc);
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
        return ResponseEntity.ok(this.syscService.deleteById(id));
    }

}

