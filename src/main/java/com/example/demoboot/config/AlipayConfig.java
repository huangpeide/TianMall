package com.example.demoboot.config;

import java.io.FileWriter;
import java.io.IOException;

public final class AlipayConfig {

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016092300575954";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDSGp77Z9s2JtU1bda33BbsewDSggb8qhOi+1Vl+t7jReFPDJkVEeCuUTrkZKxgHeTZpD3LJjO1h32nZg+O0BEen5CpqE4DOyR5ee5UbrSRqwZ0DQXcosXanKY4rGXyoKGuqRk2ywiLl0gMeUnIMVpUS2sCtUxV/9pW604mVd8ckN78s9Rjc/cNV/y73RBGQEpodH8TmN6JS7JzksTClaM1vudQdqY2M1EFxwDxphg6tV+zg2Slja7Lzc5DmUqpxmsjDVU+UQRoc11fRvA6g5u2J2YYnNusr76HUyHy4Ok2pCNNHWxcx13vHa6qity5XoG5+916dPLRfRXzbDVMpVLHAgMBAAECggEBAMGYzg2SMSfAuI023LcmEeltneBa990xSk7PkG0bsO1yop2YWiZUBtgY+U8ihMM8SHdTI61hUhxe8KWjIYrSpjO1jDMIZnoLsRxOAhHCwJfJI3Uj2tbnFbDOz0tBb98VrGWoYxdeFk2p5DW6PQY+k6FArSYdsG0+CA43XBdu4NsL50TqtOuedsldQmBOXP6d2ED3PfMl/M549b4MYsIbTE0pR0E8V9P+fdapTDNdUfXh5y/umm5yIOQB1ieVHR3GoHk+cUACWjP9Ef62kCYlQ/rAOFY5sshgriF7Hk+oJb4YqOBfLdwUKppOohp2oIzfnR+m3XPMO+1J9R469DRJG0ECgYEA6KF4pSMLdCd8wScDaDfS2Wr8Jlfyo6pnoOLpFc69FGJxkgbZ6eO03KCPPrxsrfX3nR0zgVWqRbmw+fvh2Q4H03vbVdjWxJjlg8FI+hKPwoOmLM2hsidON2YrqM60fyTTtVr5LvHAkULt3ldzJ7CSHHuzTns8e0VdaCbEaPNqmtkCgYEA5zXVJX3P7APevnLzNIYqd0lFJBrysHcw975nYMl+3LCm91XFqlRVGw+bA0k+esm8VMhg5xsh97iVwejhDabI29rRKZvk7vMmYw39oJIupXYcjcvYg8Y+aow7gBT4Nvf2JW7tj6D5pX3N2fOWblwS1+jjUg8i1LyUMoET5+PUlp8CgYA8rGiwAWzqVaY3JnrAAtdOd5XeVk/lmfs/Pg927Z3pJCfk4z6QvyAb7xCNV02tLZrwcn5NfE9VsjHTcXudRgiKgyJYyJ5zVkF+VLo45wBxxi5gPx2uPowq7M30UD1JcAx7n4egU9Naz68Er6BMOMRTA3xnusKykAvlrz7I9LvYOQKBgB8uDU5/BvknFHTOf6nHphZsFRznXW8aw8nFLZ/JzIfqcrnMIVn1AX0iv57T088vQWyVkSvZZt1HUTrTMvZqVZAAlFBuK5Nlyvl0u41Z6Vx67yLYKJyssWIhAy0kpsyS5+joarUB2mjM7GPGC7VaSVhAmddJH0NdIwckjRCqktK1AoGAbdPciqRMdR1H1ERrtqWP5VHEr627+s9Ui9Iya7gg5KuS3COkFd1htUWztxEYXewjoLeSkBuuZDsBt/Hf1b9lXjRdp4EZee/1buiwT751AQzmp7by2N3xemT6cZZzXA+mXTqO68Nfed9moRc5wdRloHZTp3c8MYD1eBUPiXLrpao=";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxi1fwQTb1/dGNYTz0Ztat2KxzZq+8EX82wCvqmOv4u3xwN98r+0ecF4zWQw0y3GULREyQING7SBMagGBHJmkGM+h2Gl7nTY8/ovE+kjyz53senovm2sQWQzDvtUfYqJEyKUvnMCnIbAE4dXJp9UCUad/M1Hnjk5IbCrUKOtYLRF4gkDLObpA/eKP01BAMTJ9FrG2OnjfBjGlYOzB40/BqjC6/Gh8HCkFO17Iqz/Au00PawV2X2Fz84D6Bd0jbB+rbO/85n04eL/sBM1d83uVdT0PKczLPYOrk/4Tdrc5U0Pmf6qQcqT/KHyABQ+ra4cDwgKykOSZD6PkfwG7jvd1OQIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8080/tiantian/alipayNotifyNotice";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问alipayReturnNotice
    public static String return_url = "http://localhost:8080/tiantian/alipayReturnNotice";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "D:\\";


    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis() + ".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

