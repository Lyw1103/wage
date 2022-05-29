package com.gx.listener;

import com.gx.util.LoginSessionManager;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionListener implements HttpSessionListener {

    private static final Logger logger= LogManager.getLogger(SessionListener.class);
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        logger.info("Session创建：sessionId="+se.getSession().getId());
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        logger.info("Session移除：sessionId="+se.getSession().getId());
        LoginSessionManager.getInstance().removeBySessionId(se.getSession().getId());
    }
}
