package com.jim.google.auth.util;

/**
 * @author jim乔仕举
 * @version V1.0
 * @Title: GoogleAuthOTP.java
 * @Package com.jim.google.auth.util
 * @Description: 使用方法:
 * String url = GoogleAuth.OTP().account("[账号]").secretKey("[密钥]").issuer("[厂商]").build();
 * @date 2016年03月14日 上午9:31
 */
public class GoogleAuthOTP {
    /**
     * 账号
     */
    private String account;
    /**
     * 密钥
     */
    private String secretKey;
    /**
     * 厂商
     */
    private String issuer;

    public String build() {
        return String.format("otpauth://totp/%s?secret=%s&issuer=%s",
                this.account, this.secretKey, this.issuer);
    }

    public GoogleAuthOTP account(String account) {
        this.account = account;
        return this;
    }

    public GoogleAuthOTP secretKey(String secretKey) {
        this.secretKey = secretKey;
        return this;
    }

    public GoogleAuthOTP issuer(String issuer) {
        this.issuer = issuer;
        return this;
    }
}
