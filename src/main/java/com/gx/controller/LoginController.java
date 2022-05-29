package com.gx.controller;

import com.gx.po.Sysa;
import com.gx.service.ILoginService;
import com.gx.util.LoginSessionManager;
import com.gx.util.MD5Util;
import com.gx.util.ProjectParameter;
import com.gx.util.Tools;
import com.gx.util.ValidateImage.MathPngCaptcha;
import com.gx.vo.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;

@Controller
@RequestMapping("/login")
class LoginController {

    //service
    @Autowired
    private ILoginService loginService;

    /**
     * 登录页面
     */
    @RequestMapping("")
    public String index() {
        return "/login";
    }

    /**
     * 生成验证码图片
     */
    @RequestMapping("/identity")
    public void identity(HttpSession session,HttpServletResponse response) throws IOException {
        response.setContentType("image/png");//image/png image/jpeg image/gif
        //创建验证码工具类的实例
        MathPngCaptcha captcha = new MathPngCaptcha(135, 50);
        OutputStream out = response.getOutputStream();//获取字节输出流
        String identityKey = captcha.out(out);
        //把验证码保存到session中
        session.setAttribute(ProjectParameter.SESSION_LOGIN_IDENTITY, identityKey);

        System.out.println("验证码：" + identityKey);
        out.flush();
        out.close();
    }

    /**
     * 登录
     */
    @RequestMapping(value = "/doLogin",produces = "application/json;charset=utf-8")
    @ResponseBody
    public JsonMsg doLogin(HttpSession session,String username,String userpassword,String identityKey) {
        JsonMsg jsonMsg = new JsonMsg();
        //获取session中的验证码
        String sessionIdentityKey = (String) session.getAttribute(ProjectParameter.SESSION_LOGIN_IDENTITY);
        //数据验证
        if (Tools.isNotNull(sessionIdentityKey)) {
            //判断用户输入的验证码是否正确
            if (sessionIdentityKey.equalsIgnoreCase(identityKey)) {
                if (Tools.isNotNull(username)) {
                    if (Tools.isNotNull(userpassword)) {
                        //调用service层
                        Sysa dbUser = this.loginService.selectUserByName(username);
                        //判断是否查询出用户数据
                        if (dbUser != null) {
                            //验证密码  md5(用户输入的密码+盐)
                            String md5Pass= MD5Util.getMD5(userpassword+dbUser.getSalt());
                            if (dbUser.getUserpassword().equals(md5Pass)){
                                //登录成功
                                // 把dbUser保存到session中
                                session.setAttribute(ProjectParameter.SESSION_USER,dbUser);
                                //移除session中的验证码
                                session.removeAttribute(ProjectParameter.SESSION_LOGIN_IDENTITY);

                                //记录登录的用户Id 和 SessionId
                                LoginSessionManager.getInstance().addLoginSession(dbUser.getUserid(),session.getId());
                                // session.setMaxInactiveInterval(30);
                                jsonMsg.setState(true);//成功
                                jsonMsg.setMsg("登录成功");
                            }else {
                                jsonMsg.setMsg("密码错误");
                            }
                        } else {
                            jsonMsg.setMsg("用户不存在");
                        }
                    } else {
                        jsonMsg.setMsg("请输入正确密码");
                    }
                } else {
                    jsonMsg.setMsg("请输入用户名");
                }
            } else {
                jsonMsg.setMsg("验证码错误");
            }
        } else {
            jsonMsg.setMsg("非法访问");
        }

        return jsonMsg;
    }


    /**
     * 登出 注销登录
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
}