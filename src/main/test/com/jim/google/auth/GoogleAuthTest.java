package com.jim.google.auth;

import com.jim.google.auth.util.GoogleAuth;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

/**
 * @author jim乔仕举
 * @version V1.0
 * @Title: GoogleAuthTest.java
 * @Package com.jim.google.auth.util
 * @Description:
 * @date 2016年03月13日 下午9:39
 */
public class GoogleAuthTest {

    private Map<String, String> secretKeyMap = new HashMap<String, String>();

    @Test
    public void testLogin() throws Exception {
        // 登录名
        String loginName = "jim";

        // 生成密钥
        String secretKey = GoogleAuth.generateSecretKey();
        System.out.println(secretKey);

        // 存储关系
        secretKeyMap.put(loginName, secretKey);

        // 绑定客户端
        String otpUrl = GoogleAuth.generateOTPUrl(loginName, secretKey);
        System.out.println(otpUrl);

        // 获取密钥
        String secretKeyAsMap = secretKeyMap.get(loginName);
        System.out.println(secretKeyAsMap);

        // 登录验证
        boolean login = GoogleAuth.login(secretKeyAsMap, 10000);
        System.out.println(login);
    }
}