package com.serviceUtil;

import org.springframework.stereotype.Component;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.util.*;

@Component
public class SecurityUtil {

    static SecurityUtil instance;
    public static SecretKey secretKey;
    public static IvParameterSpec spec;

    public static String securitySpec = "AES/CBC/PKCS5Padding";

    private static String masterKey = "skg_06E85@abcdef";

    public static SecurityUtil getInstance() throws Exception{
        if(instance == null){
            synchronized (SecurityUtil.class){
                instance = new SecurityUtil();
                secretKey = new SecretKeySpec(masterKey.getBytes(StandardCharsets.UTF_8), "AES");

                new SecureRandom().nextBytes(new byte[16]);
                spec = new IvParameterSpec(new byte[16]);
            }
        }
        return instance;
    }

    public static SecretKey getKey() throws Exception {
        return SecurityUtil.getInstance().secretKey;
    }

    public static IvParameterSpec getIv() throws Exception{
        return SecurityUtil.getInstance().spec;
    }

    public static String getSecuritySpec() throws Exception{
        return SecurityUtil.getInstance().securitySpec;
    }

    public static String encrypt(String specName, SecretKey key, IvParameterSpec iv,
                                 String plainText) throws Exception {
        Cipher cipher = Cipher.getInstance(specName);
        cipher.init(Cipher.ENCRYPT_MODE, key, iv);
        byte[] encrypted = cipher.doFinal(plainText.getBytes(StandardCharsets.UTF_8));
        return new String(Base64.getEncoder().encode(encrypted));
    }

    public static StringBuffer encChar(String str) throws Exception{
        StringBuffer strEnc = new StringBuffer();
        for(int i = 0; i < str.length(); i++){
            strEnc.append(SecurityUtil.encrypt(SecurityUtil.getInstance().getSecuritySpec(), SecurityUtil.getInstance().getKey(), SecurityUtil.getInstance().getIv(), String.valueOf(str.charAt(i))));
        }
        return strEnc;
    }

    public static String decrypt(String specName, SecretKey key, IvParameterSpec iv,
                                 String cipherText) throws Exception {
        Cipher cipher = Cipher.getInstance(specName);
        cipher.init(Cipher.DECRYPT_MODE, key, iv);
        byte[] decrypted = cipher.doFinal(Base64.getDecoder().decode(cipherText));
        return new String(decrypted, StandardCharsets.UTF_8);
    }

    public Map<String, Object> test(String testStr) throws Exception{

        Map<String, Object> rMap = new HashMap<String, Object>();
        rMap.put("encrypt", encChar(testStr).toString());
        return rMap;
    }

    public List<String> at(String param){
        String marker = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z";
        String marker2 = ".-,-...,-.-.,-..,.,..-.,--.,....,..,.---,-.-,.-..,--,-.,---,.--.,--.-,.-.,...,-,..-,...-,.--,-..-,-.--,--..";
        List<String> rList = new ArrayList<String>();
        for(int i = 0; i < param.length(); i++){
            char c = param.charAt(i);
            String str[] = marker.split(",");
            for(int j = 0; j < str.length; j++){
                if(String.valueOf(c).equals(str[j])){
                    String keyName = "key"+i;
                    String value[] = marker2.split(",");
                    rList.add(value[j]);
                    break;
                } else {

                }
            }
        }
        return rList;
    }

    public Map<String, Object> atRev(String param){
        String marker = ".-,-...,-.-.,-..,.,..-.,--.,....,..,.---,-.-,.-..,--,-.,---,.--.,--.-,.-.,...,-,..-,...-,.--,-..-,-.--,--..";
        String marker2 = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z";
        StringBuffer sb = new StringBuffer();
        Map<String, Object> rMap = new HashMap<String, Object>();

        String mos[] = marker.split(",");
        for(int i = 0; i < mos.length; i++){
            if(mos[i].equals(param)){
                String markerStr[] = marker2.split(",");
                for(int j = 0; j < markerStr.length; j++){
                    if(i == j){
                        sb.append(markerStr[j]);
                    }
                }
            }
        }
        rMap.put("data", sb.toString());
        return rMap;
    }
}
