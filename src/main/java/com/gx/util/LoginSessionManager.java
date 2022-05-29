package com.gx.util;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class LoginSessionManager {

    private static final Logger logger=LogManager.getLogger(LoginSessionManager.class);

    private static final LoginSessionManager loginSessionManager=new LoginSessionManager();
    private final Map<Integer,String> loginSessionMap=new HashMap<>();

    private LoginSessionManager() {
    }

    public static LoginSessionManager getInstance(){
        return loginSessionManager;
    }

    /**
     * 登录时记录用户ID和sessionId
     * @param userId 用户ID
     * @param sessionId sessionId
     */
    public void addLoginSession(Integer userId,String sessionId){
        //处理 用户A登录后不退出，直接到登录页面用户B登录的情况
        removeBySessionId(sessionId);
        if (userId!=null && Tools.isNotNull(sessionId)){
            String oldSessionId=loginSessionMap.put(userId,sessionId);
            if (oldSessionId!=null){
                logger.info("旧的sessionId被移除，userId="+userId+";sessionId="+sessionId);
            }
        }
    }

    /**
     * 根据用户Id获取sessionId
     * @param userId 用户id
     * @return sessionId
     */
    public String getSessionIdByUserId(Integer userId){
        String sessionId=loginSessionMap.get(userId);
        if (sessionId==null){
            sessionId="";
        }
        return sessionId;
    }

    /**
     * 根据SessionId移除相关记录
     * @param sessionId sessionId
     */
    public void removeBySessionId(String sessionId){
        List<Integer> removeKeys=new ArrayList<>();
        for (Map.Entry<Integer,String> entry:loginSessionMap.entrySet()) {
            if (entry.getValue()!=null && entry.getValue().equals(sessionId)){
                removeKeys.add(entry.getKey());
            }
        }
        for (Integer key:removeKeys) {
            loginSessionMap.remove(key);
        }
    }




}
