package com.paul9537.Gram.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptUtils {
	
	public static String md5(String message) {
		String resultData = "";
		
		try {
			MessageDigest md = MessageDigest.getInstance("md5");
	
			byte[] bytes = message.getBytes();
			
			md.update(bytes);

			byte[] digest = md.digest();

			for(int i = 0; i < digest.length; i++) {
				resultData += Integer.toHexString(digest[i] & 0xff);

			}
			
		} catch (NoSuchAlgorithmException e) {
			
			e.printStackTrace();
			return null;
		}
		
		return resultData;
	}
}
