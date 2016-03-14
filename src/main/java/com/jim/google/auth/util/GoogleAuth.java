package com.jim.google.auth.util;

import com.warrenstrange.googleauth.GoogleAuthenticator;
import com.warrenstrange.googleauth.GoogleAuthenticatorKey;

/**
 * @author jim乔仕举
 * @version V1.0
 * @Title: GoogleAuth.java
 * @Package com.jim.google.auth.util
 * @Description:
 * @date 2016年03月13日 下午9:38
 */
public class GoogleAuth {

    public static GoogleAuthOTP OTP(){
        return new GoogleAuthOTP();
    }

    public static String generateSecretKey() {
        GoogleAuthenticator gAuth = new GoogleAuthenticator();
        final GoogleAuthenticatorKey key = gAuth.createCredentials();
        return key.getKey();
    }

    /**
     *
     * @param value 账号
     * @param secretKey 密钥
     * @return
     */
    @Deprecated
    public static String generateOTPUrl(String value, String secretKey) {
        return String.format("otpauth://totp/%s?secret=%s", value, secretKey);
    }

    public static boolean login(String secretKey, int otp) {
        GoogleAuthenticator gAuth = new GoogleAuthenticator();
        return gAuth.authorize(secretKey, otp);
    }
}
