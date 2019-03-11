package com.tungmr.xuli;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hash {

	public static String hashPassword(String password ) throws NoSuchAlgorithmException{
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(password.getBytes());
		byte[] b = md.digest();
		StringBuffer stringBuffer = new StringBuffer();
		for (byte c : b) {
			stringBuffer.append(Integer.toHexString(c & 0xff).toString());
		}
		return stringBuffer.toString();
	}
	
	/*public static void main(String[] args) {
		String a = "tungmr";
		try {
			System.out.println(hashPassword(a));
		} catch (Exception e) {
			// TODO: handle exception
		}
	}*/
}
