package com.gx.controller;


import com.gx.po.Sysa;
import com.gx.po.Sysc;
import com.gx.po.Sysd;
import com.gx.po.Sysf;
import com.gx.service.*;
import com.gx.util.LoginSessionManager;
import com.gx.util.MD5Util;
import com.gx.util.ProjectParameter;
import com.gx.util.Tools;
import com.gx.vo.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("")
public class HomeController {
    //service
    @Autowired
    private ILoginService loginService;
    @Autowired
    private SysaService userService;
    @Resource
    private SyscService syscService;
    @Resource
    private SysdService sysdService;
    @Resource
    private SysfService sysfService;

    @RequestMapping("/home")
    public String index(HttpSession session, HttpServletRequest request) {
        Sysa loginUser= (Sysa)session.getAttribute(ProjectParameter.SESSION_USER);
        if (loginUser!=null){
            request.setAttribute("loginUser",loginUser);
            return "/home";
        }else {
            //未登录
            //重定向 到项目的根路径 跳转到login页面
            return "redirect:/";
        }
    }

    /**
     * 重置密码
     */
    @RequestMapping(value = "/resetPassword",produces = "application/json;charset=utf-8")
    @ResponseBody
    public JsonMsg resetPassword(Integer userid, String newPassword1,String password,HttpServletRequest request, HttpServletResponse response) {
        JsonMsg jsonMsg = new JsonMsg();
        HttpSession session = request.getSession();
        Sysa loginUser = (Sysa) session.getAttribute(ProjectParameter.SESSION_USER);

        String MiMa=loginUser.getUserpassword();//输入的原密码是否和数据库相同
        String userName=loginUser.getUsername();//获取userName

        if (userid!=null && userid>0) {
            if (Tools.isNotNull(newPassword1)) {
                //查询未修改的数据
                Sysa oldUser=this.loginService.selectUserByName(userName);
                //验证密码  md5(用户输入的密码+盐)
                String md5Pass= MD5Util.getMD5(password+oldUser.getSalt());
                if (MiMa.equals(md5Pass)){
                    Random random = new Random();
                    //生成一个随机的8位数作为盐   10000000 ~ 99999999
                    String salt = String.valueOf(random.nextInt(90000000) + 10000000);
                    //对输入的密码+盐 取MD5值
                    String userPassword = MD5Util.getMD5(newPassword1 + salt);
                    oldUser.setUserpassword(userPassword);
                    oldUser.setSalt(salt);
                    //调用修改方法
                    try {
                        boolean isOk = this.userService.update(oldUser);
                        if (isOk) {
                            jsonMsg.setState(true);
                            jsonMsg.setMsg("重置成功");
                        } else {
                            jsonMsg.setMsg("重置失败");
                        }
                    }catch (RuntimeException e){
                        jsonMsg.setMsg("重置失败");
                    }
                }else{
                    jsonMsg.setMsg("原密码输入错误");
                }
            } else {
                jsonMsg.setMsg("请输入新密码");
            }
        } else {
            jsonMsg.setMsg("非法访问");
        }
        return jsonMsg;
    }

    /**
     * 注销登录
     */
    @RequestMapping(value = "/loginOut",produces = "application/json;charset=utf-8")
    @ResponseBody
    public boolean loginOut(HttpSession session) {
        //从session中移除登录的用户记录
        session.removeAttribute(ProjectParameter.SESSION_USER);
        //移除记录的用户id和sessionId
        LoginSessionManager.getInstance().removeBySessionId(session.getId());
        return true;
    }

//***********首页开始*****************//
    /**
     * top
     * @return
     */
    @RequestMapping("/top")
    public String top(HttpSession session, HttpServletRequest request) {
        Sysa loginUser= (Sysa)session.getAttribute(ProjectParameter.SESSION_USER);
        if (loginUser!=null){
            request.setAttribute("loginUser",loginUser);
        }
        return "/top";
    }

    /**
     * left
     * @return
     */
    @RequestMapping("/left")
    public String left() {
        return "/left";
    }

    /**
     *page
     * @return
     */
    @RequestMapping("/page")
    public String page(HttpSession session, HttpServletRequest request) {
        Sysa loginUser= (Sysa)session.getAttribute(ProjectParameter.SESSION_USER);
        if (loginUser!=null){
            request.setAttribute("loginUser",loginUser);
        }
        return "/page";
    }
    /**
     * right
     * @return
     */
    @RequestMapping("/right")
    public String right(Model model) {
        List<Sysc> worker = this.syscService.query();
        model.addAttribute("worker", worker);
        List<Sysf> basesalary = this.sysfService.queryd();
        model.addAttribute("basesalary", basesalary);
        return "/right";
    }
    /**
     * tab
     * @return
     */
    @RequestMapping("/tab")
    public String tab() {
        return "/tab";
    }
    /**
     * error
     * @return
     */
    @RequestMapping("/error")
    public String error() {
        return "/error";
    }
    /**
     * password
     * @return
     */
    @RequestMapping("/password")
    public String password(HttpSession session, HttpServletRequest request) {
        Sysa loginUser= (Sysa)session.getAttribute(ProjectParameter.SESSION_USER);
        if (loginUser!=null){
            request.setAttribute("loginUser",loginUser);
        }
        return "/password";
    }
    /**
     * logout
     * @return
     */
    @RequestMapping("/logout")
    public String logout() {
        return "/logout";
    }

    /**
     * salaryitems
     * @return
     */
    @RequestMapping("/salaryitems")
    public String salaryitems(Model model) {
        List<Sysd> salaryitems = this.sysdService.queryd();
        model.addAttribute("salaryitems", salaryitems);
        return "/salaryitems";
    }

    /**
     * attendance
     * @return
     */
    @RequestMapping("/attendance")
    public String attendance(Model model) {
        List<Sysc> attendance = this.syscService.queryA();
        model.addAttribute("attendance", attendance);
        return "/attendance";
    }

    /**
     * salarydetails
     * @return
     */
    @RequestMapping("/salarydetails")
    public String salarydetails(Model model) {
        List<Sysc> worker = this.syscService.query();
        model.addAttribute("worker", worker);
        return "/salarydetails";
    }

    /**
     * basesalarymaintenance
     * @return
     */
    @RequestMapping("/basesalarymaintenance")
    public String basesalarymaintenance() {
        return "/basesalarymaintenance";
    }
}
